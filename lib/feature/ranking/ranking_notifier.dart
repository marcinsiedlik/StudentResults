import 'package:injectable/injectable.dart';
import 'package:results/base/extensions/router_extensions.dart';
import 'package:results/base/network/data_source/model/student/student.dart';
import 'package:results/base/network/data_source/repository/student_repository.dart';
import 'package:results/base/ui/call_state/call_state.dart';
import 'package:results/base/ui/notifier/base_notifier.dart';

@injectable
class RankingNotifier extends BaseNotifier {
  final StudentRepository _repository;

  RankingNotifier(this._repository) {
    _fetchStudents();
  }

  final studentsState = CallState<List<Student>>();

  void _fetchStudents() async {
    dispatch(
      callState: studentsState,
      block: () => _repository.getStudents(),
      onError: RouterExtensions.showErrorFlushbar,
    );
  }

  void onStudentClicked(Student student) {}
}
