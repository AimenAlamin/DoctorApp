// ignore_for_file: depend_on_referenced_packages

import 'package:doctor/core/helpers/extensions.dart';
import 'package:json_annotation/json_annotation.dart';
// part 'test.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  String? message;
  int? code;
  final Map<String, dynamic>? errors;

  ApiErrorModel({this.code, this.message, this.errors});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  /// Returns a String containg all errors messages from the API
  String getAllErrorMessages() {
    if (errors.isNullOrEmpty()) return message ?? "Unknown Error Occured";
    final errorMessage = errors!.entries.map((entry) {
      final value = entry.value;
      return "${value.join(',')}";
    }).join('\n'); //spearting each error message
    return errorMessage;
  }
}
