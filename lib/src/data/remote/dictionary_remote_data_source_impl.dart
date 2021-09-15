import 'package:dio/dio.dart';
import 'package:jurta_app/src/data/entity/object_type.dart';
import 'package:jurta_app/src/data/remote/api_client.dart';
import 'package:jurta_app/src/data/remote/i_dictionary_remote_data_source.dart';

class DictionaryRemoteDataSourceImpl implements IDictionaryRemoteDataSource {
  @override
  Future<List<ObjectType>> getDictionaryListByName(String name) async {
    Response response =
        await ApiClient.instance.dmDio.get('/dictionary/$name/list');
    if (response.statusCode == 200)
      return (response.data as List)
          .map((e) => ObjectType.fromJson(e))
          .toList();
    else
      throw Exception('remote dictionary exception');
  }

  @override
  Future<ObjectType> getDictionaryByNameAndId(String name, int id) async{
    Response response = await ApiClient.instance.dmDio.get('/dictionary/$name/$id');
    if(response.statusCode == 200)
      return ObjectType.fromJson(response.data);
    else
      throw Exception('remote dictionary exception');
  }
}
