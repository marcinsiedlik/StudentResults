import 'package:injectable/injectable.dart';
import 'package:results/base/extensions/router_extensions.dart';
import 'package:results/base/network/data_source/mapper/student/ranking_data_internal_mapper.dart';
import 'package:results/base/network/data_source/model/student/ui/ui_ranking_data.dart';
import 'package:results/base/network/data_source/model/student/ui/ui_student.dart';
import 'package:results/base/network/data_source/repository/student_repository.dart';
import 'package:results/base/ui/call_state/call_state.dart';
import 'package:results/base/ui/notifier/base_notifier.dart';

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

  final studentsState = CallState<UiRankingData>();

  void _fetchStudents() async {
    dispatch<UiRankingData>(
      callState: studentsState,
      block: () async {
        final data = await _repository.getStudents();
        return _mapper.map(data);
      },
      onError: RouterExtensions.showErrorFlushbar,
    );
  }

  void onStudentClicked(UiStudent student) {
    print('student clicked: ${student.toString()}');
  }
}
