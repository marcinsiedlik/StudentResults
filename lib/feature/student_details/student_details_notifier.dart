import 'package:injectable/injectable.dart';
import 'package:results/base/network/data_source/model/student/ui/ui_student.dart';
import 'package:results/base/network/data_source/repository/student_repository.dart';
import 'package:results/base/ui/notifier/base_notifier.dart';

@injectable
class StudentDetailsNotifier extends BaseNotifier {
  final StudentRepository _repository;
  final UiStudent _selectedStudent;
  final UiStudent _nextStudent;

  StudentDetailsNotifier(
    this._repository,
    @factoryParam this._selectedStudent,
    @factoryParam this._nextStudent,
  );

  UiStudent get student => _selectedStudent;
}
