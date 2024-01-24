
import 'package:dio/dio.dart';
import 'package:fluttertemplate/src/core/helper/failure.dart';
import 'package:fluttertemplate/src/domain/entities/activity_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:retrofit/http.dart';
part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://www.boredapi.com/api') 
abstract class RestClient {
factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/activity')
  Future< Activity> getActivity();
  
}