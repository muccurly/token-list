import 'package:jurta_app/src/data/entity/api_response.dart';
import 'package:jurta_app/src/data/entity/real_property.dart';
import 'package:jurta_app/src/data/entity/real_property_filter.dart';

abstract class IPropertyRemoteDataSource{
  Future<ApiResponse<RealProperty>> getRealPropertyForMobileMainPage(
      RealPropertyFilter filter);
}