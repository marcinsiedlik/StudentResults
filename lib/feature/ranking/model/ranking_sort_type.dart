import 'package:freezed_annotation/freezed_annotation.dart';

part 'ranking_sort_type.freezed.dart';

@freezed
abstract class RankingSortType with _$RankingSortType {
  const factory RankingSortType.placeDesc() = PlaceDesc;

  const factory RankingSortType.placeAsc() = PlaceAsc;
}
