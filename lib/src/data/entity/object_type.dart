import 'package:equatable/equatable.dart';
import 'package:jurta_app/src/data/entity/multi_lang_text.dart';

class ObjectType extends Equatable{
  final String code;
  final int id;
  final MultiLangText name;

  ObjectType({
    required this.code,
    required this.id,
    required this.name,
  });

  factory ObjectType.fromJson(Map<String, dynamic> json) {
    return ObjectType(
      code: json['code'],
      id: json['id'],
      name: MultiLangText.fromJson(json['multiLang']),
    );
  }

  @override
  List<Object?> get props => [code, id, name];
}
