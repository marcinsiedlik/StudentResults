import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_student.freezed.dart';

part 'network_student.g.dart';

@freezed
abstract class NetworkStudent with _$NetworkStudent {
  const factory NetworkStudent(
    String index,
    double mark,
    String group,
    int lecturePoints,
    int homeworkPoints,
    int presenceCounter,
    int absenceCounter,
    int allPoints,
  ) = _NetworkStudent;

  factory NetworkStudent.fromJson(Map<String, dynamic> json) => _$NetworkStudentFromJson(json);
}
