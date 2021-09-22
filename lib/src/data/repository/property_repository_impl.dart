import 'dart:async';

import 'package:jurta_app/src/data/entity/api_response.dart';
import 'package:jurta_app/src/data/entity/real_property.dart';
import 'package:jurta_app/src/data/entity/real_property_filter.dart';
import 'package:jurta_app/src/data/entity/search_filter.dart';
import 'package:jurta_app/src/data/remote/i_property_remote_data_source.dart';
import 'package:jurta_app/src/data/repository/i_property_repository.dart';
import 'package:jurta_app/src/utils/my_logger.dart';

class PropertyRepositoryImpl implements IPropertyRepository {
  PropertyRepositoryImpl(this.remote);

  final IPropertyRemoteDataSource remote;

<<<<<<< HEAD
  final _apiResponseStreamController = StreamController<ApiResponse<RealProperty>>();
=======
  final _apiResponseStreamController =
      StreamController<ApiResponse<RealProperty>>();
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
  final _propertiesStreamController = StreamController<List<RealProperty>>();

  var properties = Set<RealProperty>();
  var searchProps = Set<RealProperty>();
<<<<<<< HEAD
  Pagination? _searchPag;


=======
  var hots = Set<RealProperty>();

  Pagination<RealProperty>? _searchPag;
  Pagination<RealProperty>? _hotsPag;
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94

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
    MyLogger.instance.log.d('result:'
        '\nfilter: $filter'
        '\npageNumber: ${result.data.pageNumber}'
        '\nsize: ${result.data.size}'
        '\ntotal: ${result.data.total}'
        '\nids: ${result.data.data.data}');
    //TODO: find a cleaner way
<<<<<<< HEAD
    if(filter.pageNumber == 0)
      properties.clear();
=======
    if (filter.pageNumber == 0) properties.clear();
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
    properties.addAll(result.data.data.data);
    _apiResponseStreamController.add(result);
    _propertiesStreamController.add(properties.toList());
  }

  Future<List<RealProperty>> searchRealProperty(SearchFilter filter) async {
    ApiResponse<RealProperty> result = await remote.getRealPropertyList(filter);
    MyLogger.instance.log.d('result:'
        '\nfilter: $filter'
        '\npageNumber: ${result.data.pageNumber}'
        '\nsize: ${result.data.size}'
        '\ntotal: ${result.data.total}'
        '\nids: ${result.data.data.data}');
<<<<<<< HEAD
    if(filter.pageNumber == 0)
      searchProps.clear();
=======
    if (filter.pageNumber == 0) searchProps.clear();
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
    searchProps.addAll(result.data.data.data);
    _searchPag = result.data;
    return searchProps.toList();
  }

  @override
<<<<<<< HEAD
=======
  Future<List<RealProperty>> findHots(RealPropertyFilter filter) async {
    // RealPropertyFilter filter =
    //     RealPropertyFilter().copyWith(flagId: 3, objectTypeId: null);
    ApiResponse<RealProperty> result =
        await remote.getRealPropertyForMobileMainPage(filter);
    MyLogger.instance.log.d('result:'
        '\nfilter: $filter'
        '\npageNumber: ${result.data.pageNumber}'
        '\nsize: ${result.data.size}'
        '\ntotal: ${result.data.total}'
        '\nids: ${result.data.data.data}');
    hots.addAll(result.data.data.data);
    _hotsPag = result.data;
    MyLogger.instance.log.d(_hotsPag!.pageNumber);
    return hots.toList();
  }

  @override
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
  void dispose() {
    _apiResponseStreamController.close();
    _propertiesStreamController.close();
  }

  @override
<<<<<<< HEAD
  Pagination? get searchPagination => _searchPag;
=======
  Pagination<RealProperty>? get searchPagination => _searchPag;

  @override
  Pagination<RealProperty>? get hotsPagination => _hotsPag;
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
}
