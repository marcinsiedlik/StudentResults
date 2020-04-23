import 'package:freezed_annotation/freezed_annotation.dart';

part 'student.freezed.dart';

part 'student.g.dart';

@freezed
abstract class Student with _$Student {
  const factory Student(
    String index,
    int mark,
    String group,
    int lecturePoints,
    int homeworkPoints,
    int presenceCounter,
    int absenceCounter,
    int allPoints,
  ) = _Student;

  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
}
