
import 'package:dio/dio.dart';
import 'package:fluttertemplate/src/core/dio_service/dio_error.dart';
import 'package:fluttertemplate/src/core/dio_service/dio_service.dart';
import 'package:fluttertemplate/src/core/dio_service/rest_client.dart';
import 'package:fluttertemplate/src/core/exception/exception.dart';
import 'package:fluttertemplate/src/domain/entities/activity_entity.dart';

class HomeService {

  HomeService(this.apiBaseCore);
  ApiBaseCore apiBaseCore;
    
 Future<Activity> testApi() async {
    final client = RestClient(apiBaseCore.baseAPI);
    try {
     final result = await client.getActivity();
     return result;
    } on DioException catch (e) {
      if (e.isNoConnectionError) {
        throw RestApiException(500, 'Server Error');
      }else if (e.response != null && e.response!.data != null) {
        throw RestApiException(
            e.response!.statusCode!, e.response!.data['message']!);
      } else {
        rethrow;
      }
    }
  }
}