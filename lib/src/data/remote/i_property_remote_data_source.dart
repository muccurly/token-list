import 'package:jurta_app/src/business_logic/details/models/same_app_filter.dart';
import 'package:jurta_app/src/data/entity/api_response.dart';
import 'package:jurta_app/src/data/entity/application_client_view.dart';
import 'package:jurta_app/src/data/entity/real_property.dart';
import 'package:jurta_app/src/data/entity/real_property_filter.dart';
import 'package:jurta_app/src/data/entity/same_property.dart';
import 'package:jurta_app/src/data/entity/search_filter.dart';

abstract class IPropertyRemoteDataSource {
  Future<ApiResponse<RealProperty>> getRealPropertyForMobileMainPage(
      RealPropertyFilter filter);

  Future<ApiResponse<RealProperty>> getRealPropertyList(SearchFilter filter);

  Future<ApplicationClientView> getApplicationClientViewById(int id);

  Future<ApiResponse<SameProperty>> getSameApplicationList(
    SameAppFilter filter,
  );
}
