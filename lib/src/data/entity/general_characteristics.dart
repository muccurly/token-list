import 'package:equatable/equatable.dart';
import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';
import 'package:jurta_app/src/data/entity/real_property.dart';

class GeneralCharacteristics extends Equatable {
  final int? materialOfConstructionId;
  final bool? concierge;
  final bool? wheelchair;
  final int? yardTypeId;
  final bool? playground;
  final List<int>? typeOfElevatorList;
  final List<int>? parkingTypeIds;
  final List<InfoType>? parkingTypeList;
  final int? propertyDeveloperId;
  final String? housingClass;
  final int? houseClassId;
  final int? yearOfConstruction;
  final int? numberOfFloors;
  final int? numberOfApartments;
  final int? apartmentsOnTheSite;
  final double? ceilingHeight;
  final DictionaryMultiLangItem? houseCondition;
  final InfoType? materialOfConstruction;
  final InfoType? yardType;

  const GeneralCharacteristics({
    this.materialOfConstructionId,
    this.concierge,
    this.wheelchair,
    this.yardTypeId,
    this.playground,
    this.typeOfElevatorList,
    this.parkingTypeIds,
    this.parkingTypeList,
    this.propertyDeveloperId,
    this.housingClass,
    this.houseClassId,
    this.yearOfConstruction,
    this.numberOfFloors,
    this.numberOfApartments,
    this.apartmentsOnTheSite,
    this.ceilingHeight,
    this.houseCondition,
    this.materialOfConstruction,
    this.yardType,
  });

  GeneralCharacteristics copyWith({
    int? materialOfConstructionId,
    bool? concierge,
    bool? wheelchair,
    int? yardTypeId,
    bool? playground,
    List<int>? typeOfElevatorList,
    List<int>? parkingTypeIds,
    List<InfoType>? parkingTypeList,
    int? propertyDeveloperId,
    String? housingClass,
    int? houseClassId,
    int? yearOfConstruction,
    int? numberOfFloors,
    int? numberOfApartments,
    int? apartmentsOnTheSite,
    double? ceilingHeight,
    DictionaryMultiLangItem? houseCondition,
    InfoType? materialOfConstruction,
    InfoType? yardType,
  }) {
    return GeneralCharacteristics(
      materialOfConstructionId:
      materialOfConstructionId ?? this.materialOfConstructionId,
      concierge: concierge ?? this.concierge,
      wheelchair: wheelchair ?? this.wheelchair,
      yardTypeId: yardTypeId ?? this.yardTypeId,
      playground: playground ?? this.playground,
      typeOfElevatorList: typeOfElevatorList ?? this.typeOfElevatorList,
      parkingTypeIds: parkingTypeIds ?? this.parkingTypeIds,
      parkingTypeList: parkingTypeList ?? this.parkingTypeList,
      propertyDeveloperId: propertyDeveloperId ?? this.propertyDeveloperId,
      housingClass: housingClass ?? this.housingClass,
      houseClassId: houseClassId ?? this.houseClassId,
      yearOfConstruction: yearOfConstruction ?? this.yearOfConstruction,
      numberOfFloors: numberOfFloors ?? this.numberOfFloors,
      numberOfApartments: numberOfApartments ?? this.numberOfApartments,
      apartmentsOnTheSite: apartmentsOnTheSite ?? this.apartmentsOnTheSite,
      ceilingHeight: ceilingHeight ?? this.ceilingHeight,
      houseCondition: houseCondition ?? this.houseCondition,
      materialOfConstruction:
      materialOfConstruction ?? this.materialOfConstruction,
      yardType: yardType ?? this.yardType,
    );
  }

  factory GeneralCharacteristics.fromJson(Map<String, dynamic> json) {
    return GeneralCharacteristics(
      materialOfConstructionId: json['materialOfConstructionId'],
      concierge: json['concierge'],
      wheelchair: json['wheelchair'],
      yardTypeId: json['yardTypeId'],
      playground: json['playground'],
      typeOfElevatorList: json['typeOfElevatorList']!=null
          ? List<int>.from((json['typeOfElevatorList'] as List))
          : null,
      parkingTypeIds: json['parkingTypeIds']!=null
          ? List<int>.from((json['parkingTypeIds'] as List))
          : null,
      parkingTypeList: json['parkingTypeList'] != null
          ? List<InfoType>.from((json['parkingTypeList'] as List)
          .map((e) => InfoType.fromJson(e)))
          : null,
      propertyDeveloperId: json['propertyDeveloperId'],
      housingClass: json['housingClass'],
      houseClassId: json['houseClassId'],
      yearOfConstruction: json['yearOfConstruction'],
      numberOfFloors: json['numberOfFloors'],
      numberOfApartments: json['numberOfApartments'],
      apartmentsOnTheSite: json['apartmentsOnTheSite'],
      ceilingHeight: json['ceilingHeight'],
      houseCondition: json['houseCondition'] != null
          ? DictionaryMultiLangItem.fromJson(json['houseCondition'])
          : null,
      materialOfConstruction: json['materialOfConstruction'] != null
          ? InfoType.fromJson(json['materialOfConstruction'])
          : null,
      yardType:
      json['yardType'] != null ? InfoType.fromJson(json['yardType']) : null,
    );
  }

  factory GeneralCharacteristics.fromRealProperty(RealProperty p) {
    return GeneralCharacteristics(
      materialOfConstructionId: null,
      concierge: null,
      wheelchair: null,
      yardTypeId: null,
      playground: null,
      typeOfElevatorList: null,
      parkingTypeIds: null,
      parkingTypeList: null,
      propertyDeveloperId: null,
      housingClass: null,
      houseClassId: p.houseClassId,
      yearOfConstruction: null,
      numberOfFloors: null,
      numberOfApartments: null,
      apartmentsOnTheSite: null,
      ceilingHeight: null,
      houseCondition: null,
      materialOfConstruction: null,
      yardType: null,
    );
  }


  @override
  String toString() {
    return 'GeneralCharacteristics{materialOfConstructionId: $materialOfConstructionId, concierge: $concierge, wheelchair: $wheelchair, yardTypeId: $yardTypeId, playground: $playground, typeOfElevatorList: $typeOfElevatorList, parkingTypeIds: $parkingTypeIds, parkingTypeList: $parkingTypeList, propertyDeveloperId: $propertyDeveloperId, housingClass: $housingClass, houseClassId: $houseClassId, yearOfConstruction: $yearOfConstruction, numberOfFloors: $numberOfFloors, numberOfApartments: $numberOfApartments, apartmentsOnTheSite: $apartmentsOnTheSite, ceilingHeight: $ceilingHeight, houseCondition: $houseCondition, materialOfConstruction: $materialOfConstruction, yardType: $yardType}';
  }

  @override
  List<Object?> get props =>
      [
        materialOfConstructionId,
        concierge,
        wheelchair,
        yardTypeId,
        playground,
        typeOfElevatorList,
        parkingTypeIds,
        parkingTypeList,
        propertyDeveloperId,
        housingClass,
        houseClassId,
        yearOfConstruction,
        numberOfFloors,
        numberOfApartments,
        apartmentsOnTheSite,
        ceilingHeight,
        houseCondition,
        materialOfConstruction,
        yardType,
      ];
}

class InfoType extends Equatable {
  final int id;
  final String nameKz;
  final String nameEn;
  final String nameRu;
  final String? code;
  final String? operationCode;
  final double? rating;

  const InfoType({
    required this.id,
    required this.nameKz,
    required this.nameEn,
    required this.nameRu,
    this.code,
    this.operationCode,
    this.rating,
  });

  InfoType copyWith({
    int? id,
    String? nameKz,
    String? nameEn,
    String? nameRu,
    String? code,
    String? operationCode,
    double? rating,
  }) {
    return InfoType(
      id: id ?? this.id,
      nameKz: nameKz ?? this.nameKz,
      nameEn: nameEn ?? this.nameEn,
      nameRu: nameRu ?? this.nameRu,
      code: code ?? this.code,
      operationCode: operationCode ?? this.operationCode,
      rating: rating ?? this.rating,
    );
  }

  factory InfoType.fromJson(Map<String, dynamic> json) {
    return InfoType(
      id: json['id'],
      nameKz: json['nameKz'],
      nameEn: json['nameEn'],
      nameRu: json['nameRu'],
      code: json['code'],
      operationCode: json['operationCode'],
      rating: json['rating'],
    );
  }

  @override
  List<Object?> get props =>
      [
        id,
        nameKz,
        nameEn,
        nameRu,
        code,
        operationCode,
        rating,
      ];
}
