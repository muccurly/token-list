import 'package:jurta_app/src/data/entity/address.dart';
import 'package:jurta_app/src/data/entity/api_response.dart';
import 'package:jurta_app/src/data/entity/residential_complex.dart';
import 'package:jurta_app/src/data/remote/i_address_remote_data_source.dart';
import 'package:jurta_app/src/data/repository/i_address_repository.dart';
<<<<<<< HEAD
import 'package:jurta_app/src/utils/my_logger.dart';
=======
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94

class AddressRepositoryImpl implements IAddressRepository {
  AddressRepositoryImpl(this.remote);

  final IAddressRemoteDataSource remote;
  final cities = Set<Address>();
  final districtsMap = Map<String, Set<Address>>();
<<<<<<< HEAD
=======
  final streetsMap = Map<String, Set<Address>>();
  Pagination<Address>? _streetsPag;
  final complexMap = Map<String, Set<ResidentialComplex>>();
  ApiResponse<ResidentialComplex>? _complexPag;
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94

  @override
  Future<List<Address>> findAllCities() async {
    Data<Address> data = await remote.getCities();
    cities.addAll(data.data);
    return cities.toList();
  }

  @override
  Future<List<Address>> findDistricts(String code) async {
<<<<<<< HEAD
    print(code);
    Data<Address> data = await remote.getDistricts(code);
    if(districtsMap.containsKey(code))
      districtsMap[code]!.addAll(data.data);
    else
      districtsMap[code] = data.data.toSet();

    return districtsMap[code]!.toList();
  }


=======
    Data<Address> data = await remote.getDistricts(code);
    if (districtsMap.containsKey(code))
      districtsMap[code]!.addAll(data.data);
    else
      districtsMap[code] = data.data.toSet();
    return districtsMap[code]!.toList();
  }

>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
  @override
  Future<Data<Building>> findBuildingsByStreet(int id) =>
      remote.getBuildingsByStreet(id);

<<<<<<< HEAD

  @override
  Future<Pagination<Address>> findStreetsByParent(String code, String? text) =>
      remote.getStreetsByParent(code, text);

  @override
  Future<ApiResponse<ResidentialComplex>> findResidentialComplex(
          String? code, String? val) async =>
      remote.residentialComplexList(code, val);
=======
  @override
  Future<List<Address>> findStreetsByParent(String code, {String? text}) async {
    Pagination<Address> data =
        await remote.getStreetsByParent(code, text: text);
    if (streetsMap.containsKey(code))
      streetsMap[code]!.addAll(data.data.data);
    else
      streetsMap[code] = data.data.data.toSet();
    _streetsPag = data;
    return streetsMap[code]!.toList();
  }

  @override
  Future<List<ResidentialComplex>> findResidentialComplex(String code,
      {String? val}) async {
    ApiResponse<ResidentialComplex> response =
        await remote.residentialComplexList(code, val: val);
    if(complexMap.containsKey(code))
      complexMap[code]!.addAll(response.data.data.data);
    else
      complexMap[code] = response.data.data.data.toSet();
    _complexPag = response;
    return complexMap[code]!.toList();
  }

  @override
  Pagination<Address>? get streetsPagination => _streetsPag;

  @override
  Pagination<ResidentialComplex>? get complexPagination => _complexPag?.data;
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
}
