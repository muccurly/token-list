import 'package:equatable/equatable.dart';
import 'package:jurta_app/src/data/entity/multi_lang_text.dart';

class DictionaryMultiLangItem extends Equatable {
  final int id;
  final String? code;
  final MultiLangText name;

  DictionaryMultiLangItem({
    required this.id,
    this.code,
    required this.name,
  });

  factory DictionaryMultiLangItem.fromJson(Map<String, dynamic> json) {
    return DictionaryMultiLangItem(
      id: json['id'],
      code: json['code'],
      name: MultiLangText.fromJson(json['multiLang']),
    );
  }

  @override
  List<Object?> get props => [id, code, name];

  @override
  String toString() {
    return 'DictionaryMultiLangItem{id: $id, code: $code, name: $name}';
  }
}
