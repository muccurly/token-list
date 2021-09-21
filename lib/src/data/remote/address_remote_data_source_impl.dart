import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:jurta_app/src/data/entity/address.dart';
import 'package:jurta_app/src/data/entity/api_response.dart';
import 'package:jurta_app/src/data/entity/residential_complex.dart';
import 'package:jurta_app/src/data/remote/api_client.dart';
import 'package:jurta_app/src/data/remote/i_address_remote_data_source.dart';
import 'package:jurta_app/src/utils/my_logger.dart';

class AddressRemoteDataSourceImpl implements IAddressRemoteDataSource {
  @override
  Future<Data<Address>> getCities() async {
    Response response = await ApiClient.instance.gmDio.get(
      '/address/getObjects',
      queryParameters: {"typeId": 1},
    );
    if (response.statusCode == 200)
      return Data.fromJson(response.data, Address.fromJsonModel);
    else
      throw Exception('cities api exception');
  }

  @override
  Future<Data<Address>> getDistricts(String code) async {

    var data = {'typeId': 1, 'parentCode': '002'};
    MyLogger.instance.log.d(data);

    Response response = await ApiClient.instance.gmDio.get(
      '/address/getObjects',
      // queryParameters: {'typeId': 1, 'parentCode': code},
      queryParameters: data,
    );
    
    if (response.statusCode == 200) {
      MyLogger.instance.log.d(response.data);
      return Data.fromJson(response.data, Address.fromJsonModel);
    } else
      throw Exception('districts api exception');
  }

  @override
  Future<Pagination<Address>> getStreetsByParent(
      String code, String? text) async {
    var data = {
      "direction": "ASC",
      "pageNumber": 0,
      "pageSize": 20,
      "parentCode": code,
      "sortBy": "id",
      "text": text
    };
    Response response = await ApiClient.instance.gmDio
        .post('/address/getStreetsByParent', data: json.encode(data));
    if (response.statusCode == 200)
      return Pagination.fromJson(response.data, Address.fromJsonModel);
    else
      throw Exception('streets api exception');
  }

  @override
  Future<Data<Building>> getBuildingsByStreet(int id) async {
    Response response =
        await ApiClient.instance.gmDio.get('/address/getBuildingsByStreet/$id');
    if (response.statusCode == 200)
      return Data.fromJson(response.data, Building.fromJsonModel);
    else
      throw Exception('buildings api exception');
  }

  @override
  Future<ApiResponse<ResidentialComplex>> residentialComplexList(
      String? code, String? val) async {
    var data = <String, dynamic>{
      "code": code,
      "direction": "ASC",
      "pageNumber": 0,
      "pageSize": 10,
      "sortBy": "id",
      "val": val
    };

    Response response = await ApiClient.instance.gmDio
        .post('/residential-complexes/list', data: data);

    if (response.statusCode == 200)
      return ApiResponse.fromJson(
          response.data, ResidentialComplex.fromJsonModel);
    else
      throw Exception('ResidentialComplex api exception');
  }
}
