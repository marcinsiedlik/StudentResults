import 'package:injectable/injectable.dart';
import 'package:results/base/network/data_source/model/student/student.dart';
import 'package:results/base/network/data_source/model/student_details/student_details.dart';
import 'package:results/base/network/data_source/repository/student_repository.dart';
import 'package:results/base/network/data_source/service/rest_service.dart';
import 'package:results/base/network/repository/base_repository.dart';

@lazySingleton
@RegisterAs(StudentRepository)
class StudentRepositoryImpl extends BaseRepository implements StudentRepository {
  final RestService _service;

  StudentRepositoryImpl(this._service);

  @override
  Future<List<Student>> getStudents() => call(() => _service.getStudents());

  @override
  Future<StudentDetails> getStudentDetails(String index) => call(() => _service.getStudentDetails(index));
}
