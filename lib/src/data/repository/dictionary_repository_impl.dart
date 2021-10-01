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
  static const _TypeOfElevator = 'TypeOfElevator';

  final IDictionaryRemoteDataSource remote;
  final _houseClasses = Map<int, DictionaryMultiLangItem>();
  final _elevators = Map<int, DictionaryMultiLangItem>();

  final _objectTypesSet = Set<DictionaryMultiLangItem>()
    ..add(DictionaryMultiLangItem.empty);
  final _materialOfConstruction = Map<int, DictionaryMultiLangItem>();

  @override
  Map<int, DictionaryMultiLangItem> get houseClassesMap => _houseClasses;

  @override
  Map<int, DictionaryMultiLangItem> get elevators => _elevators;

  @override
  Map<int, DictionaryMultiLangItem> get materialOfConstruction =>
      _materialOfConstruction;

  @override
  Future<List<DictionaryMultiLangItem>> findAllObjectTypes() async {
    List<DictionaryMultiLangItem> list =
        await remote.getDictionaryListByName(_OBJECT_TYPE);
    _objectTypesSet.addAll(list);
    return _objectTypesSet.toList();
  }

  @override
  Future<List<DictionaryMultiLangItem>> findAllHouseConditions() async {
    List<DictionaryMultiLangItem> list = [DictionaryMultiLangItem.emptyE];
    list.addAll(await remote.getDictionaryListByName(_HOUSE_CONDITION));
    return list;
  }

  @override
  Future<void> findAllElevators() async {
    List<DictionaryMultiLangItem> list =
        await remote.getDictionaryListByName(_TypeOfElevator);
    list.forEach((element) {
      _elevators[element.id] = element;
    });
  }

  @override
  Future<void> findAllHouseClasses() async {
    List<DictionaryMultiLangItem> list =
        await remote.getDictionaryListByName(_HOUSE_CLASS);
    list.forEach((element) {
      _houseClasses[element.id] = element;
    });
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

  @override
  Future<void> findAllMaterialOfConstructions() async {
    List<DictionaryMultiLangItem> list =
        await remote.getDictionaryListByName(_MATERIAL_OF_CONSTRUCTION);
    list.forEach((element) {
      _materialOfConstruction[element.id] = element;
    });
  }
}
