import 'package:jurta_app/src/data/entity/multi_lang_text.dart';

class DictionaryMultiLangItem {
  String code;
  int id;
  MultiLangText name;

  DictionaryMultiLangItem({
    required this.code,
    required this.id,
    required this.name,
  });

  factory DictionaryMultiLangItem.fromJson(Map<String, dynamic> json) {
    return DictionaryMultiLangItem(
      code: json['code'],
      id: json['id'],
      name: MultiLangText.fromJson(json['name']),
    );
  }
}
