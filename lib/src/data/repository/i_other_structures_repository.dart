import 'package:jurta_app/src/data/entity/other_structure.dart';
import 'package:jurta_app/src/data/entity/residential_complex.dart';

abstract class IOtherStructuresRepository {
  Future<OtherStructure> findKindergartenById(int id);

  Future<List<OtherStructure>> findKindergartenListByIds(List<int> ids);

  Future<OtherStructure> findShopById(int id);

  Future<List<OtherStructure>> findShopListByIds(List<int> ids);

  Future<OtherStructure> findSchoolById(int id);

  Future<List<OtherStructure>> findSchoolListByIds(List<int> ids);

  Future<OtherStructure> findHospitalById(int id);

  Future<List<OtherStructure>> findHospitalListByIds(List<int> ids);

  Future<ResidentialComplex> findResidentialById(int id);
}
