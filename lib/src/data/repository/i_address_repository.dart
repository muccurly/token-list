import 'package:jurta_app/src/data/entity/address.dart';
import 'package:jurta_app/src/data/entity/api_response.dart';

abstract class IAddressRepository{
  Future<Data<Address>> findAllCities();
  Future<Data<Address>> findDistricts(String code);
  Future<Pagination<Address>> findStreetsByParent(String code, String? text);
  Future<Data<Building>> findBuildingsByStreet(int id);
}
