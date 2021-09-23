import 'dart:async';

import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';
import 'package:jurta_app/src/data/remote/i_dictionary_remote_data_source.dart';
import 'package:jurta_app/src/data/repository/i_dictionary_repository.dart';

class DictionaryRepositoryImpl implements IDictionaryRepository {
  DictionaryRepositoryImpl(this.remote);

  static const _OBJECT_TYPE = 'ObjectType';
  static const _HOUSE_CONDITION = 'HouseCondition';
  static const _HOUSE_CLASS = 'HouseClass';
  static const _MATERIAL_OF_CONSTRUCTION = 'MaterialOfConstruction';

  final IDictionaryRemoteDataSource remote;
  final _houseClasses = Map<int, DictionaryMultiLangItem>();

  final _objectTypesSet = Set<DictionaryMultiLangItem>()
    ..add(DictionaryMultiLangItem.empty);
  final _materialOfConstructionSet = Set<DictionaryMultiLangItem>();

  @override
  Future<List<DictionaryMultiLangItem>> findAllObjectTypes() async {
    List<DictionaryMultiLangItem> list =
        await remote.getDictionaryListByName(_OBJECT_TYPE);
    _objectTypesSet.addAll(list);
    return _objectTypesSet.toList();
  }

  @override
  Future<List<DictionaryMultiLangItem>> findAllHouseConditions() async {
    List<DictionaryMultiLangItem> list =
        await remote.getDictionaryListByName(_HOUSE_CONDITION);
    return list;
  }

  @override
  Future<DictionaryMultiLangItem> findHouseClass(int id) async {
    if (_houseClasses.containsKey(id)) return _houseClasses[id]!;
    var hClass = await remote.getDictionaryByNameAndId(_HOUSE_CLASS, id);
    if (!_houseClasses.containsKey(hClass.id)) _houseClasses[id] = hClass;
    return _houseClasses[id]!;
  }

  @override
  List<DictionaryMultiLangItem> get types => _objectTypesSet.toList();

  Future<List<DictionaryMultiLangItem>> findAllMaterialOfConstructions() async {
    if (_materialOfConstructionSet.isNotEmpty)
      return _materialOfConstructionSet.toList();
    List<DictionaryMultiLangItem> list =
        await remote.getDictionaryListByName(_MATERIAL_OF_CONSTRUCTION);
    _materialOfConstructionSet.addAll(list);
    return _materialOfConstructionSet.toList();
  }
}
