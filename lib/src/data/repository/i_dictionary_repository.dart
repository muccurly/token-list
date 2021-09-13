import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';

abstract class IDictionaryRepository{
  Stream<List<DictionaryMultiLangItem>> get objectTypes;
  void dispose();
  Future<void> findAllObjectTypes();
}