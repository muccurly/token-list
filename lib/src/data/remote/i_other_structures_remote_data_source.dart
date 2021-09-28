import 'package:jurta_app/src/data/entity/other_structure.dart';
import 'package:jurta_app/src/data/entity/residential_complex.dart';

abstract class IOtherStructuresRemoteDataSource{
  Future<OtherStructure> getOtherStructureById(String path,int id);
  Future<List<OtherStructure>> getOtherStructuresByIdList(String path,List<int> ids);
  Future<ResidentialComplex> getResidentialById(int id);
}