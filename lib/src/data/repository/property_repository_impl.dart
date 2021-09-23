import 'dart:async';

import 'package:jurta_app/generated/l10n.dart';
import 'package:jurta_app/src/business_logic/details/models/same_app_filter.dart';
import 'package:jurta_app/src/data/entity/api_response.dart';
import 'package:jurta_app/src/data/entity/application_client_view.dart';
import 'package:jurta_app/src/data/entity/real_property.dart';
import 'package:jurta_app/src/data/entity/real_property_filter.dart';
import 'package:jurta_app/src/data/entity/same_property.dart';
import 'package:jurta_app/src/data/entity/search_filter.dart';
import 'package:jurta_app/src/data/remote/i_property_remote_data_source.dart';
import 'package:jurta_app/src/data/repository/i_property_repository.dart';
import 'package:jurta_app/src/utils/my_logger.dart';

class PropertyRepositoryImpl implements IPropertyRepository {
  PropertyRepositoryImpl(this.remote);

  final IPropertyRemoteDataSource remote;

  final _apiResponseStreamController =
      StreamController<ApiResponse<RealProperty>>();
  final _propertiesStreamController = StreamController<List<RealProperty>>();

  var _properties = Set<RealProperty>();
  var _searchProps = Set<RealProperty>();
  var _hots = Set<RealProperty>();
  var _news = Set<RealProperty>();
  var _same = Set<SameProperty>();

  Pagination<RealProperty>? _searchPag;
  Pagination<RealProperty>? _hotsPag;
  Pagination<RealProperty>? _newsPag;
  Pagination<SameProperty>? _samePag;

  @override
  Pagination<RealProperty>? get searchPagination => _searchPag;

  @override
  Pagination<RealProperty>? get hotsPagination => _hotsPag;

  @override
  Pagination<RealProperty>? get newsPagination => _newsPag;

  @override
  Pagination<SameProperty>? get samePagination => _samePag;

  @override
  Stream<ApiResponse<RealProperty>> get apiResponseStream async* {
    yield* _apiResponseStreamController.stream;
  }

  @override
  Stream<List<RealProperty>> get propertiesStream async* {
    yield* _propertiesStreamController.stream;
  }

  @override
  Future<void> findRealProperty(RealPropertyFilter filter) async {
    ApiResponse<RealProperty> result =
        await remote.getRealPropertyForMobileMainPage(filter);
    //TODO: find a cleaner way
    if (filter.pageNumber == 0) _properties.clear();
    _properties.addAll(result.data.data.data);
    _apiResponseStreamController.add(result);
    _propertiesStreamController.add(_properties.toList());
  }

  Future<List<RealProperty>> searchRealProperty(SearchFilter filter) async {
    ApiResponse<RealProperty> result = await remote.getRealPropertyList(filter);
    if (filter.pageNumber == 0) _searchProps.clear();
    _searchProps.addAll(result.data.data.data);
    _searchPag = result.data;
    return _searchProps.toList();
  }

  @override
  Future<List<RealProperty>> findHots(RealPropertyFilter filter) async {
    ApiResponse<RealProperty> result =
        await remote.getRealPropertyForMobileMainPage(filter);
    _hots.addAll(result.data.data.data);
    _hotsPag = result.data;
    return _hots.toList();
  }

  @override
  Future<List<RealProperty>> findNews(RealPropertyFilter filter) async {
    ApiResponse<RealProperty> result =
        await remote.getRealPropertyForMobileMainPage(filter);
    _news.addAll(result.data.data.data);
    _newsPag = result.data;
    return _news.toList();
  }

  @override
  Future<ApplicationClientView> findAppClientView(int id) async =>
      remote.getApplicationClientViewById(id);

  @override
  Future<List<SameProperty>> findSameApps(SameAppFilter filter) async {
    ApiResponse<SameProperty> result =
        await remote.getSameApplicationList(filter);
    if (filter.pageNumber == 0) _same.clear();
    _samePag = result.data;
    _same.addAll(result.data.data.data);
    return _same.toList();
  }

  @override
  void dispose() {
    _apiResponseStreamController.close();
    _propertiesStreamController.close();
  }
}
