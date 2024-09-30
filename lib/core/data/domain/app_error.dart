import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mail_list/core/data/models/api_error_response.dart';

class AppError {
  late String message;
  int errorCode = 0;

  AppError(Object error, [StackTrace? trace, String? fallBackErrorMessage]) {
    // FirebaseCrashlytics.instance.recordError(error, trace);
    if (error is DioException) {
      var dioError = error;
      var errorResponse = dioError.response;
      errorCode = errorResponse?.statusCode ?? -1;
      switch (dioError.type) {
        case DioExceptionType.connectionTimeout:
          message = "Connection timeout";
          break;
        case DioExceptionType.sendTimeout:
          message = "Send timeout in connection";
          break;
        case DioExceptionType.receiveTimeout:
          message = "Receive timeout in connection";
          break;
        case DioExceptionType.badResponse:
          try {
            final apiErrorModel =
                ApiErrorResponse.fromJson(errorResponse?.data);
            message = apiErrorModel.message ?? "App Error. Bad response";
            errorCode = dioError.response!.statusCode!;
          } catch (error, stack) {
            message =
                errorResponse?.data["message"] ?? "App Error. Bad response";
          }
          break;
        case DioExceptionType.cancel:
          message = "Request was cancelled";
          break;
        case DioExceptionType.unknown:
          if (error.error is SocketException) {
            message = "No Internet connection";
          } else {
            message = "Unable to connect";
          }
          break;
        case DioExceptionType.badCertificate:
          message = "Unable to connect";
          break;
        case DioExceptionType.connectionError:
          message = "Connection failed due to internet connection";
          break;
      }
    } else {
      message = "App Error. Bad response";
    }
  }

  @override
  String toString() => message;
}
