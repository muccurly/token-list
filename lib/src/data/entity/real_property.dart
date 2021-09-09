import 'package:equatable/equatable.dart';
import 'package:jurta_app/src/data/entity/multi_lang_text.dart';

class RealProperty extends Equatable {
  final int realPropertyId;
  final int applicationId;
  final String creationDate;
  final double objectPrice;
  final int numberOfRooms;
  final double totalArea;
  final int? floor;
  final String? residentialComplex;
  final MultiLangText address;
  final String currentAgentPhoto;
  final String currentAgentPhone;
  final String currentAgentName;
  final String currentAgentSurname;
  final String currentAgentPatronymic;
  final List<String> virtualTourImageIdList;
  final List<String> photoIdList;
  final List<String> housingPlanIdList;
  final bool sold;

  RealProperty({
    required this.realPropertyId,
    required this.applicationId,
    required this.creationDate,
    required this.objectPrice,
    required this.numberOfRooms,
    required this.totalArea,
    required this.floor,
    required this.residentialComplex,
    required this.address,
    required this.currentAgentPhoto,
    required this.currentAgentPhone,
    required this.currentAgentName,
    required this.currentAgentSurname,
    required this.currentAgentPatronymic,
    required this.virtualTourImageIdList,
    required this.photoIdList,
    required this.housingPlanIdList,
    required this.sold,
  });

  factory RealProperty.fromJson(Map<String, dynamic> json) {
    return RealProperty(
      realPropertyId: json['realPropertyId'],
      applicationId: json['applicationId'],
      creationDate: json['creationDate'],
      objectPrice: json['objectPrice'],
      numberOfRooms: json['numberOfRooms'],
      totalArea: json['totalArea'],
      floor: json['floor'],
      residentialComplex: json['residentialComplex'],
      address: MultiLangText.fromJson(json['address']),
      currentAgentPhoto: json['currentAgentPhoto'],
      currentAgentPhone: json['currentAgent'],
      currentAgentName: json['currentAgentName'],
      currentAgentSurname: json['currentAgentSurname'],
      currentAgentPatronymic: json['currentAgentPatronymic'],
      virtualTourImageIdList: (json['virtualTourImageIdList'] as List)
          .map<String>((e) => e)
          .toList(),
      photoIdList: (json['photoIdList'] as List).map<String>((e) => e).toList(),
      housingPlanIdList:
          (json['housingPlanIdList'] as List).map<String>((e) => e).toList(),
      sold: json['sold'],
    );
  }

  static RealProperty fromJsonModel(Map<String, dynamic> json) =>
      RealProperty.fromJson(json);

  @override
  List<Object?> get props => [
        realPropertyId,
        applicationId,
        creationDate,
        objectPrice,
        numberOfRooms,
        totalArea,
        floor,
        residentialComplex,
        address,
        currentAgentPhoto,
        currentAgentPhone,
        currentAgentName,
        currentAgentSurname,
        currentAgentPatronymic,
        virtualTourImageIdList,
        photoIdList,
        housingPlanIdList,
        sold,
      ];
}
