import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';

abstract class IDictionaryRepository {
  Future<List<DictionaryMultiLangItem>> findAllObjectTypes();

  Future<List<DictionaryMultiLangItem>> findAllHouseConditions();

  List<DictionaryMultiLangItem> get types;

  Future<DictionaryMultiLangItem> findHouseClass(int id);

  Future<void> findAllHouseClasses();

  Map<int, DictionaryMultiLangItem> get houseClassesMap;

  Future<void> findAllElevators();

  Map<int, DictionaryMultiLangItem> get elevators;

  Map<int, DictionaryMultiLangItem> get materialOfConstruction;

  Future<void> findAllMaterialOfConstructions();
}
