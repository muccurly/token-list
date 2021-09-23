import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:jurta_app/src/business_logic/details/models/same_app_filter.dart';
import 'package:jurta_app/src/data/entity/api_response.dart';
import 'package:jurta_app/src/data/entity/application_client_view.dart';
import 'package:jurta_app/src/data/entity/real_property.dart';
import 'package:jurta_app/src/data/entity/real_property_filter.dart';
import 'package:jurta_app/src/data/entity/same_property.dart';
import 'package:jurta_app/src/data/entity/search_filter.dart';
import 'package:jurta_app/src/data/remote/api_client.dart';
import 'package:jurta_app/src/data/remote/i_property_remote_data_source.dart';
import 'package:jurta_app/src/utils/my_logger.dart';

class PropertyRemoteDataSourceImpl implements IPropertyRemoteDataSource {
  @override
  Future<ApiResponse<RealProperty>> getRealPropertyForMobileMainPage(
      RealPropertyFilter filter) async {
    Response response = await ApiClient.instance.vmDio.post(
        '/realProperty/getRealPropertyForMobileMainPage',
        data: json.encode(filter.toJson()));
    if (response.statusCode == 200)
      return ApiResponse.fromJson(response.data, RealProperty.fromJsonModel);
    else
      throw Exception('getRealPropertyForMobileMainPage exception');
  }

  @override
  Future<ApiResponse<RealProperty>> getRealPropertyList(
      SearchFilter filter) async {
    Response response = await ApiClient.instance.vmDio
        .post('/realProperty/getRealPropertyList', data: filter.toJson());
    if (response.statusCode == 200)
      return ApiResponse.fromJson(response.data, RealProperty.fromJsonModel);
    else
      throw Exception('getRealPropertyList exception');
  }

  @override
  Future<ApplicationClientView> getApplicationClientViewById(int id) async {
    Response response =
        await ApiClient.instance.dmDio.get('/application-client-view/$id');
    if (response.statusCode == 200)
      return ApplicationClientView.fromJson(response.data);
    else
      throw Exception('application-client-view api exception');
  }

  Future<ApiResponse<SameProperty>> getSameApplicationList(
    SameAppFilter filter,
  ) async {
    Response response = await ApiClient.instance.vmDio.post(
        '/sell-application/getSameApplicationList',
        data: filter.toJson());
    if(response.statusCode == 200)
      return ApiResponse.fromJson(response.data, SameProperty.fromJsonModel);
    else
      throw Exception('same applications exception');
  }
}
