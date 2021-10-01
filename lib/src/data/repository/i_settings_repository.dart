abstract class ISettingsRepository{
  Future<String> getCallNumber();
  Future<void> addDevice(String uuid, String platform, String version);
}
