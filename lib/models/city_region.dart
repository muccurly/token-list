import 'package:jurta/models/models.dart';

class CityRegion {
  final AddressObjectRoot addressObject;
  final AddressObjectRoot parent;
  final AddressObjectRoot parentByType;
  final int total;

  CityRegion({
    this.addressObject,
    this.parent,
    this.parentByType,
    this.total,
  });

  CityRegion.fromJson(Map<String, dynamic> data)
      : total = data['total'] as int,
        parent = data['parent'] == null
            ? null
            : AddressObjectRoot.fromJson(data['parent']),
        parentByType = data['parentByType'] == null
            ? null
            : AddressObjectRoot.fromJson(data['parentByType']),
        addressObject = data['addressObject'] == null
            ? null
            : AddressObjectRoot.fromJson(data['addressObject']);

  Map<String, dynamic> toJson() => {
        'addressObject': this.addressObject.toJson(),
        'parent': this.parent.toJson(),
        'parentByType': this.parentByType.toJson(),
        'total': this.total,
      };
}

class AddressObjectRoot {
  final AddressObject addressObject;
  final AddressObject addressType;

  AddressObjectRoot({
    this.addressObject,
    this.addressType,
  });

  AddressObjectRoot.fromJson(Map<String, dynamic> data)
      : addressObject = data['addressObject'] == null
            ? null
            : AddressObject.fromJson(data['addressObject']),
        addressType = data['addressType'] == null
            ? null
            : AddressObject.fromJson(data['addressType']);

  Map<String, dynamic> toJson() => {
        'addressObject': this.addressObject.toJson(),
        'addressType': this.addressType.toJson(),
      };
}

class AddressObject {
  final int id;
  final String code;
  final String idKazPost;
  final MultiLang name;

  AddressObject({
    this.id,
    this.code,
    this.idKazPost,
    this.name,
  });

  AddressObject.fromJson(Map<String, dynamic> data)
      : id = data['id'] as int,
        code = data['code'] as String,
        idKazPost = data['idKazPost'] as String,
        name = data['name'] == null ? null : MultiLang.fromJson(data['name']);

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'code': this.code,
        'idKazPost': this.idKazPost,
        'name': this.name.toJson(),
      };
}

class CityRegionResult {
  final int size;
  final bool empty;
  final List<CityRegion> data;

  CityRegionResult({
    this.size,
    this.empty,
    this.data,
  });

  CityRegionResult.fromJson(Map<String, dynamic> data)
      : data = data['data'] == null
            ? []
            : (data['data'] as List).map((obj) => CityRegion.fromJson(obj)).toList(),
        size = data['size'] as int,
        empty = data['empty'] as bool;

  Map<String, dynamic> toJson() => {
        'size': this.size,
        'empty': this.empty,
        'data': this.data.map((obj) => obj.toJson()).toList(),
      };
}

class CityRegionResponse {
  final CityRegionResult result;
  final List<dynamic> error;

  CityRegionResponse({
    this.result,
    this.error,
  });

  CityRegionResponse.fromJson(Map<String, dynamic> jsonData)
      : result = jsonData == null ? null : CityRegionResult.fromJson(jsonData),
        error = [];

  CityRegionResponse.withError(List<String> errorValue)
      : result = CityRegionResult(),
        error = errorValue;
}
