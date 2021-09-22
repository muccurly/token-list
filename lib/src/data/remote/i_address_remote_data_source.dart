import 'package:jurta_app/src/data/entity/address.dart';
import 'package:jurta_app/src/data/entity/api_response.dart';
import 'package:jurta_app/src/data/entity/residential_complex.dart';

abstract class IAddressRemoteDataSource{
  Future<Data<Address>> getCities();
  Future<Data<Address>> getDistricts(String code);
<<<<<<< HEAD
  Future<Pagination<Address>> getStreetsByParent(String code, String? text);
  Future<Data<Building>> getBuildingsByStreet(int id);
  Future<ApiResponse<ResidentialComplex>> residentialComplexList(
      String? code, String? val);
=======
  Future<Pagination<Address>> getStreetsByParent(String code, {String? text});
  Future<Data<Building>> getBuildingsByStreet(int id);
  Future<ApiResponse<ResidentialComplex>> residentialComplexList(
      String code, {String? val});
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
}
