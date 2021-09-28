import 'package:equatable/equatable.dart';
import 'package:jurta_app/src/data/entity/multi_lang_text.dart';

class AddressObject extends Equatable {
  final int id;
  final String? code;
  final MultiLangText name;
  final String? idKazPost;

  const AddressObject({
    required this.id,
    this.code,
    required this.name,
    this.idKazPost,
  });

  factory AddressObject.fromJson(Map<String, dynamic> json) {
    return AddressObject(
      id: json['id'],
      code: json['code'],
      name: MultiLangText.fromJson(json['name']),
      idKazPost: json['idKazPost'],
    );
  }

  static const empty = AddressObject(id: 0, name: MultiLangText.empty);

  @override
  List<Object?> get props => [id, code, name, idKazPost];
}

class AddressObjectWithType extends Equatable {
  final AddressObject addressObject;
  final AddressObject addressType;

  const AddressObjectWithType({
    required this.addressObject,
    required this.addressType,
  });

  factory AddressObjectWithType.fromJson(Map<String, dynamic> json) {
    return AddressObjectWithType(
      addressObject: AddressObject.fromJson(json['addressObject']),
      addressType: AddressObject.fromJson(json['addressType']),
    );
  }

  static const empty = AddressObjectWithType(
      addressObject: AddressObject.empty,
      addressType: AddressObject.empty);

  @override
  List<Object?> get props => [AddressObject, addressType];
}

class Address extends Equatable {
  final AddressObjectWithType? address;
  final AddressObjectWithType? parent;
  final AddressObjectWithType? parentByType;
  final int? total;

  const Address({
    this.address,
    this.parent,
    this.parentByType,
    this.total,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      address: AddressObjectWithType.fromJson(json['addressObject']),
      parent: json['parent'] == null
          ? null
          : AddressObjectWithType.fromJson(json['parent']),
      parentByType: json['parentByType'] == null
          ? null
          : AddressObjectWithType.fromJson(json['parentByType']),
      total: json['total'],
    );
  }

  static Address fromJsonModel(Map<String, dynamic> json) =>
      Address.fromJson(json);

  static const empty = Address(
      address: AddressObjectWithType.empty,
      parent: AddressObjectWithType.empty,
      parentByType: AddressObjectWithType.empty);

  @override
  List<Object?> get props => [address, parent, parentByType, total];
}

class Building extends Equatable {
  final int id;
  final String number;
  final String? postcode;
  final String? latitude;
  final String? longitude;
  final String? houseNumber;
  final AddressStreet? street;

  Building({
    required this.id,
    required this.number,
    this.postcode,
    this.latitude,
    this.longitude,
    this.houseNumber,
    this.street,
  });

  factory Building.fromJson(Map<String, dynamic> json) {
    return Building(
      id: json['id'],
      number: json['number'],
      postcode: json['postcode'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      houseNumber: json['houseNumber'],
      street: json['street'] == null
          ? null
          : AddressStreet.fromJson(json['street']),
    );
  }

  static Building fromJsonModel(Map<String, dynamic> json) =>
      Building.fromJson(json);

  @override
  List<Object?> get props => [
        id,
        number,
        postcode,
        latitude,
        longitude,
        houseNumber,
        street,
      ];
}

class AddressStreet extends Equatable {
  final MultiLangText address;
  final AddressObjectWithType addressObject;
  final AddressObjectWithType parent;
  final AddressObjectWithType parentByType;
  final int total;
  final List<Address> parentObject;

  const AddressStreet({
    required this.address,
    required this.addressObject,
    required this.parent,
    required this.parentByType,
    required this.total,
    required this.parentObject,
  });

  factory AddressStreet.fromJson(Map<String, dynamic> json) {
    return AddressStreet(
      address: MultiLangText.fromJson(json['address']),
      addressObject: AddressObjectWithType.fromJson(json['addressObject']),
      parent: AddressObjectWithType.fromJson(json['parent']),
      parentByType: AddressObjectWithType.fromJson(json['parentByType']),
      total: json['total'],
      parentObject: (json['parentObject'] as List)
          .map((e) => Address.fromJson(e))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [
        address,
        addressObject,
        parent,
        parentByType,
        total,
        parentObject,
      ];
}
