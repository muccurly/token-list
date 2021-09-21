import 'package:jurta_app/src/data/entity/address.dart';
import 'package:jurta_app/src/data/entity/api_response.dart';
import 'package:jurta_app/src/data/entity/residential_complex.dart';
import 'package:jurta_app/src/data/remote/i_address_remote_data_source.dart';
import 'package:jurta_app/src/data/repository/i_address_repository.dart';
import 'package:jurta_app/src/utils/my_logger.dart';

class AddressRepositoryImpl implements IAddressRepository {
  AddressRepositoryImpl(this.remote);

  final IAddressRemoteDataSource remote;
  final cities = Set<Address>();
  final districtsMap = Map<String, Set<Address>>();

  @override
  Future<List<Address>> findAllCities() async {
    Data<Address> data = await remote.getCities();
    cities.addAll(data.data);
    return cities.toList();
  }

  @override
  Future<List<Address>> findDistricts(String code) async {
    print(code);
    Data<Address> data = await remote.getDistricts(code);
    if(districtsMap.containsKey(code))
      districtsMap[code]!.addAll(data.data);
    else
      districtsMap[code] = data.data.toSet();

    return districtsMap[code]!.toList();
  }


  @override
  Future<Data<Building>> findBuildingsByStreet(int id) =>
      remote.getBuildingsByStreet(id);


  @override
  Future<Pagination<Address>> findStreetsByParent(String code, String? text) =>
      remote.getStreetsByParent(code, text);

  @override
  Future<ApiResponse<ResidentialComplex>> findResidentialComplex(
          String? code, String? val) async =>
      remote.residentialComplexList(code, val);
}
