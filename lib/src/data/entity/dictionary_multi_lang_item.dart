import 'package:equatable/equatable.dart';
import 'package:jurta_app/src/data/entity/multi_lang_text.dart';

class DictionaryMultiLangItem extends Equatable{
  final String code;
  final int id;
  final MultiLangText name;

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

  @override
  List<Object?> get props => [code, id, name];
}
