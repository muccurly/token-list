import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jurta_app/src/data/repository/i_settings_repository.dart';
import 'package:jurta_app/src/utils/my_logger.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({
    required ISettingsRepository settingsRepository,
  })  : _settingsRepository = settingsRepository,
        super(AppState());

  final ISettingsRepository _settingsRepository;

  void addDeviceUuid() async {
    String? token = await FirebaseMessaging.instance.getToken();
    String platform = '';
    String version = '';
    if (token != null && await InternetConnectionChecker().hasConnection) {
      if (Platform.isAndroid) {
        var androidInfo = await DeviceInfoPlugin().androidInfo;
        platform = 'Android';
        version = androidInfo.version.release;
      }
      if (Platform.isIOS) {
        var iosInfo = await DeviceInfoPlugin().iosInfo;
        platform = 'iOS';
        version = iosInfo.systemVersion;
      }
      MyLogger.instance.log
          .d('uuid: $token\nplatform: $platform\nversion: $version');
      try {
        _settingsRepository.addDevice(token, platform, version);
      } on DioError catch (e) {
        MyLogger.instance.log.e(e.toString());
      } catch (_) {
        MyLogger.instance.log.e(_.toString());
      }
    }
  }
}
