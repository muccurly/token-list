import 'package:equatable/equatable.dart';
import 'package:jurta_app/src/data/entity/building_dto.dart';
import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';
import 'package:jurta_app/src/data/entity/general_characteristics.dart';
import 'package:jurta_app/src/data/entity/multi_lang_text.dart';
import 'package:jurta_app/src/data/entity/same_property.dart';
import 'package:jurta_app/src/data/entity/user.dart';

class RealProperty extends Equatable {
  final int? realPropertyId;
  final int applicationId;
  final String createdDate;
  final int objectPrice;
  final int numberOfRooms;
  final double totalArea;
  final int? floor;
  final String? residentialComplex;
  final MultiLangText? address;
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
    this.realPropertyId,
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
      encumbrance: json['encumbrance'] != null
          ? MultiLangText.fromJson(json['encumbrance'])
          : null,
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

  factory RealProperty.fromSameProperty(SameProperty property) {
    return RealProperty(
      realPropertyId: null,
      applicationId: property.appId,
      createdDate: property.creationDate,
      objectPrice: property.price.toInt(),
      numberOfRooms: property.numberOfRooms,
      totalArea: property.totalArea,
      address: property.district?.name,
      sold: false,
    );
  }

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

class RealPropertyDTO extends Equatable {
  final int id;
  final bool? atelier;
  final bool? separateBathroom;
  final int notesCount;
  final bool edited;
  final bool filesEdited;
  final BuildingDTO buildingDto;
  final String? cadastralNumber;
  final String? apartmentNumber;
  final int? viewCount;
  final int? metadataId;
  final int? floor;
  final int numberOfRooms;
  final int? numberOfBedrooms;
  final double totalArea;
  final double? livingArea;
  final double? kitchenArea;
  final double? balconyArea;
  final int? sewerageId;
  final int? heatingSystemId;
  final double? landArea;
  final GeneralCharacteristics generalCharacteristicsDto;
  final List<String>? photoIdList;
  final List<String>? housingPlanImageIdList;
  final List<String>? virtualTourImageIdList;
  final MultiLangText? address;

  const RealPropertyDTO({
    required this.id,
    this.atelier,
    this.separateBathroom,
    required this.notesCount,
    required this.edited,
    required this.filesEdited,
    required this.buildingDto,
    this.cadastralNumber,
    this.apartmentNumber,
    required this.viewCount,
    required this.metadataId,
    this.floor,
    required this.numberOfRooms,
    this.numberOfBedrooms,
    required this.totalArea,
    this.livingArea,
    this.kitchenArea,
    this.balconyArea,
    this.sewerageId,
    this.heatingSystemId,
    this.landArea,
    required this.generalCharacteristicsDto,
    this.photoIdList,
    this.housingPlanImageIdList,
    this.virtualTourImageIdList,
    required this.address,
  });

  RealPropertyDTO copyWith({
    int? id,
    bool? atelier,
    bool? separateBathroom,
    int? notesCount,
    bool? edited,
    bool? filesEdited,
    BuildingDTO? buildingDto,
    String? cadastralNumber,
    String? apartmentNumber,
    int? viewCount,
    int? metadataId,
    int? floor,
    int? numberOfRooms,
    int? numberOfBedrooms,
    double? totalArea,
    double? livingArea,
    double? kitchenArea,
    double? balconyArea,
    int? sewerageId,
    int? heatingSystemId,
    double? landArea,
    GeneralCharacteristics? generalCharacteristicsDto,
    List<String>? photoIdList,
    List<String>? housingPlanImageIdList,
    List<String>? virtualTourImageIdList,
    MultiLangText? address,
  }) {
    return RealPropertyDTO(
        id: id ?? this.id,
        atelier: atelier ?? this.atelier,
        separateBathroom: separateBathroom ?? this.separateBathroom,
        notesCount: notesCount ?? this.notesCount,
        edited: edited ?? this.edited,
        filesEdited: filesEdited ?? this.filesEdited,
        buildingDto: buildingDto ?? this.buildingDto,
        cadastralNumber: cadastralNumber ?? this.cadastralNumber,
        apartmentNumber: apartmentNumber ?? this.apartmentNumber,
        viewCount: viewCount ?? this.viewCount,
        metadataId: metadataId ?? this.metadataId,
        floor: floor ?? this.floor,
        numberOfRooms: numberOfRooms ?? this.numberOfRooms,
        numberOfBedrooms: numberOfBedrooms ?? this.numberOfBedrooms,
        totalArea: totalArea ?? this.totalArea,
        livingArea: livingArea ?? this.livingArea,
        kitchenArea: kitchenArea ?? this.kitchenArea,
        balconyArea: balconyArea ?? this.balconyArea,
        sewerageId: sewerageId ?? this.sewerageId,
        heatingSystemId: heatingSystemId ?? this.heatingSystemId,
        landArea: landArea ?? this.landArea,
        generalCharacteristicsDto:
            generalCharacteristicsDto ?? this.generalCharacteristicsDto,
        photoIdList: photoIdList ?? this.photoIdList,
        housingPlanImageIdList:
            housingPlanImageIdList ?? this.housingPlanImageIdList,
        virtualTourImageIdList:
            virtualTourImageIdList ?? this.virtualTourImageIdList,
        address: address ?? this.address);
  }

  factory RealPropertyDTO.fromJson(Map<String, dynamic> json) {
    return RealPropertyDTO(
      id: json['id'],
      atelier: json['atelier'],
      separateBathroom: json['separateBathroom'],
      notesCount: json['notesCount'],
      edited: json['edited'],
      filesEdited: json['filesEdited'],
      buildingDto: BuildingDTO.fromJson(json['buildingDto']),
      cadastralNumber: json['cadastralNumber'],
      apartmentNumber: json['apartmentNumber'],
      viewCount: json['viewCount'],
      metadataId: json['metadataId'],
      floor: json['floor'],
      numberOfRooms: json['numberOfRooms'],
      numberOfBedrooms: json['numberOfBedrooms'],
      totalArea: json['totalArea'],
      livingArea: json['livingArea'],
      kitchenArea: json['kitchenArea'],
      balconyArea: json['balconyArea'],
      sewerageId: json['sewerageId'],
      heatingSystemId: json['heatingSystemId'],
      landArea: json['landArea'],
      generalCharacteristicsDto:
          GeneralCharacteristics.fromJson(json['generalCharacteristicsDto']),
      photoIdList: json['photoIdList'] != null
          ? List<String>.from((json['photoIdList'] as List))
          : null,
      housingPlanImageIdList: json['housingPlanImageIdList'] != null
          ? List<String>.from((json['housingPlanImageIdList'] as List))
          : null,
      virtualTourImageIdList: json['virtualTourImageIdList'] != null
          ? List<String>.from((json['virtualTourImageIdList'] as List))
          : null,
      address: MultiLangText.fromJson(json['address']),
    );
  }

  factory RealPropertyDTO.fromRealProperty(RealProperty p) {
    return RealPropertyDTO(
      id: p.realPropertyId ?? 0,
      atelier: null,
      separateBathroom: null,
      notesCount: 0,
      edited: false,
      filesEdited: false,
      buildingDto: BuildingDTO.fromRealProperty(p),
      cadastralNumber: null,
      apartmentNumber: null,
      viewCount: p.viewCount,
      metadataId: null,
      floor: p.floor,
      numberOfRooms: p.numberOfRooms,
      numberOfBedrooms: null,
      totalArea: p.totalArea,
      livingArea: null,
      kitchenArea: null,
      balconyArea: null,
      landArea: null,
      sewerageId: null,
      heatingSystemId: null,
      generalCharacteristicsDto: GeneralCharacteristics.fromRealProperty(p),
      photoIdList: p.photoIdList,
      housingPlanImageIdList: p.housingPlanIdList,
      virtualTourImageIdList: p.virtualTourImageIdList,
      address: p.address,
    );
  }

  @override
  String toString() {
    return 'RealPropertyDTO{id: $id, atelier: $atelier, separateBathroom: $separateBathroom, notesCount: $notesCount, edited: $edited, filesEdited: $filesEdited, buildingDto: $buildingDto, cadastralNumber: $cadastralNumber, apartmentNumber: $apartmentNumber, viewCount: $viewCount, metadataId: $metadataId, floor: $floor, numberOfRooms: $numberOfRooms, numberOfBedrooms: $numberOfBedrooms, totalArea: $totalArea, livingArea: $livingArea, kitchenArea: $kitchenArea, balconyArea: $balconyArea, sewerageId: $sewerageId, heatingSystemId: $heatingSystemId, landArea: $landArea, generalCharacteristicsDto: $generalCharacteristicsDto, photoIdList: $photoIdList, housingPlanImageIdList: $housingPlanImageIdList, virtualTourImageIdList: $virtualTourImageIdList, address: $address}';
  }

  @override
  List<Object?> get props => [
        id,
        atelier,
        separateBathroom,
        notesCount,
        edited,
        filesEdited,
        buildingDto,
        cadastralNumber,
        apartmentNumber,
        viewCount,
        metadataId,
        floor,
        numberOfRooms,
        numberOfBedrooms,
        totalArea,
        livingArea,
        kitchenArea,
        balconyArea,
        sewerageId,
        heatingSystemId,
        landArea,
        generalCharacteristicsDto,
        photoIdList,
        housingPlanImageIdList,
        virtualTourImageIdList,
        address,
      ];
}
