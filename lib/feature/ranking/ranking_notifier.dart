import 'package:injectable/injectable.dart';
import 'package:results/base/extensions/router_extensions.dart';
import 'package:results/base/network/data_source/mapper/student/students_ui_mapper.dart';
import 'package:results/base/network/data_source/model/student/ui/ui_student.dart';
import 'package:results/base/network/data_source/repository/student_repository.dart';
import 'package:results/base/ui/call_state/call_state.dart';
import 'package:results/base/ui/notifier/base_notifier.dart';

@injectable
class RankingNotifier extends BaseNotifier {
  final StudentRepository _repository;
  final StudentsUiMapper _uiMapper;

  RankingNotifier(this._repository, this._uiMapper) {
    _fetchStudents();
  }

  final studentsState = CallState<List<UiStudent>>();

  void _fetchStudents() async {
    dispatch<List<UiStudent>>(
      callState: studentsState,
      block: () async {
        final data = await _repository.getStudents();
        return _uiMapper.mapToUi(data);
      },
      onError: RouterExtensions.showErrorFlushbar,
    );
  }

  void onStudentClicked(UiStudent student) {}
}
