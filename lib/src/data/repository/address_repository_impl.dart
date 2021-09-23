import 'package:jurta_app/src/data/entity/address.dart';
import 'package:jurta_app/src/data/entity/api_response.dart';
import 'package:jurta_app/src/data/entity/residential_complex.dart';
import 'package:jurta_app/src/data/remote/i_address_remote_data_source.dart';
import 'package:jurta_app/src/data/repository/i_address_repository.dart';

class AddressRepositoryImpl implements IAddressRepository {
  AddressRepositoryImpl(this.remote);

  final IAddressRemoteDataSource remote;

  final _cities = Set<Address>()..add(Address.empty);
  final _districtsMap = Map<String, Set<Address>>();
  final _streetsMap = Map<String, Set<Address>>();
  final _complexMap = Map<String, Set<ResidentialComplex>>();
  Pagination<Address>? _streetsPag;
  ApiResponse<ResidentialComplex>? _complexPag;

  @override
  Future<List<Address>> findAllCities() async {
    Data<Address> data = await remote.getCities();
    _cities.addAll(data.data);
    return _cities.toList();
  }

  @override
  Future<List<Address>> findDistricts(String code) async {
    Data<Address> data = await remote.getDistricts(code);
    if (_districtsMap.containsKey(code))
      _districtsMap[code]!.addAll(data.data);
    else
      _districtsMap[code] = data.data.toSet();
    return _districtsMap[code]!.toList();
  }

  @override
  Future<Data<Building>> findBuildingsByStreet(int id) =>
      remote.getBuildingsByStreet(id);

  @override
  Future<List<Address>> findStreetsByParent(String code, {String? text}) async {
    Pagination<Address> data =
        await remote.getStreetsByParent(code, text: text);
    if (_streetsMap.containsKey(code))
      _streetsMap[code]!.addAll(data.data.data);
    else
      _streetsMap[code] = data.data.data.toSet();
    _streetsPag = data;
    return _streetsMap[code]!.toList();
  }

  @override
  Future<List<ResidentialComplex>> findResidentialComplex(String code,
      {String? val}) async {
    ApiResponse<ResidentialComplex> response =
        await remote.residentialComplexList(code, val: val);
    if (_complexMap.containsKey(code))
      _complexMap[code]!.addAll(response.data.data.data);
    else
      _complexMap[code] = response.data.data.data.toSet();
    _complexPag = response;
    return _complexMap[code]!.toList();
  }

  @override
  Pagination<Address>? get streetsPagination => _streetsPag;

  @override
  Pagination<ResidentialComplex>? get complexPagination => _complexPag?.data;
}
