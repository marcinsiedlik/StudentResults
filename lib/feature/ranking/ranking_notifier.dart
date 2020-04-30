import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:results/base/extensions/router_extensions.dart';
import 'package:results/base/network/data_source/mapper/student/ranking_data_internal_mapper.dart';
import 'package:results/base/network/data_source/model/student/ui/ui_ranking_data.dart';
import 'package:results/base/network/data_source/model/student/ui/ui_student.dart';
import 'package:results/base/network/data_source/repository/student_repository.dart';
import 'package:results/base/ui/call_state/call_state.dart';
import 'package:results/base/ui/notifier/base_notifier.dart';
import 'package:results/base/ui/routes/router.gr.dart';
import 'package:results/feature/ranking/model/ranking_sort_type.dart';

@injectable
class RankingNotifier extends BaseNotifier {
  final StudentRepository _repository;
  final RankingDataInternalMapper _mapper;

  RankingNotifier(
    this._repository,
    this._mapper,
  ) {
    _fetchStudents();
  }

  String _searchQuery;
  UiRankingData _rankingData;
  RankingSortType sortType = RankingSortType.placeDesc();

  final studentsState = CallState<UiRankingData>();

  void _fetchStudents() async {
    dispatch<UiRankingData>(
      callState: studentsState,
      block: () async {
        final data = await _repository.getStudents();
        return _mapper.map(data);
      },
      onSuccess: (data) => _rankingData = data,
      onError: RouterExtensions.showErrorFlushbar,
    );
  }

  void onRetryPressed() {
    _fetchStudents();
  }

  void onSearchChanged(String text) {
    _searchQuery = text;
    _updateRankingData();
  }

  void onSortSelected(RankingSortType type) {
    sortType = type;
    _updateRankingData();
  }

  void onStudentClicked(UiStudent student) {
    final nextStudent = student.placeType.when(
      first: () => null,
      second: () => _rankingData.first,
      third: () => _rankingData.second,
      other: (place) => place == 4 ? _rankingData.third : _rankingData.other[_rankingData.other.indexOf(student) - 1],
    );
    ExtendedNavigator.ofRouter<Router>().pushStudentDetailsPage(selectedStudent: student, nextStudent: nextStudent);
  }

  void _updateRankingData() {
    final list = KtList.from(_rankingData.other);
    final filtered = list.filter((e) => e.index.startsWith(_searchQuery ?? ''));
    final sorted = sortType.when(
      placeDesc: () => filtered.sortedBy((e) => e.place),
      placeAsc: () => filtered.sortedByDescending((e) => e.place),
    );
    studentsState.data = _rankingData.copyWith(other: sorted.asList());
    notifyListeners();
  }
}
