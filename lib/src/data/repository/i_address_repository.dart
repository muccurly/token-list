import 'package:jurta_app/src/data/entity/address.dart';
import 'package:jurta_app/src/data/entity/api_response.dart';
import 'package:jurta_app/src/data/entity/residential_complex.dart';

abstract class IAddressRepository{
  Future<List<Address>> findAllCities();
  Future<List<Address>> findDistricts(String code);
  Future<Pagination<Address>> findStreetsByParent(String code, String? text);
  Future<Data<Building>> findBuildingsByStreet(int id);
  Future<ApiResponse<ResidentialComplex>> findResidentialComplex(
      String? code, String? val);
}