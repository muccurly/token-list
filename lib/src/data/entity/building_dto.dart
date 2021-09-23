import 'package:equatable/equatable.dart';
import 'package:jurta_app/src/data/entity/address.dart';
import 'package:jurta_app/src/data/entity/real_property.dart';

class BuildingDTO extends Equatable {
  final int? addressStreetId;
  final int? addressBuildingId;
  final String? houseNumber;
  final String? longitude;
  final String? latitude;
  final Address? addressStreet;
  final AddressObjectWithType? city;
  final AddressObjectWithType? district;
  final int? residentialComplexId;

  const BuildingDTO({
    this.addressStreetId,
    this.addressBuildingId,
    this.houseNumber,
    this.longitude,
    this.latitude,
    this.addressStreet,
    this.city,
    this.district,
    this.residentialComplexId,
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
    int? residentialComplexId,
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
      residentialComplexId: residentialComplexId ?? this.residentialComplexId,
    );
  }

  factory BuildingDTO.fromJson(Map<String, dynamic> json) {
    return BuildingDTO(
      addressStreetId: json['addressStreetId'],
      addressBuildingId: json['addressBuildingId'],
      houseNumber: json['houseNumber'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      addressStreet: Address.fromJson(json['addressStreetDto']),
      city: AddressObjectWithType.fromJson(json['city']),
      district: AddressObjectWithType.fromJson(json['district']),
      residentialComplexId: json['residentialComplexId'],
    );
  }

  factory BuildingDTO.fromRealProperty(RealProperty p) {
    return BuildingDTO(
      addressStreetId: null,
      addressBuildingId: null,
      houseNumber: null,
      longitude: null,
      latitude: null,
      addressStreet: null,
      city: null,
      district: null,
      residentialComplexId: null,
    );
  }


  @override
  String toString() {
    return 'BuildingDTO{addressStreetId: $addressStreetId, addressBuildingId: $addressBuildingId, houseNumber: $houseNumber, longitude: $longitude, latitude: $latitude, addressStreet: $addressStreet, city: $city, district: $district, residentialComplexId: $residentialComplexId}';
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
        residentialComplexId,
      ];
}
