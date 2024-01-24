import 'dart:io';
import 'package:dio/dio.dart';

extension DioErrorX on DioException {
  bool get isNoConnectionError =>
      type == DioExceptionType.connectionError &&
      error is SocketException; // import 'dart:io' for SocketException
}