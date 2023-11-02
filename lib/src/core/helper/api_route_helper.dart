
import '../constants/api_route_constants.dart';

class ApiRouteHelper {
  static String getBaseUrl() =>
      "${ApiRouteConstants.getBaseUrl()}${ApiRouteConstants.basePath}/";
}