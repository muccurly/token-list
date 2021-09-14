import 'package:dio/dio.dart';
import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';
import 'package:jurta_app/src/data/remote/api_client.dart';
import 'package:jurta_app/src/data/remote/i_dictionary_remote_data_source.dart';

class DictionaryRemoteDataSourceImpl implements IDictionaryRemoteDataSource {
  @override
  Future<List<DictionaryMultiLangItem>> getDictionaryListByName(String name) async {
    Response response =
        await ApiClient.instance.dmDio.get('/dictionary/$name/list');
    if (response.statusCode == 200)
      return (response.data as List)
          .map((e) => DictionaryMultiLangItem.fromJson(e))
          .toList();
    else
      throw Exception('remote dictionary exception');
  }

  @override
  Future<DictionaryMultiLangItem> getDictionaryByNameAndId(String name, int id) async{
    Response response = await ApiClient.instance.dmDio.get('/dictionary/$name/$id');
    if(response.statusCode == 200)
      return DictionaryMultiLangItem.fromJson(response.data);
    else
      throw Exception('remote dictionary exception');
  }
}
