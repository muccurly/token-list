import 'package:jurta_app/src/business_logic/details/models/same_app_filter.dart';
import 'package:jurta_app/src/data/entity/api_response.dart';
import 'package:jurta_app/src/data/entity/real_property_filter.dart';
import 'package:jurta_app/src/data/entity/search_filter.dart';
import 'package:jurta_app/src/data/entity/property.dart';

abstract class IPropertyRepository {
  Future<List<Property>> findRealProperty(RealPropertyFilter filter);

  Future<List<Property>> searchRealProperty(SearchFilter filter);

  Pagination<Property>? get mainPagination;

  Pagination<Property>? get searchPagination;

  Pagination<Property>? get hotsPagination;

  Pagination<Property>? get newsPagination;

  Pagination<Property>? get samePagination;

  Future<List<Property>> findHots(RealPropertyFilter filter);

  Future<List<Property>> findNews(RealPropertyFilter filter);

  Future<Property> findAppClientView(int id);

  Future<List<Property>> findSameApps(SameAppFilter filter);
}
