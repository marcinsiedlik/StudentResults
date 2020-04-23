import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:results/base/network/data_source/model/student/student.dart';
import 'package:results/base/network/data_source/model/student_details/student_details.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_service.g.dart';

@lazySingleton
@RestApi()
abstract class RestService {
  @GET('/students')
  Future<List<Student>> getStudents();

  @GET('/students/{index}')
  Future<StudentDetails> getStudentDetails(@Path('index') String index);

  @factoryMethod
  factory RestService(Dio dio) = _RestService;
}
