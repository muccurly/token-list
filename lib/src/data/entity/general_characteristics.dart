import 'package:equatable/equatable.dart';
import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';

class GeneralCharacteristics extends Equatable {
  final int? materialOfConstructionId;
  final bool? concierge;
  final bool? wheelchair;
  final int? yardTypeId;
  final bool? playground;
  final List<int>? typeOfElevatorList;
  final List<int>? parkingTypeIds;
  final List<InfoTypeXpm>? parkingTypeList;
  final int? propertyDeveloperId;
  final CondMultiLangItem? housingClass;
  final int? houseClassId;
  final int? yearOfConstruction;
  final int? numberOfFloors;
  final int? numberOfApartments;
  final int? apartmentsOnTheSite;
  final double? ceilingHeight;
  final CondMultiLangItem? houseCondition;
  final InfoTypeXpm? materialOfConstruction;
  final InfoTypeXpm? yardType;

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
    List<InfoTypeXpm>? parkingTypeList,
    int? propertyDeveloperId,
    CondMultiLangItem? housingClass,
    int? houseClassId,
    int? yearOfConstruction,
    int? numberOfFloors,
    int? numberOfApartments,
    int? apartmentsOnTheSite,
    double? ceilingHeight,
    CondMultiLangItem? houseCondition,
    InfoTypeXpm? materialOfConstruction,
    InfoTypeXpm? yardType,
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
    var e = json['typeOfElevatorList'];
    var p = json['parkingTypeIds'];
    var pp = json['parkingTypeList'];
    return GeneralCharacteristics(
      materialOfConstructionId: json['materialOfConstructionId'],
      concierge: json['concierge'],
      wheelchair: json['wheelchair'],
      yardTypeId: json['yardTypeId'],
      playground: json['playground'],
      typeOfElevatorList: e != null ? List<int>.from((e as List)) : null,
      parkingTypeIds: p != null ? List<int>.from((p as List)) : null,
      parkingTypeList: pp != null
          ? List<InfoTypeXpm>.from(
              (pp as List).map((it) => InfoTypeXpm.fromJson(it)))
          : null,
      propertyDeveloperId: json['propertyDeveloperId'],
      housingClass: json['housingClass'] != null
          ? CondMultiLangItem.fromJson(json['housingClass'])
          : null,
      houseClassId: json['houseClassId'],
      yearOfConstruction: json['yearOfConstruction'],
      numberOfFloors: json['numberOfFloors'],
      numberOfApartments: json['numberOfApartments'],
      apartmentsOnTheSite: json['apartmentsOnTheSite'],
      ceilingHeight: json['ceilingHeight'],
      houseCondition: json['houseCondition'] != null
          ? CondMultiLangItem.fromJson(json['houseCondition'])
          : null,
      materialOfConstruction: json['materialOfConstruction'] != null
          ? InfoTypeXpm.fromJson(json['materialOfConstruction'])
          : null,
      yardType: json['yardType'] != null
          ? InfoTypeXpm.fromJson(json['yardType'])
          : null,
    );
  }

  @override
  List<Object?> get props => [
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

class InfoTypeXpm extends Equatable {
  final int id;
  final String nameKz;
  final String nameEn;
  final String nameRu;
  final String? code;
  final String? operationCode;
  final double? rating;

  const InfoTypeXpm({
    required this.id,
    required this.nameKz,
    required this.nameEn,
    required this.nameRu,
    this.code,
    this.operationCode,
    this.rating,
  });

  InfoTypeXpm copyWith({
    int? id,
    String? nameKz,
    String? nameEn,
    String? nameRu,
    String? code,
    String? operationCode,
    double? rating,
  }) {
    return InfoTypeXpm(
      id: id ?? this.id,
      nameKz: nameKz ?? this.nameKz,
      nameEn: nameEn ?? this.nameEn,
      nameRu: nameRu ?? this.nameRu,
      code: code ?? this.code,
      operationCode: operationCode ?? this.operationCode,
      rating: rating ?? this.rating,
    );
  }

  factory InfoTypeXpm.fromJson(Map<String, dynamic> json) {
    return InfoTypeXpm(
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
  List<Object?> get props => [
        id,
        nameKz,
        nameEn,
        nameRu,
        code,
        operationCode,
        rating,
      ];
}
