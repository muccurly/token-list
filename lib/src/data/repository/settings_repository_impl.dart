import 'package:jurta_app/src/data/remote/i_settings_remote_data_source.dart';
import 'package:jurta_app/src/data/repository/i_settings_repository.dart';

class SettingsRepositoryImpl implements ISettingsRepository{
  SettingsRepositoryImpl(this.remote);

  final ISettingsRemoteDataSource remote;

  @override
  Future<String> getCallNumber() async => remote.callCenter();

}