import 'package:equatable/equatable.dart';
import 'package:jurta_app/src/data/entity/address.dart';
import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';
import 'package:jurta_app/src/data/entity/residential_complex.dart';

class BuildingDTO extends Equatable {
  final int? addressStreetId;
  final int? addressBuildingId;
  final String? houseNumber;
  final String? longitude;
  final String? latitude;
  final Address? addressStreet;
  final AddressObjectWithType? city;
  final AddressObjectWithType? district;
  final int? complexId;
  final String? complexName;
  final ResidentialComplex? complex;
  final DictionaryMultiLangItem? cityD;
  final DictionaryMultiLangItem? districtD;
  final DictionaryMultiLangItem? streetD;

  const BuildingDTO({
    this.addressStreetId,
    this.addressBuildingId,
    this.houseNumber,
    this.longitude,
    this.latitude,
    this.addressStreet,
    this.city,
    this.district,
    this.complexId,
    this.complexName,
    this.complex,
    this.cityD,
    this.districtD,
    this.streetD,
  });

  BuildingDTO copyWith({
    int? addressStreetId,
    int? addressBuildingId,
    String? houseNumber,
    String? longitude,
    String? latitude,
    Address? addressStreet,
    AddressObjectWithType? city,
    AddressObjectWithType? district,
    int? complexId,
    String? complexName,
    ResidentialComplex? complex,
    DictionaryMultiLangItem? cityD,
    DictionaryMultiLangItem? districtD,
    DictionaryMultiLangItem? streetD,
  }) {
    return BuildingDTO(
      addressStreetId: addressStreetId ?? this.addressStreetId,
      addressBuildingId: addressBuildingId ?? this.addressBuildingId,
      houseNumber: houseNumber ?? this.houseNumber,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      addressStreet: addressStreet ?? this.addressStreet,
      city: city ?? this.city,
      district: district ?? this.district,
      complexId: complexId ?? this.complexId,
      complexName: complexName ?? this.complexName,
      complex: complex ?? this.complex,
      cityD: cityD ?? this.cityD,
      districtD: districtD ?? this.districtD,
      streetD: streetD ?? this.streetD,
    );
  }

  factory BuildingDTO.fromJsonMainPage(Map<String, dynamic> json) {
    return BuildingDTO(
      complexName: json['residentialComplex'],
    );
  }

  factory BuildingDTO.fromJsonSameApp(Map<String, dynamic> json) {
    var rc = json['residentialComplex'];
    return BuildingDTO(
      houseNumber: json['houseNumber'],
      complexName: rc != null ? rc['nameRu'] : null,
      cityD: DictionaryMultiLangItem.fromJson(json['city']),
      districtD: DictionaryMultiLangItem.fromJson(json['district']),
      streetD: DictionaryMultiLangItem.fromJson(json['street']),
      complex: ResidentialComplex.fromJsonSameApp(json),
    );
  }

  factory BuildingDTO.fromJson(Map<String, dynamic> json) {
    var r = json['residentialComplex'];
    return BuildingDTO(
      addressStreetId: json['addressStreetId'],
      addressBuildingId: json['addressBuildingId'],
      houseNumber: json['houseNumber'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      addressStreet: Address.fromJson(json['addressStreetDto']),
      city: AddressObjectWithType.fromJson(json['city']),
      district: AddressObjectWithType.fromJson(json['district']),
      complexId: json['residentialComplexId'],
      complexName: json['residentialComplexName'],
      complex: r != null ? ResidentialComplex.fromJson(r) : null,
    );
  }

  @override
  List<Object?> get props => [
        addressStreetId,
        addressBuildingId,
        houseNumber,
        longitude,
        latitude,
        addressStreet,
        city,
        district,
        complexId,
        complexName,
        complex,
        cityD,
        districtD,
        streetD,
      ];
}
