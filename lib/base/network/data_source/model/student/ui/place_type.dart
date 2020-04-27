import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_type.freezed.dart';

part 'place_type.g.dart';

@freezed
abstract class PlaceType with _$PlaceType {
  const factory PlaceType.first() = First;

  const factory PlaceType.second() = Second;

  const factory PlaceType.third() = Third;

  const factory PlaceType.other(int place) = Other;

  factory PlaceType.fromJson(Map<String, dynamic> json) => _$PlaceTypeFromJson(json);
}
