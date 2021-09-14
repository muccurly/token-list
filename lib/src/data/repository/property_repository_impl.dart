import 'dart:async';

import 'package:jurta_app/src/data/entity/api_response.dart';
import 'package:jurta_app/src/data/entity/real_property.dart';
import 'package:jurta_app/src/data/entity/real_property_filter.dart';
import 'package:jurta_app/src/data/remote/i_property_remote_data_source.dart';
import 'package:jurta_app/src/data/repository/i_property_repository.dart';
import 'package:jurta_app/src/utils/my_logger.dart';

class PropertyRepositoryImpl implements IPropertyRepository {
  PropertyRepositoryImpl(this.remote);

  final IPropertyRemoteDataSource remote;

  final _apiResponseStreamController = StreamController<ApiResponse<RealProperty>>();
  final _propertiesStreamController = StreamController<List<RealProperty>>();

  var properties = Set<RealProperty>();

  ApiResponse? apiResponse;

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
    if(filter.pageNumber == 0)
      properties.clear();
    properties.addAll(result.data.data.data);
    _apiResponseStreamController.add(result);
    _propertiesStreamController.add(properties.toList());
  }

  @override
  void dispose() {
    _apiResponseStreamController.close();
    _propertiesStreamController.close();
  }
}
