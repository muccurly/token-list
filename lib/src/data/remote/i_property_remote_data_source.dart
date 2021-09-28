import 'package:jurta_app/src/business_logic/details/models/same_app_filter.dart';
import 'package:jurta_app/src/data/entity/api_response.dart';
import 'package:jurta_app/src/data/entity/real_property_filter.dart';
import 'package:jurta_app/src/data/entity/search_filter.dart';
import 'package:jurta_app/src/data/entity/property.dart';

abstract class IPropertyRemoteDataSource {
  Future<ApiResponse<Property>> getRealPropertyForMobileMainPage(
      RealPropertyFilter filter);

  Future<ApiResponse<Property>> getRealPropertyList(SearchFilter filter);

  Future<Property> getApplicationClientViewById(int id);

  Future<ApiResponse<Property>> getSameApplicationList(
    SameAppFilter filter,
  );
}
