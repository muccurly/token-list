import 'package:jurta_app/src/data/entity/object_type.dart';

abstract class IDictionaryRemoteDataSource{
  Future<List<ObjectType>> getDictionaryListByName(String name);
  Future<ObjectType> getDictionaryByNameAndId(String name, int id);
}