import 'dart:async';

import 'package:jurta_app/src/business_logic/details/models/same_app_filter.dart';
import 'package:jurta_app/src/data/entity/api_response.dart';
import 'package:jurta_app/src/data/entity/real_property_filter.dart';
import 'package:jurta_app/src/data/entity/search_filter.dart';
import 'package:jurta_app/src/data/entity/property.dart';
import 'package:jurta_app/src/data/remote/i_property_remote_data_source.dart';
import 'package:jurta_app/src/data/repository/i_property_repository.dart';
import 'package:jurta_app/src/utils/my_logger.dart';

class PropertyRepositoryImpl implements IPropertyRepository {
  PropertyRepositoryImpl(this.remote);

  final IPropertyRemoteDataSource remote;

  var _properties = Set<Property>();
  var _searchProps = Set<Property>();
  var _hots = Set<Property>();
  var _news = Set<Property>();
  var _same = Set<Property>();

  Pagination<Property>? _mainPag;
  Pagination<Property>? _searchPag;
  Pagination<Property>? _hotsPag;
  Pagination<Property>? _newsPag;
  Pagination<Property>? _samePag;

  @override
  Pagination<Property>? get mainPagination => _mainPag;

  @override
  Pagination<Property>? get searchPagination => _searchPag;

  @override
  Pagination<Property>? get hotsPagination => _hotsPag;

  @override
  Pagination<Property>? get newsPagination => _newsPag;

  @override
  Pagination<Property>? get samePagination => _samePag;

  @override
  Future<List<Property>> findRealProperty(RealPropertyFilter filter) async {
    ApiResponse<Property> result =
        await remote.getRealPropertyForMobileMainPage(filter);
    if (filter.pageNumber == 0) _properties.clear();
    _properties.addAll(result.data.data.data);
    _mainPag = result.data;
    return _properties.toList();
  }

  Future<List<Property>> searchRealProperty(SearchFilter filter) async {
    ApiResponse<Property> result = await remote.getRealPropertyList(filter);
    if (filter.pageNumber == 0) _searchProps.clear();
    _searchProps.addAll(result.data.data.data);
    _searchPag = result.data;
    MyLogger.instance.log.d('${_searchPag?.total}');
    return _searchProps.toList();
  }

  @override
  Future<List<Property>> findHots(RealPropertyFilter filter) async {
    ApiResponse<Property> result =
        await remote.getRealPropertyForMobileMainPage(filter);
    _hots.addAll(result.data.data.data);
    _hotsPag = result.data;
    return _hots.toList();
  }

  @override
  Future<List<Property>> findNews(RealPropertyFilter filter) async {
    ApiResponse<Property> result =
        await remote.getRealPropertyForMobileMainPage(filter);
    _news.addAll(result.data.data.data);
    _newsPag = result.data;
    return _news.toList();
  }

  @override
  Future<Property> findAppClientView(int id) async =>
      remote.getApplicationClientViewById(id);

  @override
  Future<List<Property>> findSameApps(SameAppFilter filter) async {
    ApiResponse<Property> result = await remote.getSameApplicationList(filter);
    if (filter.pageNumber == 0) _same.clear();
    _samePag = result.data;
    _same.addAll(result.data.data.data);
    return _same.toList();
  }
}
