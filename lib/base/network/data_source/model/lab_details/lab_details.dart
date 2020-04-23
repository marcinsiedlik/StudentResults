import 'package:freezed_annotation/freezed_annotation.dart';

part 'lab_details.freezed.dart';

part 'lab_details.g.dart';

@freezed
abstract class LabDetails with _$LabDetails {
  const factory LabDetails(
    String dateOfLab,
    bool presence,
    int points,
  ) = _LabDetails;

  factory LabDetails.fromJson(Map<String, dynamic> json) => _$LabDetailsFromJson(json);
}
