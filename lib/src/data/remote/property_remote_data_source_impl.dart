import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:jurta_app/src/data/entity/api_response.dart';
import 'package:jurta_app/src/data/entity/real_property.dart';
import 'package:jurta_app/src/data/entity/real_property_filter.dart';
import 'package:jurta_app/src/data/remote/api_client.dart';
import 'package:jurta_app/src/data/remote/i_property_remote_data_source.dart';

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
}
