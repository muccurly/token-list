import 'dart:async';

import 'package:jurta_app/src/data/entity/api_response.dart';
import 'package:jurta_app/src/data/entity/real_property.dart';
import 'package:jurta_app/src/data/entity/real_property_filter.dart';
import 'package:jurta_app/src/data/remote/i_property_remote_data_source.dart';
import 'package:jurta_app/src/data/repository/i_property_repository.dart';

class PropertyRepositoryImpl implements IPropertyRepository {
  PropertyRepositoryImpl(this.remote);

  final IPropertyRemoteDataSource remote;

  final _propertyController = StreamController<ApiResponse<RealProperty>>();

  @override
  Stream<ApiResponse<RealProperty>> get property async* {
    yield* _propertyController.stream;
  }

  @override
  Future<void> findRealProperty(RealPropertyFilter filter) async {
    ApiResponse<RealProperty> realProperties =
        await remote.getRealPropertyForMobileMainPage(filter);
    _propertyController.add(realProperties);
  }

  @override
  void dispose() => _propertyController.close();
}
