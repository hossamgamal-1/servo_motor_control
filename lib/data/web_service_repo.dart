import 'package:servo_web_server/data/remote_data_base/web_services.dart';

class WebServicesRepo {
  final WebServices _webServices;
  WebServicesRepo(this._webServices);

  Future<void> setServoAngle(String baseUrl, int angle) async {
    return await _webServices.setServoAngle(baseUrl, angle);
  }
}
