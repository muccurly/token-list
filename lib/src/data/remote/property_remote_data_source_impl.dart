import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:jurta_app/src/business_logic/details/models/same_app_filter.dart';
import 'package:jurta_app/src/data/entity/api_response.dart';
import 'package:jurta_app/src/data/entity/real_property_filter.dart';
import 'package:jurta_app/src/data/entity/search_filter.dart';
import 'package:jurta_app/src/data/entity/property.dart';
import 'package:jurta_app/src/data/remote/api_client.dart';
import 'package:jurta_app/src/data/remote/i_property_remote_data_source.dart';

class PropertyRemoteDataSourceImpl implements IPropertyRemoteDataSource {
  @override
  Future<ApiResponse<Property>> getRealPropertyForMobileMainPage(
      RealPropertyFilter filter) async {
    Response response = await ApiClient.instance.vmDio.post(
        '/realProperty/getRealPropertyForMobileMainPage',
        data: json.encode(filter.toJson()));
    if (response.statusCode == 200)
      return ApiResponse.fromJson(response.data, Property.fromJsonModelMain);
    else
      throw Exception('getRealPropertyForMobileMainPage exception');
  }

  @override
  Future<ApiResponse<Property>> getRealPropertyList(
      SearchFilter filter) async {
    Response response = await ApiClient.instance.vmDio
        .post('/realProperty/getRealPropertyList', data: filter.toJson());
    if (response.statusCode == 200)
      return ApiResponse.fromJson(response.data, Property.fromJsonModelSearch);
    else
      throw Exception('getRealPropertyList exception');
  }

  @override
  Future<Property> getApplicationClientViewById(int id) async {
    Response response =
        await ApiClient.instance.dmDio.get('/application-client-view/$id');
    if (response.statusCode == 200)
      return Property.fromJsonClientView(response.data);
    else
      throw Exception('application-client-view api exception');
  }

  Future<ApiResponse<Property>> getSameApplicationList(
    SameAppFilter filter,
  ) async {
    Response response = await ApiClient.instance.vmDio.post(
        '/sell-application/getSameApplicationList',
        data: filter.toJson());
    if(response.statusCode == 200)
      return ApiResponse.fromJson(response.data, Property.fromJsonModelSame);
    else
      throw Exception('same applications exception');
  }
}
