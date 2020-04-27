import 'package:results/base/network/data_source/model/student/network/network_student.dart';
import 'package:results/base/network/data_source/model/student_details/student_details.dart';

abstract class StudentRepository {
  Future<List<NetworkStudent>> getStudents();

  Future<StudentDetails> getStudentDetails(String index);
}
