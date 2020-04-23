import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:results/base/network/data_source/model/lab_details/lab_details.dart';

part 'student_details.freezed.dart';

part 'student_details.g.dart';

@freezed
abstract class StudentDetails with _$StudentDetails {
  const factory StudentDetails(
    String index,
    String group,
    List<LabDetails> labs,
  ) = _StudentDetails;

  factory StudentDetails.fromJson(Map<String, dynamic> json) => _$StudentDetailsFromJson(json);
}
