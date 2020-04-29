import 'package:injectable/injectable.dart';
import 'package:results/base/extensions/router_extensions.dart';
import 'package:results/base/network/data_source/model/student_details/student_details.dart';
import 'package:results/base/network/data_source/repository/student_repository.dart';
import 'package:results/base/ui/call_state/call_state.dart';
import 'package:results/base/ui/notifier/base_notifier.dart';

@injectable
class StudentDetailsNotifier extends BaseNotifier {
  final StudentRepository _repository;
  final String _studentIndex;

  StudentDetailsNotifier(
    this._repository,
    @factoryParam this._studentIndex,
  ) {
    _fetchStudentDetails();
  }

  final studentDetailsState = CallState<StudentDetails>();

  void _fetchStudentDetails() async {
    dispatch(
      callState: studentDetailsState,
      block: () => _repository.getStudentDetails(_studentIndex),
      onError: RouterExtensions.showErrorFlushbar,
    );
  }

  void onRetryClicked() {
    _fetchStudentDetails();
  }
}
