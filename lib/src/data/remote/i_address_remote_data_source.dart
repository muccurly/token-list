import 'package:jurta_app/src/data/entity/address.dart';
import 'package:jurta_app/src/data/entity/api_response.dart';

abstract class IAddressRemoteDataSource{
  Future<Data<Address>> getCities();
  Future<Data<Address>> getDistricts(String code);
  Future<Pagination<Address>> getStreetsByParent(String code, String? text);
  Future<Data<Building>> getBuildingsByStreet(int id);
}
