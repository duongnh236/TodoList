
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fluttertemplate/src/core/dio_service/dio_error.dart';
import 'package:fluttertemplate/src/core/dio_service/dio_service.dart';
import 'package:fluttertemplate/src/core/exception/exception.dart';
import 'package:fluttertemplate/src/domain/entities/activity_entity.dart';

class HomeService {

  HomeService(this.apiBaseCore);
  ApiBaseCore apiBaseCore;
    
 Future<Activity> testApi() async {
    try {
      final result = await apiBaseCore.getHTTP('https://www.boredapi.com/api/activity');
     return Activity.fromJson(result!.data);
    } on RestApiException catch (e) {
      log(e.message!);
      rethrow;
    }
  }
}