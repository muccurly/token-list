import 'dart:async';

import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';
import 'package:jurta_app/src/data/remote/i_dictionary_remote_data_source.dart';
import 'package:jurta_app/src/data/repository/i_dictionary_repository.dart';

class DictionaryRepositoryImpl implements IDictionaryRepository {
  DictionaryRepositoryImpl(this.remote);

  static const _OBJECT_TYPE = 'ObjectType';
<<<<<<< HEAD
=======
  static const _HOUSE_CONDITION = 'HouseCondition';
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
  final IDictionaryRemoteDataSource remote;

  final _objectTypesController =
      StreamController<List<DictionaryMultiLangItem>>();

  final _objectTypesSet = Set<DictionaryMultiLangItem>();

  @override
  Stream<List<DictionaryMultiLangItem>> get objectTypes async* {
    yield* _objectTypesController.stream;
  }

  @override
  Future<void> findAllObjectTypes() async {
    List<DictionaryMultiLangItem> list =
        await remote.getDictionaryListByName(_OBJECT_TYPE);
    _objectTypesSet.addAll(list);
    _objectTypesController.add(list);
  }

  @override
<<<<<<< HEAD
=======
  Future<List<DictionaryMultiLangItem>> findAllHouseConditions() async {
    List<DictionaryMultiLangItem> list =
        await remote.getDictionaryListByName(_HOUSE_CONDITION);
    return list;
  }

  @override
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
  List<DictionaryMultiLangItem> get types => _objectTypesSet.toList();

  @override
  void dispose() => _objectTypesController.close();
}
