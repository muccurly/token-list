import 'package:equatable/equatable.dart';
import 'package:jurta_app/src/data/entity/multi_lang_text.dart';

class Address extends Equatable {
  final AddressObjectWithType address;
  final AddressObjectWithType? parent;
  final AddressObjectWithType? parentByType;
  final int total;

  const Address({
    required this.address,
    this.parent,
    this.parentByType,
    required this.total,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      address: json['addressObject'],
      parent: json['parent'],
      parentByType: json['parentByType'],
      total: json['total'],
    );
  }

  @override
  List<Object?> get props => [address, parent, parentByType, total];
}

class AddressObjectWithType extends Equatable {
  final AddressObject addressObject;
  final AddressType addressType;

  const AddressObjectWithType({
    required this.addressObject,
    required this.addressType,
  });

  factory AddressObjectWithType.fromJson(Map<String, dynamic> json) {
    return AddressObjectWithType(
      addressObject: AddressObject.fromJson(json['addressObject']),
      addressType: AddressType.fromJson(json['addressType']),
    );
  }

  @override
  List<Object?> get props => [addressObject, addressType];
}

class AddressObject extends Equatable {
  final int id;
  final String code;
  final MultiLangText name;
  final String idKazPost;

  const AddressObject({
    required this.id,
    required this.code,
    required this.name,
    required this.idKazPost,
  });

  factory AddressObject.fromJson(Map<String, dynamic> json) {
    return AddressObject(
      id: json['id'],
      code: json['code'],
      name: MultiLangText.fromJson(json['name']),
      idKazPost: json['idKazPost'],
    );
  }

  @override
  List<Object?> get props => [id, code, name, idKazPost];
}

class AddressType extends Equatable {
  final int id;
  final String? code;
  final MultiLangText name;

  const AddressType({
    required this.id,
    this.code,
    required this.name,
  });

  factory AddressType.fromJson(Map<String, dynamic> json) {
    return AddressType(
      id: json['id'],
      code: json['code'],
      name: MultiLangText.fromJson(json['name']),
    );
  }

  @override
  List<Object?> get props => [id, code, name];
}
