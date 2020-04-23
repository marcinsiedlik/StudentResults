import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_response.freezed.dart';

part 'error_response.g.dart';

@freezed
abstract class ErrorResponse with _$ErrorResponse {
  const factory ErrorResponse({
    String timestamp,
    int status,
    String error,
    String message,
    String path,
  }) = _ErrorResponse;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => _$ErrorResponseFromJson(json);
}
