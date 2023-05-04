import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servo_web_server/data/web_service_repo.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(this._webServicesRepo) : super(AppInitialState());
  final WebServicesRepo _webServicesRepo;
  String _baseUrl = '';
  int _angle = 0;
  int get angle => _angle;

  void updateLocalBaseUrlValue(String newBaseUrl) {
    _baseUrl = newBaseUrl;
    print(_baseUrl);
    emit(UiChangedState());
  }

  void updateLocalServoAngle(double newAngle) {
    _angle = newAngle.round();
    emit(UiChangedState());
  }

  void updateLocalServoAngleFromField(String newAngle) {
    int? localAngle = int.tryParse(newAngle);
    if (localAngle != null) {
      if (localAngle < 180) {
        _angle = int.tryParse(newAngle)!;
      }
    } else {
      _angle = 0;
    }
    emit(UiChangedState());
  }

  Future<void> updateRemoteServoAngle() async {
    print(_baseUrl);
    await _webServicesRepo.setServoAngle(_baseUrl, _angle);
  }
}
