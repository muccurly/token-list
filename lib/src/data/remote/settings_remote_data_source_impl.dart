import 'package:dio/dio.dart';
import 'package:jurta_app/src/data/remote/api_client.dart';
import 'package:jurta_app/src/data/remote/i_settings_remote_data_source.dart';
import 'package:jurta_app/src/utils/my_logger.dart';

class SettingsRemoteDataSourceImpl implements ISettingsRemoteDataSource{
  @override
  Future<String> callCenter() async{
    Response response = await ApiClient.instance.dmDio.get('/settings/getByKeys/call_center');
    if(response.statusCode == 200){
      String phone = ((response.data as List).first as Map<String, dynamic>)['val'].toString();
      if(phone.isNotEmpty) return phone;
      else throw Exception('empty phone exception');
    }
    else throw Exception('api exception');
  }

  Future<void> addDevice(String uuid, String platform, String version) async{
    Response res = await ApiClient.instance.umDio.post('/profile-config/addDevice',
    data: {
      "platform": platform,
      "uuid": uuid,
      "version": version
    });
    if(res.statusCode == 200)
      MyLogger.instance.log.d('device added: $uuid');
    else throw Exception('invalid adding deviceuuid');
  }
}
