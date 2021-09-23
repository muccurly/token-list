import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';

abstract class IDictionaryRepository{
  Future<List<DictionaryMultiLangItem>> findAllObjectTypes();
  Future<List<DictionaryMultiLangItem>> findAllHouseConditions();
  List<DictionaryMultiLangItem> get types;
  Future<DictionaryMultiLangItem> findHouseClass(int id);
}
