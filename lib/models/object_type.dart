import 'package:jurta/models/models.dart';

class ObjectType {
  final int id;
  final MultiLang multiLang;
  final String code;

  ObjectType({
    this.id,
    this.multiLang,
    this.code,
  });

  ObjectType.fromJson(Map<String, dynamic> data)
      : id = data['id'] as int,
        multiLang = MultiLang.fromJson(data['multiLang']),
        code = data['code'] as String;

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'multiLang': this.multiLang.toJson(),
        'code': this.code,
      };
}

class ObjectTypeResponse {
  final List<ObjectType> result;
  final List<dynamic> error;

  ObjectTypeResponse({
    this.result,
    this.error,
  });

  ObjectTypeResponse.fromJson(Map<String, dynamic> jsonData)
      : result = jsonData == null
            ? []
            : (jsonData as List)
                .map((obj) => ObjectType.fromJson(obj))
                .toList(),
        error = [];

  ObjectTypeResponse.withError(List<String> errorValue)
      : result = [],
        error = errorValue;
}
