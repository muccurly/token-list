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
    var m = json['multiLang'];
    var n = json['name'];
    return DictionaryMultiLangItem(
      id: json['id'],
      code: json['code'],
      name: MultiLangText.fromJson(m ?? n),
    );
  }

  static const empty = DictionaryMultiLangItem(
      id: 0,
      name: const MultiLangText(
        nameRu: 'Любой',
        nameKz: 'Любой',
        nameEn: 'Any',
      ));

  static const emptyE = DictionaryMultiLangItem(
      id: 0,
      name: const MultiLangText(
        nameRu: 'Любое',
        nameKz: 'Любое',
        nameEn: 'Any',
      ));

  @override
  List<Object?> get props => [id, code, name];
}

class CondMultiLangItem extends Equatable {
  final int id;
  final String? code;
  final String nameRu;
  final String nameKz;
  final String nameEn;
  final String? operationCode;
  final double? rating;

  const CondMultiLangItem({
    required this.id,
    this.code,
    required this.nameRu,
    required this.nameEn,
    required this.nameKz,
    this.operationCode,
    this.rating,
  });

  factory CondMultiLangItem.fromJson(Map<String, dynamic> json) {
    return CondMultiLangItem(
      id: json['id'],
      code: json['code'],
      operationCode: json['operationCode'],
      rating: json['rating'],
      nameRu: json['nameRu'],
      nameEn: json['nameEn'],
      nameKz: json['nameKz'],
    );
  }

  static const empty = CondMultiLangItem(
    id: 0,
    nameRu: 'Все',
    nameKz: 'Все',
    nameEn: 'All',
  );

  @override
  List<Object?> get props => [
        id,
        code,
        operationCode,
        rating,
        nameRu,
        nameEn,
        nameKz,
      ];
}
