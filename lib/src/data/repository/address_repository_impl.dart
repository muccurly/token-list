import 'package:jurta_app/src/data/entity/address.dart';
import 'package:jurta_app/src/data/entity/api_response.dart';
import 'package:jurta_app/src/data/remote/i_address_remote_data_source.dart';
import 'package:jurta_app/src/data/repository/i_address_repository.dart';

class AddressRepositoryImpl implements IAddressRepository {
  AddressRepositoryImpl(this.remote);

  final IAddressRemoteDataSource remote;

  @override
  Future<Data<Address>> findAllCities() async => remote.getCities();

  @override
  Future<Data<Building>> findBuildingsByStreet(int id) =>
      remote.getBuildingsByStreet(id);

  @override
  Future<Data<Address>> findDistricts(String code) => remote.getDistricts(code);

  @override
  Future<Pagination<Address>> findStreetsByParent(String code, String? text) =>
      remote.getStreetsByParent(code, text);
}
