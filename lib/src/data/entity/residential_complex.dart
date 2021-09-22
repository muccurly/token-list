import 'package:equatable/equatable.dart';
import 'package:jurta_app/src/data/entity/address.dart';

class ResidentialComplex extends Equatable {
  final int id;
  final String houseName;
  final int? yearOfConstruction;
  final int? propertyDeveloperId;
  final int? numberOfFloors;
  final int? numberOfEntrances;
  final int numberOfApartment;
  final int? apartmentsOnTheSite;
  final double ceilingHeight;
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
  final bool newBuilding;
  final double? districtRating;
  final double? roadInfrastructureRating;
  final double? districtStatusRating;
  final double? yardRating;
  final double? externalFacadeRating;
  final double? safetyRating;
  final double? parkingRating;
  final double? entranceRating;
  final AddressStreet addressBuilding;

  ResidentialComplex({
    required this.id,
    required this.houseName,
    this.yearOfConstruction,
    this.propertyDeveloperId,
    this.numberOfFloors,
    this.numberOfEntrances,
    required this.numberOfApartment,
    this.apartmentsOnTheSite,
    required this.ceilingHeight,
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
    required this.newBuilding,
    this.districtRating,
    this.roadInfrastructureRating,
    this.districtStatusRating,
    this.yardRating,
    this.externalFacadeRating,
    this.safetyRating,
    this.parkingRating,
    this.entranceRating,
    required this.addressBuilding,
  });

  factory ResidentialComplex.fromJson(Map<String, dynamic> json) {
    return ResidentialComplex(
      id: json['id'],
      houseName: json['houseName'],
      yearOfConstruction: json['yearOfConstruction'],
      propertyDeveloperId: json['propertyDeveloperId'],
      numberOfFloors: json['numberOfFloors'],
      numberOfEntrances: json['numberOfEntrances'],
      numberOfApartment: json['numberOfApartment'],
      apartmentsOnTheSite: json['apartmentsOnTheSite'],
      ceilingHeight: json['ceilingHeight'],
      materialOfConstructionId: json['materialOfConstructionId'],
      housingClass: json['housingClass'],
      houseClassId: json['houseClassId'],
      housingConditionId: json['housingConditionId'],
      typeOfElevatorIdList: json['typeOfElevatorIdList'],
      concierge: json['concierge'],
      wheelchair: json['wheelchair'],
      parkingTypeIds: json['parkingTypeIds'],
      yardTypeId: json['yardTypeId'],
      playground: json['playground'],
      photo: json['photo'],
      hospitalIdList: json['hospitalIdList'],
      schoolIdList: json['schoolIdList'],
      kindergartenIdList: json['kindergartenIdList'],
      shoppingCenterIdList: json['shoppingCenterIdList'],
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
      addressBuilding: json['addressBuilding'],
    );
  }

  static ResidentialComplex fromJsonModel(Map<String, dynamic> json) =>
      ResidentialComplex.fromJson(json);

  @override
  List<Object?> get props => [
        id,
        houseName,
        yearOfConstruction,
        propertyDeveloperId,
        numberOfFloors,
        numberOfEntrances,
        numberOfApartment,
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
