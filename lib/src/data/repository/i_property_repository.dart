import 'package:jurta_app/src/data/entity/api_response.dart';
import 'package:jurta_app/src/data/entity/real_property.dart';
import 'package:jurta_app/src/data/entity/real_property_filter.dart';

abstract class IPropertyRepository {
  Stream<ApiResponse<RealProperty>> get apiResponseStream;
  Stream<List<RealProperty>> get propertiesStream;
  void dispose();
  Future<void> findRealProperty(RealPropertyFilter filter);
}
