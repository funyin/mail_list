import 'package:json_annotation/json_annotation.dart';

part 'api_error_response.g.dart';

@JsonSerializable()
class ApiErrorResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "errors")
  final dynamic errors;

  ApiErrorResponse ({
    this.message,
    this.errors,
  });

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) {
    return _$ApiErrorResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ApiErrorResponseToJson(this);
  }
}


