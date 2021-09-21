import 'package:equatable/equatable.dart';
import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';
import 'package:jurta_app/src/data/entity/multi_lang_text.dart';
import 'package:jurta_app/src/data/entity/user.dart';

class RealProperty extends Equatable {
  final int realPropertyId;
  final int applicationId;
  final String createdDate;
  final int objectPrice;
  final int numberOfRooms;
  final double totalArea;
  final int? floor;
  final String? residentialComplex;
  final MultiLangText address;
  final String? currentAgent;
  final String? currentAgentPhoto;
  final String? currentAgentPhone;
  final String? currentAgentName;
  final String? currentAgentSurname;
  final String? currentAgentPatronymic;
  final List<String> virtualTourImageIdList;
  final List<String> photoIdList;
  final List<String> housingPlanIdList;
  final bool sold;
  final int? objectTypeId;
  final ObjectTypeMultiLangItem? objectType;
  final MultiLangText? encumbrance;
  final bool? isReserved;
  final int? viewCount;
  final int? houseClassId;
  final User? agent;

  const RealProperty({
    required this.realPropertyId,
    required this.applicationId,
    required this.createdDate,
    required this.objectPrice,
    required this.numberOfRooms,
    required this.totalArea,
    this.floor,
    this.residentialComplex,
    required this.address,
    this.currentAgentPhoto,
    this.currentAgentPhone,
    this.currentAgentName,
    this.currentAgentSurname,
    this.currentAgentPatronymic,
    this.virtualTourImageIdList = const <String>[],
    this.photoIdList = const <String>[],
    this.housingPlanIdList = const <String>[],
    required this.sold,
    this.objectTypeId,
    this.encumbrance,
    this.agent,
    this.currentAgent,
    this.houseClassId,
    this.isReserved,
    this.objectType,
    this.viewCount,
  });

  factory RealProperty.fromJson(Map<String, dynamic> json) {
    var vrList = <String>[];
    var phList = <String>[];
    var hpList = <String>[];

    var vr = json['virtualTourImageIdList'];
    if (vr != null) vrList = List<String>.from(vr as List);
    var ph = json['photoIdList'];
    if (ph != null) phList = List<String>.from(ph as List);
    var hp = json['housingPlanIdList'];
    if (hp != null) hpList = List<String>.from(hp as List);

    var date = json['creationDate'] ?? json['createdDate'];

    var ot = json['objectType'];
    var a = json['agent'];

    return RealProperty(
      realPropertyId: json['realPropertyId'],
      applicationId: json['applicationId'],
      createdDate: date,
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
      encumbrance: json['encumbrance']!=null? MultiLangText.fromJson(json['encumbrance']) : null,
      currentAgent: json['currentAgent'],
      houseClassId: json['houseClassId'],
      isReserved: json['isReserved'],
      objectType: ot != null
          ? ObjectTypeMultiLangItem.fromJson(json['objectType'])
          : null,
      viewCount: json['viewCount'],
      agent: a != null ? User.fromJson(a) : null,
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
        createdDate,
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
        encumbrance,
        currentAgent,
        houseClassId,
        isReserved,
        objectType,
        viewCount,
        agent,
      ];
}
