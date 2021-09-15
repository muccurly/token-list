import 'package:jurta_app/src/data/entity/object_type.dart';

abstract class IDictionaryRepository{
  Stream<List<ObjectType>> get objectTypes;
  void dispose();
  Future<void> findAllObjectTypes();
}
