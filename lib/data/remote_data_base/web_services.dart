import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: '')
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET('{customBaseUrl}/?value={angle}&')
  Future<void> setServoAngle(@Path() String customBaseUrl, @Path() int angle);
}
