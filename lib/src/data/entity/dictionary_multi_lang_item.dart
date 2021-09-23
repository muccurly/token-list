import 'package:equatable/equatable.dart';
import 'package:jurta_app/src/data/entity/multi_lang_text.dart';

class DictionaryMultiLangItem extends Equatable {
  final int id;
  final String? code;
  final MultiLangText name;

  const DictionaryMultiLangItem({
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

  static const empty = DictionaryMultiLangItem(
      id: 0,
      name: const MultiLangText(
        nameRu: 'Все',
        nameKz: 'Все',
        nameEn: 'All',
      ));

  @override
  String toString() {
    return 'DictionaryMultiLangItem{id: $id, code: $code, name: $name}';
  }
}

class ObjectTypeMultiLangItem extends Equatable {
  final int id;
  final String? code;
  final MultiLangText name;

  ObjectTypeMultiLangItem({
    required this.id,
    this.code,
    required this.name,
  });

  factory ObjectTypeMultiLangItem.fromJson(Map<String, dynamic> json) {
    return ObjectTypeMultiLangItem(
      id: json['id'],
      code: json['code'],
      name: MultiLangText.fromJson(json['name']),
    );
  }

  @override
  List<Object?> get props => [id, code, name];

  @override
  String toString() {
    return 'ObjectTypeMultiLangItem{id: $id, code: $code, name: $name}';
  }
}
