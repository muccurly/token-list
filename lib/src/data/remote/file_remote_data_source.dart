import 'package:dio/dio.dart';
import 'package:jurta_app/src/data/remote/api_client.dart';
import 'package:jurta_app/src/data/remote/i_file_remote_data_source.dart';
import 'package:jurta_app/src/utils/my_logger.dart';

class FileRemoteDataSource implements IFileRemoteDataSource{
  @override
  Future<void> preview(String uuid) async {
    Response response =
        await ApiClient.instance.fmDio.get('/download/$uuid/preview');
    if (response.statusCode == 200)
      MyLogger.instance.log.d('response to $uuid successfully');
    else
      throw Exception('File download exception');
  }
}
