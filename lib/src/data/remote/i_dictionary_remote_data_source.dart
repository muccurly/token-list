import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';

abstract class IDictionaryRemoteDataSource{
  Future<List<DictionaryMultiLangItem>> getDictionaryListByName(String name);
  Future<DictionaryMultiLangItem> getDictionaryByNameAndId(String name, int id);
}
