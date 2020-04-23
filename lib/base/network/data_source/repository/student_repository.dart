import 'package:results/base/network/data_source/model/student/student.dart';
import 'package:results/base/network/data_source/model/student_details/student_details.dart';

abstract class StudentRepository {
  Future<List<Student>> getStudents();

  Future<StudentDetails> getStudentDetails(String index);
}
