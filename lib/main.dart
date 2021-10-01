import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jurta_app/src/app.dart';
import 'package:jurta_app/src/data/remote/address_remote_data_source_impl.dart';
import 'package:jurta_app/src/data/remote/dictionary_remote_data_source_impl.dart';
import 'package:jurta_app/src/data/remote/ohter_structures_remote_data_source_impl.dart';
import 'package:jurta_app/src/data/remote/property_remote_data_source_impl.dart';
import 'package:jurta_app/src/data/remote/settings_remote_data_source_impl.dart';
import 'package:jurta_app/src/data/repository/address_repository_impl.dart';
import 'package:jurta_app/src/data/repository/dictionary_repository_impl.dart';
import 'package:jurta_app/src/data/repository/other_structures_repository_impl.dart';
import 'package:jurta_app/src/data/repository/property_repository_impl.dart';
import 'package:jurta_app/src/data/repository/settings_repository_impl.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final propertyRemoteDataSource = PropertyRemoteDataSourceImpl();
  final propertyRepository = PropertyRepositoryImpl(propertyRemoteDataSource);

  final dictionaryRemoteDataSource = DictionaryRemoteDataSourceImpl();
  final dictionaryRepository =
      DictionaryRepositoryImpl(dictionaryRemoteDataSource);

  final settingsRemoteDataSource = SettingsRemoteDataSourceImpl();
  final settingsRepository = SettingsRepositoryImpl(settingsRemoteDataSource);

  final addressRemoteDataSource = AddressRemoteDataSourceImpl();
  final addressRepository = AddressRepositoryImpl(addressRemoteDataSource);

  final otherRemote = OtherStructuresRemoteDataSourceImpl();
  final otherRepository = OtherStructuresRepositoryImpl(otherRemote);

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => runApp(
      App(
        propertyRepository: propertyRepository,
        dictionaryRepository: dictionaryRepository,
        settingsRepository: settingsRepository,
        addressRepository: addressRepository,
        otherRepository: otherRepository,
      ),
    ),
  );
}
