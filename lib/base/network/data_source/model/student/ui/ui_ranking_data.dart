import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:results/base/network/data_source/model/student/ui/ui_student.dart';

part 'ui_ranking_data.freezed.dart';

part 'ui_ranking_data.g.dart';

@freezed
abstract class UiRankingData with _$UiRankingData {
  const factory UiRankingData({
    @required UiStudent first,
    @required UiStudent second,
    @required UiStudent third,
    @required List<UiStudent> other,
  }) = _UiRankingData;

  factory UiRankingData.fromJson(Map<String, dynamic> json) => _$UiRankingDataFromJson(json);
}
