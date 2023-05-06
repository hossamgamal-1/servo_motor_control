import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/web_services.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(this._webServices) : super(AppInitialState());
  final WebServices _webServices;
  String _baseUrl = '';
  int _angle = 0;
  int get angle => _angle;

  void updateLocalBaseUrlValue(String newBaseUrl) {
    _baseUrl = newBaseUrl;
    emit(UiChangedState());
  }

  void updateLocalServoAngle(double newAngle) {
    _angle = newAngle.round();
    emit(UiChangedState());
  }

  void updateLocalServoAngleFromField(String newAngle) {
    int? localAngle = int.tryParse(newAngle);
    if (localAngle != null) {
      if (localAngle <= 180) {
        _angle = int.tryParse(newAngle)!;
      }
    } else {
      _angle = 0;
    }
    emit(UiChangedState());
  }

  Future<void> updateRemoteServoAngle() async {
    await _webServices.setServoAngle(_baseUrl, _angle);
  }
}
