import 'package:equatable/equatable.dart';
import 'package:jurta_app/src/data/entity/address.dart';

class ResidentialComplex extends Equatable {
  final int? id;
  final String? name;
  final int? yearOfConstruction;
  final int? propertyDeveloperId;
  final int? numberOfFloors;
  final int? numberOfEntrances;
  final int? numberOfApartments;
  final int? apartmentsOnTheSite;
  final double? ceilingHeight;
  final int? materialOfConstructionId;
  final String? housingClass;
  final int? houseClassId;
  final int? housingConditionId;
  final List<int>? typeOfElevatorIdList;
  final bool? concierge;
  final bool? wheelchair;
  final List<int>? parkingTypeIds;
  final int? yardTypeId;
  final bool? playground;
  final List<String>? photo;
  final List<int>? hospitalIdList;
  final List<int>? schoolIdList;
  final List<int>? kindergartenIdList;
  final List<int>? shoppingCenterIdList;
  final double? rating;
  final bool? newBuilding;
  final double? districtRating;
  final double? roadInfrastructureRating;
  final double? districtStatusRating;
  final double? yardRating;
  final double? externalFacadeRating;
  final double? safetyRating;
  final double? parkingRating;
  final double? entranceRating;
  final Building? addressBuilding;

  const ResidentialComplex({
    this.id,
    this.name,
    this.yearOfConstruction,
    this.propertyDeveloperId,
    this.numberOfFloors,
    this.numberOfEntrances,
    this.numberOfApartments,
    this.apartmentsOnTheSite,
    this.ceilingHeight,
    this.materialOfConstructionId,
    this.housingClass,
    this.houseClassId,
    this.housingConditionId,
    this.typeOfElevatorIdList,
    this.concierge,
    this.wheelchair,
    this.parkingTypeIds,
    this.yardTypeId,
    this.playground,
    this.photo,
    this.hospitalIdList,
    this.schoolIdList,
    this.kindergartenIdList,
    this.shoppingCenterIdList,
    this.rating,
    this.newBuilding,
    this.districtRating,
    this.roadInfrastructureRating,
    this.districtStatusRating,
    this.yardRating,
    this.externalFacadeRating,
    this.safetyRating,
    this.parkingRating,
    this.entranceRating,
    this.addressBuilding,
  });

  ResidentialComplex copyWith({
    int? id,
    String? name,
    int? yearOfConstruction,
    int? propertyDeveloperId,
    int? numberOfFloors,
    int? numberOfEntrances,
    int? numberOfApartments,
    int? apartmentsOnTheSite,
    double? ceilingHeight,
    int? materialOfConstructionId,
    String? housingClass,
    int? houseClassId,
    int? housingConditionId,
    List<int>? typeOfElevatorIdList,
    bool? concierge,
    bool? wheelchair,
    List<int>? parkingTypeIds,
    int? yardTypeId,
    bool? playground,
    List<String>? photo,
    List<int>? hospitalIdList,
    List<int>? schoolIdList,
    List<int>? kindergartenIdList,
    List<int>? shoppingCenterIdList,
    double? rating,
    bool? newBuilding,
    double? districtRating,
    double? roadInfrastructureRating,
    double? districtStatusRating,
    double? yardRating,
    double? externalFacadeRating,
    double? safetyRating,
    double? parkingRating,
    double? entranceRating,
    Building? addressBuilding,
  }) {
    return ResidentialComplex(
      id: id ?? this.id,
      name: name ?? this.name,
      yearOfConstruction: yearOfConstruction ?? this.yearOfConstruction,
      propertyDeveloperId: propertyDeveloperId ?? this.propertyDeveloperId,
      numberOfFloors: numberOfFloors ?? this.numberOfFloors,
      numberOfEntrances: numberOfEntrances ?? this.numberOfEntrances,
      numberOfApartments: numberOfApartments ?? this.numberOfApartments,
      apartmentsOnTheSite: apartmentsOnTheSite ?? this.apartmentsOnTheSite,
      ceilingHeight: ceilingHeight ?? this.ceilingHeight,
      materialOfConstructionId:
          materialOfConstructionId ?? this.materialOfConstructionId,
      housingClass: housingClass ?? this.housingClass,
      houseClassId: houseClassId ?? this.houseClassId,
      housingConditionId: housingConditionId ?? this.housingConditionId,
      typeOfElevatorIdList: typeOfElevatorIdList ?? this.typeOfElevatorIdList,
      concierge: concierge ?? this.concierge,
      wheelchair: wheelchair ?? this.wheelchair,
      parkingTypeIds: parkingTypeIds ?? this.parkingTypeIds,
      yardTypeId: yardTypeId ?? this.yardTypeId,
      playground: playground ?? this.playground,
      photo: photo ?? this.photo,
      hospitalIdList: hospitalIdList ?? this.hospitalIdList,
      schoolIdList: schoolIdList ?? this.schoolIdList,
      kindergartenIdList: kindergartenIdList ?? this.kindergartenIdList,
      shoppingCenterIdList: shoppingCenterIdList ?? this.shoppingCenterIdList,
      rating: rating ?? this.rating,
      newBuilding: newBuilding ?? this.newBuilding,
      districtRating: districtRating ?? this.districtRating,
      roadInfrastructureRating:
          roadInfrastructureRating ?? this.roadInfrastructureRating,
      districtStatusRating: districtStatusRating ?? this.districtStatusRating,
      yardRating: yardRating ?? this.yardRating,
      externalFacadeRating: externalFacadeRating ?? this.externalFacadeRating,
      safetyRating: safetyRating ?? this.safetyRating,
      parkingRating: parkingRating ?? this.parkingRating,
      entranceRating: entranceRating ?? this.entranceRating,
      addressBuilding: addressBuilding ?? this.addressBuilding,
    );
  }

  factory ResidentialComplex.fromJsonMainPage(Map<String, dynamic> json) {
    return ResidentialComplex(
      name: json['residentialComplex'],
    );
  }

  factory ResidentialComplex.fromJsonSameApp(Map<String, dynamic> json) {
    var rc = json['residentialComplex'];
    return ResidentialComplex(
      numberOfFloors: json['numberOfFloors'],
      yearOfConstruction: json['yearOfConstruction'],
      name: rc != null ? rc['nameRu'] : null,
    );
  }

  factory ResidentialComplex.fromJson(Map<String, dynamic> json) {
    var h = json['hospitalIdList'];
    var sc = json['schoolIdList'];
    var k = json['kindergartenIdList'];
    var sh = json['shoppingCenterIdList'];
    var e = json['typeOfElevatorIdList'];
    var p = json['parkingTypeIds'];
    var a = json['addressBuilding'];
    return ResidentialComplex(
      id: json['id'],
      name: json['houseName'],
      yearOfConstruction: json['yearOfConstruction'],
      propertyDeveloperId: json['propertyDeveloperId'],
      numberOfFloors: json['numberOfFloors'],
      numberOfEntrances: json['numberOfEntrances'],
      numberOfApartments: json['numberOfApartments'],
      apartmentsOnTheSite: json['apartmentsOnTheSite'],
      ceilingHeight: json['ceilingHeight'],
      materialOfConstructionId: json['materialOfConstructionId'],
      housingClass: json['housingClass'],
      houseClassId: json['houseClassId'],
      housingConditionId: json['housingConditionId'],
      typeOfElevatorIdList: e != null ? List<int>.from((e as List)) : null,
      concierge: json['concierge'],
      wheelchair: json['wheelchair'],
      parkingTypeIds: p != null ? List<int>.from((p as List)) : null,
      yardTypeId: json['yardTypeId'],
      playground: json['playground'],
      photo: json['photo'],
      hospitalIdList: h != null ? List<int>.from((h as List)) : null,
      schoolIdList: sc != null ? List<int>.from((sc as List)) : null,
      kindergartenIdList: k != null ? List<int>.from((k as List)) : null,
      shoppingCenterIdList: sh != null ? List<int>.from((sh as List)) : null,
      rating: json['rating'],
      newBuilding: json['newBuilding'],
      districtRating: json['districtRating'],
      roadInfrastructureRating: json['roadInfrastructureRating'],
      districtStatusRating: json['districtStatusRating'],
      yardRating: json['yardRating'],
      externalFacadeRating: json['externalFacadeRating'],
      safetyRating: json['safetyRating'],
      parkingRating: json['parkingRating'],
      entranceRating: json['entranceRating'],
      addressBuilding: a != null ? Building.fromJson(a) : null,
    );
  }

  static ResidentialComplex fromJsonModel(Map<String, dynamic> json) =>
      ResidentialComplex.fromJson(json);

  static const empty = ResidentialComplex(id: 0, name: 'Любой');

  @override
  List<Object?> get props => [
        id,
        name,
        yearOfConstruction,
        propertyDeveloperId,
        numberOfFloors,
        numberOfEntrances,
        numberOfApartments,
        apartmentsOnTheSite,
        ceilingHeight,
        materialOfConstructionId,
        housingClass,
        houseClassId,
        housingConditionId,
        typeOfElevatorIdList,
        concierge,
        wheelchair,
        parkingTypeIds,
        yardTypeId,
        playground,
        photo,
        hospitalIdList,
        schoolIdList,
        kindergartenIdList,
        shoppingCenterIdList,
        rating,
        newBuilding,
        districtRating,
        roadInfrastructureRating,
        districtStatusRating,
        yardRating,
        externalFacadeRating,
        safetyRating,
        parkingRating,
        entranceRating,
        addressBuilding,
      ];
}
