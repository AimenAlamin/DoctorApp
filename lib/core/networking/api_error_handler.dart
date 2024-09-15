import 'package:dio/dio.dart';

import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: "Connection to server failed");
        case DioExceptionType.cancel:
          return ApiErrorModel(message: "Request to the server was cancelled");
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: "Connection timeout with the server");
        case DioExceptionType.unknown:
          return ApiErrorModel(
              message:
                  "Connection to server failed due to internet connection");
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
              message: "Receive timeout in connection with the server");
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
              message: "Send timeout in connection with the server");
        default:
          return ApiErrorModel(message: "Something went wrong");
      }
    } else {
      return ApiErrorModel(message: "Unknown error occured");
    }
  }
}

// ApiErrorModel _handleError(dynamic data) {
//   return ApiErrorModel(
//     message: data['message'] ?? "Unknown error occured",
//     code: data['code'],
//     errors: data['data'],
//   );
// }
ApiErrorModel _handleError(dynamic data) {
  // Check if the 'data' field contains a list or a map
  if (data['data'] is List) {
    // If it's a list, join the list elements into a single string message
    return ApiErrorModel(
      message: "Sign Up first",
      code: data['code'],
      errors: {
        "error": ["Sign Up first"] // Set custom error message here
      }, // converting list to map format for consistency
    );
  } else if (data['data'] is Map) {
    // Handle map data as usual
    return ApiErrorModel(
      message: data['message'] ?? "Unknown error occurred",
      code: data['code'],
      errors: data['data'],
    );
  } else {
    return ApiErrorModel(
      message: "Unknown error occurred",
      code: data['code'],
      errors: {},
    );
  }
}
