import 'package:jurta_app/src/data/entity/other_structure.dart';
import 'package:jurta_app/src/data/entity/residential_complex.dart';
import 'package:jurta_app/src/data/remote/i_other_structures_remote_data_source.dart';
import 'package:jurta_app/src/data/repository/i_other_structures_repository.dart';

class OtherStructuresRepositoryImpl implements IOtherStructuresRepository {
  OtherStructuresRepositoryImpl(this.remote);

  final IOtherStructuresRemoteDataSource remote;

  static const _kindergarten = 'kindergarten';
  static const _shop = 'shop';
  static const _school = 'school';
  static const _hospital = 'hospital';

  final _kinderMap = Map<int, OtherStructure>();
  final _schoolMap =Map<int, OtherStructure>();
  final _shopMap =Map<int, OtherStructure>();
  final _hospitalMap =Map<int, OtherStructure>();
  final _complexMap = Map<int, ResidentialComplex>();

  Future<ResidentialComplex> findResidentialById(int id) async{
    if(_complexMap.containsKey(id))
      return _complexMap[id]!;
    else{
      var r = await remote.getResidentialById(id);
      _complexMap[r.id!] = r;
      return r;
    }
  }

  Future<OtherStructure> findKindergartenById(int id) async{
    if(_kinderMap.containsKey(id))
      return _kinderMap[id]!;
    else {
      OtherStructure k = await remote.getOtherStructureById(_kindergarten,id);
      _kinderMap[k.id] = k;
      return k;
    }
  }

  Future<List<OtherStructure>> findKindergartenListByIds(List<int> ids) async{
    var l = <OtherStructure>[];
    for(int i in ids){
      if(_kinderMap.containsKey(i)) {
        l.add(_kinderMap[i]!);
        ids.remove(i);
      }
    }
    var ks = await remote.getOtherStructuresByIdList(_kindergarten, ids);
    for(OtherStructure k in ks){
      if(!_kinderMap.containsKey(k.id))
        _kinderMap[k.id] = k;
        l.add(k);
    }
    return l;
  }

  Future<OtherStructure> findShopById(int id) async{
    if(_shopMap.containsKey(id))
      return _shopMap[id]!;
    else {
      OtherStructure o = await remote.getOtherStructureById(_shop,id);
      _shopMap[o.id] = o;
      return o;
    }
  }

  Future<List<OtherStructure>> findShopListByIds(List<int> ids) async{
    var l = <OtherStructure>[];
    for(int i in ids){
      if(_shopMap.containsKey(i)) {
        l.add(_shopMap[i]!);
        ids.remove(i);
      }
    }
    var ot = await remote.getOtherStructuresByIdList(_shop, ids);
    for(OtherStructure o in ot){
      if(!_shopMap.containsKey(o.id))
        _shopMap[o.id] = o;
      l.add(o);
    }
    return l;
  }

  Future<OtherStructure> findSchoolById(int id) async{
    if(_schoolMap.containsKey(id))
      return _schoolMap[id]!;
    else {
      OtherStructure o = await remote.getOtherStructureById(_school,id);
      _schoolMap[o.id] = o;
      return o;
    }
  }

  Future<List<OtherStructure>> findSchoolListByIds(List<int> ids) async{
    var l = <OtherStructure>[];
    for(int i in ids){
      if(_schoolMap.containsKey(i)) {
        l.add(_schoolMap[i]!);
        ids.remove(i);
      }
    }
    var ot = await remote.getOtherStructuresByIdList(_school, ids);
    for(OtherStructure o in ot){
      if(!_schoolMap.containsKey(o.id))
        _schoolMap[o.id] = o;
      l.add(o);
    }
    return l;
  }

  Future<OtherStructure> findHospitalById(int id) async{
    if(_hospitalMap.containsKey(id))
      return _hospitalMap[id]!;
    else {
      OtherStructure o = await remote.getOtherStructureById(_hospital,id);
      _hospitalMap[o.id] = o;
      return o;
    }
  }

  Future<List<OtherStructure>> findHospitalListByIds(List<int> ids) async{
    var l = <OtherStructure>[];
    for(int i in ids){
      if(_hospitalMap.containsKey(i)) {
        l.add(_hospitalMap[i]!);
        ids.remove(i);
      }
    }
    var ot = await remote.getOtherStructuresByIdList(_hospital, ids);
    for(OtherStructure o in ot){
      if(!_hospitalMap.containsKey(o.id))
        _hospitalMap[o.id] = o;
      l.add(o);
    }
    return l;
  }

}
