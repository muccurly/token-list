import 'package:jurta_app/src/data/entity/address.dart';
import 'package:jurta_app/src/data/entity/api_response.dart';
import 'package:jurta_app/src/data/entity/residential_complex.dart';

abstract class IAddressRepository{
  Future<List<Address>> findAllCities();
  Future<List<Address>> findDistricts(String code);
<<<<<<< HEAD
  Future<Pagination<Address>> findStreetsByParent(String code, String? text);
  Future<Data<Building>> findBuildingsByStreet(int id);
  Future<ApiResponse<ResidentialComplex>> findResidentialComplex(
      String? code, String? val);
=======
  Future<List<Address>> findStreetsByParent(String code, {String? text});
  Future<Data<Building>> findBuildingsByStreet(int id);
  Future<List<ResidentialComplex>> findResidentialComplex(
      String code, {String? val});
  Pagination<Address>? get streetsPagination;
  Pagination<ResidentialComplex>? get complexPagination;
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
}
