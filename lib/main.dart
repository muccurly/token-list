import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jurta_app/src/app.dart';
import 'package:jurta_app/src/data/remote/dictionary_remote_data_source_impl.dart';
import 'package:jurta_app/src/data/remote/property_remote_data_source_impl.dart';
import 'package:jurta_app/src/data/remote/settings_remote_data_source_impl.dart';
import 'package:jurta_app/src/data/repository/dictionary_repository_impl.dart';
import 'package:jurta_app/src/data/repository/property_repository_impl.dart';
import 'package:jurta_app/src/data/repository/settings_repository_impl.dart';

void main() async {
  final propertyRemoteDataSource = PropertyRemoteDataSourceImpl();
  final propertyRepository = PropertyRepositoryImpl(propertyRemoteDataSource);

  final dictionaryRemoteDataSource = DictionaryRemoteDataSourceImpl();
  final dictionaryRepository =
      DictionaryRepositoryImpl(dictionaryRemoteDataSource);

  final settingsRemoteDataSource = SettingsRemoteDataSourceImpl();
  final settingsRepository = SettingsRepositoryImpl(settingsRemoteDataSource);

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(App(
    propertyRepository: propertyRepository,
    dictionaryRepository: dictionaryRepository,
    settingsRepository: settingsRepository,
  )));


}
