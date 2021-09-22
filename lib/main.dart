import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jurta_app/src/app.dart';
import 'package:jurta_app/src/data/remote/address_remote_data_source_impl.dart';
import 'package:jurta_app/src/data/remote/dictionary_remote_data_source_impl.dart';
import 'package:jurta_app/src/data/remote/property_remote_data_source_impl.dart';
import 'package:jurta_app/src/data/remote/settings_remote_data_source_impl.dart';
import 'package:jurta_app/src/data/repository/address_repository_impl.dart';
import 'package:jurta_app/src/data/repository/dictionary_repository_impl.dart';
import 'package:jurta_app/src/data/repository/property_repository_impl.dart';
import 'package:jurta_app/src/data/repository/settings_repository_impl.dart';

<<<<<<< HEAD
//для коммита

=======
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
void main() async {
  final propertyRemoteDataSource = PropertyRemoteDataSourceImpl();
  final propertyRepository = PropertyRepositoryImpl(propertyRemoteDataSource);

  final dictionaryRemoteDataSource = DictionaryRemoteDataSourceImpl();
  final dictionaryRepository =
      DictionaryRepositoryImpl(dictionaryRemoteDataSource);

  final settingsRemoteDataSource = SettingsRemoteDataSourceImpl();
  final settingsRepository = SettingsRepositoryImpl(settingsRemoteDataSource);

  final addressRemoteDataSource = AddressRemoteDataSourceImpl();
  final addressRepository = AddressRepositoryImpl(addressRemoteDataSource);

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => runApp(
      App(
        propertyRepository: propertyRepository,
        dictionaryRepository: dictionaryRepository,
        settingsRepository: settingsRepository,
        addressRepository: addressRepository,
      ),
    ),
  );
}
