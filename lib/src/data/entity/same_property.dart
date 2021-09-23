import 'package:equatable/equatable.dart';
import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';
import 'package:jurta_app/src/data/entity/multi_lang_text.dart';

class SameProperty extends Equatable {
  final int appId;
  final ObjectTypeMultiLangItem? objectType;
  final ObjectTypeMultiLangItem? condition;
  final ObjectTypeMultiLangItem? contractType;
  final ObjectTypeMultiLangItem? city;
  final ObjectTypeMultiLangItem? district;
  final ObjectTypeMultiLangItem? street;
  final String houseNumber;
  final MultiLangText? residentialComplex;
  final String apartmentNumber;
  final int numberOfRooms;
  final int? floor;
  final int? numberOfFloors;
  final double totalArea;
  final ObjectTypeMultiLangItem? material;
  final int? yearOfConstruction;
  final double price;
  final double? pricePerSquare;
  final List<String>? photoIdList;
  final List<String>? virtualTourImageIdList;
  final List<String>? housingPlanImageIdList;
  final String creationDate;

  const SameProperty({
    required this.appId,
    this.objectType,
    this.condition,
    this.contractType,
    this.city,
    this.district,
    this.street,
    required this.houseNumber,
    this.residentialComplex,
    required this.apartmentNumber,
    required this.numberOfRooms,
    this.floor,
    this.numberOfFloors,
    required this.totalArea,
    this.material,
    this.yearOfConstruction,
    required this.price,
    this.pricePerSquare,
    this.photoIdList,
    this.virtualTourImageIdList,
    this.housingPlanImageIdList,
    required this.creationDate,
  });

  SameProperty copyWith({
    int? id,
    ObjectTypeMultiLangItem? objectType,
    ObjectTypeMultiLangItem? condition,
    ObjectTypeMultiLangItem? contractType,
    ObjectTypeMultiLangItem? city,
    ObjectTypeMultiLangItem? district,
    ObjectTypeMultiLangItem? street,
    String? houseNumber,
    MultiLangText? residentialComplex,
    String? apartmentNumber,
    String? creationDate,
    int? numberOfRooms,
    int? floor,
    int? numberOfFloors,
    double? totalArea,
    ObjectTypeMultiLangItem? material,
    int? yearOfConstruction,
    double? price,
    double? pricePerSquare,
    List<String>? photoIdList,
    List<String>? virtualTourImageIdList,
    List<String>? housingPlanImageIdList,
  }) {
    return SameProperty(
      appId: id ?? this.appId,
      objectType: objectType ?? this.objectType,
      condition: condition ?? this.condition,
      contractType: contractType ?? this.contractType,
      city: city ?? this.city,
      district: district ?? this.district,
      street: street ?? this.street,
      houseNumber: houseNumber ?? this.houseNumber,
      residentialComplex: residentialComplex ?? this.residentialComplex,
      apartmentNumber: apartmentNumber ?? this.apartmentNumber,
      numberOfRooms: numberOfRooms ?? this.numberOfRooms,
      floor: floor ?? this.floor,
      numberOfFloors: numberOfFloors ?? this.numberOfFloors,
      totalArea: totalArea ?? this.totalArea,
      material: material ?? this.material,
      yearOfConstruction: yearOfConstruction ?? this.yearOfConstruction,
      price: price ?? this.price,
      creationDate: creationDate ?? this.creationDate,
      pricePerSquare: pricePerSquare ?? this.pricePerSquare,
      photoIdList: photoIdList ?? this.photoIdList,
      virtualTourImageIdList:
          virtualTourImageIdList ?? this.virtualTourImageIdList,
      housingPlanImageIdList:
          housingPlanImageIdList ?? this.housingPlanImageIdList,
    );
  }

  factory SameProperty.fromJson(Map<String, dynamic> json) {
    return SameProperty(
      appId: json['id'],
      objectType: json['objectType'] != null
          ? ObjectTypeMultiLangItem.fromJson(json['objectType'])
          : null,
      condition: json['condition'] != null
          ? ObjectTypeMultiLangItem.fromJson(json['condition'])
          : null,
      contractType: json['contractType'] != null
          ? ObjectTypeMultiLangItem.fromJson(json['contractType'])
          : null,
      city: json['city'] != null
          ? ObjectTypeMultiLangItem.fromJson(json['city'])
          : null,
      district: json['district'] != null
          ? ObjectTypeMultiLangItem.fromJson(json['district'])
          : null,
      street: json['street'] != null
          ? ObjectTypeMultiLangItem.fromJson(json['street'])
          : null,
      houseNumber: json['houseNumber'],
      residentialComplex: json['residentialComplex'] != null
          ? MultiLangText.fromJson(json['residentialComplex'])
          : null,
      apartmentNumber: json['apartmentNumber'],
      numberOfRooms: json['numberOfRooms'],
      floor: json['floor'],
      numberOfFloors: json['numberOfFloors'],
      totalArea: json['totalArea'],
      material: json['material'] != null
          ? ObjectTypeMultiLangItem.fromJson(json['material'])
          : null,
      yearOfConstruction: json['yearOfConstruction'],
      price: json['price'],
      creationDate: json['creationDate'],
      pricePerSquare: (json['pricePerSquare'] as int).toDouble(),
      photoIdList: json['photoIdList'] != null
          ? List<String>.from((json['photoIdList'] as List))
          : null,
      virtualTourImageIdList: json['virtualTourImageIdList'] != null
          ? List<String>.from((json['virtualTourImageIdList'] as List))
          : null,
      housingPlanImageIdList: json['housingPlanImageIdList'] != null
          ? List<String>.from((json['housingPlanImageIdList'] as List))
          : null,
    );
  }

  static SameProperty fromJsonModel(Map<String, dynamic> json) =>
      SameProperty.fromJson(json);

  @override
  List<Object?> get props => [
        appId,
        objectType,
        condition,
        contractType,
        city,
        district,
        street,
        houseNumber,
        residentialComplex,
        apartmentNumber,
        numberOfRooms,
        floor,
        numberOfFloors,
        totalArea,
        material,
        yearOfConstruction,
        price,
        pricePerSquare,
        photoIdList,
        virtualTourImageIdList,
        housingPlanImageIdList,
        creationDate,
      ];
}
