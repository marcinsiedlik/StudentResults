import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:results/base/network/data_source/model/student/ui/place_type.dart';

part 'ui_student.freezed.dart';
part 'ui_student.g.dart';

@freezed
abstract class UiStudent with _$UiStudent {
  const factory UiStudent({
    @required int place,
    @required PlaceType placeType,
    @required String index,
    @required double mark,
    @required String group,
    @required int lecturePoints,
    @required int homeworkPoints,
    @required int presenceCounter,
    @required int absenceCounter,
    @required int allPoints,
  }) = _UiStudent;

  factory UiStudent.fromJson(Map<String, dynamic> json) => _$UiStudentFromJson(json);
}
