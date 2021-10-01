abstract class ISettingsRemoteDataSource{
  Future<String> callCenter();
  Future<void> addDevice(String uuid, String platform, String version);
}
