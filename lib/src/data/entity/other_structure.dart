import 'package:equatable/equatable.dart';
import 'package:jurta_app/src/data/entity/multi_lang_text.dart';
import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';

class OtherStructure extends Equatable {
  final int id;
  final int? addressBuildingId;
  final DictionaryMultiLangItem? city;
  final DictionaryMultiLangItem? district;
  final DictionaryMultiLangItem? street;
  final MultiLangText? name;
  final MultiLangText? type;
  final String? number;
  final double? rating;

  OtherStructure({
    required this.id,
    this.addressBuildingId,
    this.city,
    this.district,
    this.street,
    this.name,
    this.type,
    this.number,
    this.rating,
  });

  factory OtherStructure.fromJson(Map<String, dynamic> json) {
    return OtherStructure(
      id: json['id'],
      addressBuildingId: json['addressBuildingId'],
      city: json['city'] != null
          ? DictionaryMultiLangItem.fromJson(json['city'])
          : null,
      district: json['district'] != null
          ? DictionaryMultiLangItem.fromJson(json['district'])
          : null,
      street: json['street'] != null
          ? DictionaryMultiLangItem.fromJson(json['street'])
          : null,
      name: json['name'] != null ? MultiLangText.fromJson(json['name']) : null,
      type: json['type'] != null ? MultiLangText.fromJson(json['type']) : null,
      number: json['number'],
      rating: json['rating'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        addressBuildingId,
        city,
        district,
        street,
        name,
        type,
        number,
        rating,
      ];
}
