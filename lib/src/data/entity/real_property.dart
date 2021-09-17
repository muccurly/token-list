import 'package:equatable/equatable.dart';
import 'package:jurta_app/src/data/entity/multi_lang_text.dart';

class RealProperty extends Equatable {
  final int realPropertyId;
  final int applicationId;
  final String creationDate;
  final int objectPrice;
  final int numberOfRooms;
  final double totalArea;
  final int? floor;
  final String? residentialComplex;
  final MultiLangText address;
  final String? currentAgentPhoto;
  final String currentAgentPhone;
  final String currentAgentName;
  final String currentAgentSurname;
  final String? currentAgentPatronymic;
  final List<String> virtualTourImageIdList;
  final List<String> photoIdList;
  final List<String> housingPlanIdList;
  final bool sold;
  final int objectTypeId;

  const RealProperty({
    required this.realPropertyId,
    required this.applicationId,
    required this.creationDate,
    required this.objectPrice,
    required this.numberOfRooms,
    required this.totalArea,
    this.floor,
    required this.residentialComplex,
    required this.address,
    this.currentAgentPhoto,
    required this.currentAgentPhone,
    required this.currentAgentName,
    required this.currentAgentSurname,
    required this.currentAgentPatronymic,
    this.virtualTourImageIdList = const <String>[],
    this.photoIdList = const <String>[],
    this.housingPlanIdList = const <String>[],
    required this.sold,
    required this.objectTypeId,
  });

  factory RealProperty.fromJson(Map<String, dynamic> json) {
    var vrList = <String>[];
    var phList = <String>[];
    var hpList = <String>[];

    var vr = json['virtualTourImageIdList'];
    if (vr != null) vrList = (vr as List).map<String>((e) => e).toList();
    var ph = json['photoIdList'];
    if (ph != null) phList = (ph as List).map<String>((e) => e).toList();
    var hp = json['housingPlanIdList'];
    if (hp != null) hpList = (hp as List).map<String>((e) => e).toList();

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
      virtualTourImageIdList: vrList,
      photoIdList: phList,
      housingPlanIdList: hpList,
      sold: json['sold'],
      objectTypeId: json['objectTypeId'],
    );
  }

  static RealProperty fromJsonModel(Map<String, dynamic> json) =>
      RealProperty.fromJson(json);

  @override
  String toString() {
    return '\nRealProperty{id: $realPropertyId}';
  }

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
        objectTypeId,
      ];
}
