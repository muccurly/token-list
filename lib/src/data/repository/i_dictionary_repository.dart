import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';

abstract class IDictionaryRepository{
  Stream<List<DictionaryMultiLangItem>> get objectTypes;
  void dispose();
  Future<void> findAllObjectTypes();
<<<<<<< HEAD
=======
  Future<List<DictionaryMultiLangItem>> findAllHouseConditions();
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
  List<DictionaryMultiLangItem> get types;
}
