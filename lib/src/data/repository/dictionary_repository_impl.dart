import 'dart:async';

import 'package:jurta_app/src/data/entity/object_type.dart';
import 'package:jurta_app/src/data/remote/i_dictionary_remote_data_source.dart';
import 'package:jurta_app/src/data/repository/i_dictionary_repository.dart';

class DictionaryRepositoryImpl implements IDictionaryRepository {
  DictionaryRepositoryImpl(this.remote);

  static const _OBJECT_TYPE = 'ObjectType';
  final IDictionaryRemoteDataSource remote;

  final _objectTypesController =
      StreamController<List<ObjectType>>();

  @override
  Stream<List<ObjectType>> get objectTypes async* {
    yield* _objectTypesController.stream;
  }

  @override
  Future<void> findAllObjectTypes() async {
    List<ObjectType> list =
        await remote.getDictionaryListByName(_OBJECT_TYPE);
    _objectTypesController.add(list);
  }

  @override
  void dispose() => _objectTypesController.close();
}
