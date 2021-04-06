import 'package:jurta/models/models.dart';

class HouseCondition {
  final int id;
  final MultiLang multiLang;

  HouseCondition({
    this.id,
    this.multiLang,
  });

  HouseCondition.fromJson(Map<String, dynamic> data)
      : id = data['id'] as int,
        multiLang = MultiLang.fromJson(data['multiLang']);

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'multiLang': this.multiLang.toJson(),
      };
}

class HouseConditionResponse {
  final List<HouseCondition> result;
  final List<dynamic> error;

  HouseConditionResponse({
    this.result,
    this.error,
  });

  HouseConditionResponse.fromJson(Map<String, dynamic> jsonData)
      : result = jsonData == null
            ? []
            : (jsonData as List)
                .map((obj) => HouseCondition.fromJson(obj))
                .toList(),
        error = [];

  HouseConditionResponse.withError(List<String> errorValue)
      : result = [],
        error = errorValue;
}
