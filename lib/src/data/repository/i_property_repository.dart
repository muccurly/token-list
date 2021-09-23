import 'package:jurta_app/src/business_logic/details/models/same_app_filter.dart';
import 'package:jurta_app/src/data/entity/api_response.dart';
import 'package:jurta_app/src/data/entity/application_client_view.dart';
import 'package:jurta_app/src/data/entity/real_property.dart';
import 'package:jurta_app/src/data/entity/real_property_filter.dart';
import 'package:jurta_app/src/data/entity/same_property.dart';
import 'package:jurta_app/src/data/entity/search_filter.dart';

abstract class IPropertyRepository {
  Stream<ApiResponse<RealProperty>> get apiResponseStream;
  Stream<List<RealProperty>> get propertiesStream;
  void dispose();
  Future<void> findRealProperty(RealPropertyFilter filter);
  Future<List<RealProperty>> searchRealProperty(SearchFilter filter);
  Pagination<RealProperty>? get searchPagination;
  Pagination<RealProperty>? get hotsPagination;
  Pagination<RealProperty>? get newsPagination;
  Pagination<SameProperty>? get samePagination;
  Future<List<RealProperty>> findHots(RealPropertyFilter filter);
  Future<List<RealProperty>> findNews(RealPropertyFilter filter);
  Future<ApplicationClientView> findAppClientView(int id);
  Future<List<SameProperty>> findSameApps(SameAppFilter filter);
}
