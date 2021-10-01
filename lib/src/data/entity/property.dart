import 'package:equatable/equatable.dart';
import 'package:jurta_app/src/data/entity/multi_lang_text.dart';
import 'package:jurta_app/src/data/entity/building_dto.dart';
import 'package:jurta_app/src/data/entity/general_characteristics.dart';
import 'package:jurta_app/src/data/entity/sell_data_dto.dart';

class Property extends Equatable {
  final int? id;
  final bool? atelier;
  final bool? separateBathroom;
  final int? notesCount;
  final String? apartmentNumber;
  final int? complexId;
  final int? floor;
  final int? numberOfRooms;
  final int? numberOfBedrooms;
  final double totalArea;
  final double? livingArea;
  final double? kitchenArea;
  final double? balconyArea;
  final double? landArea;
  final int? sewerageId;
  final int? heatingSystemId;
  final List<String>? photoIdList;
  final List<String>? housingPlanImageIdList;
  final List<String>? virtualTourImageIdList;
  final MultiLangText? addressMultiText;
  final String? date;
  final int? viewCount;
  final int? objectTypeId;
  final bool? sold;
  final BuildingDTO? buildingDTOXpm;
  final GeneralCharacteristics? generalCharacteristicsXpm;
  final SellDataDTO sellDataDTOXpm;
  final String? houseClass;

  Property({
    this.id,
    this.atelier,
    this.separateBathroom,
    this.notesCount,
    this.apartmentNumber,
    this.complexId,
    this.floor,
    this.numberOfRooms,
    this.numberOfBedrooms,
    required this.totalArea,
    this.livingArea,
    this.kitchenArea,
    this.balconyArea,
    this.landArea,
    this.sewerageId,
    this.heatingSystemId,
    this.photoIdList,
    this.housingPlanImageIdList,
    this.virtualTourImageIdList,
    this.addressMultiText,
    this.date,
    this.viewCount,
    this.objectTypeId,
    this.sold,
    this.buildingDTOXpm,
    this.generalCharacteristicsXpm,
    required this.sellDataDTOXpm,
    this.houseClass,
  });

  Property copyWith({
    int? id,
    bool? atelier,
    bool? separateBathroom,
    int? notesCount,
    String? apartmentNumber,
    int? complexId,
    int? floor,
    int? numberOfRooms,
    int? numberOfBedrooms,
    double? totalArea,
    double? livingArea,
    double? kitchenArea,
    double? balconyArea,
    double? landArea,
    int? sewerageId,
    int? heatingSystemId,
    List<String>? photoIdList,
    List<String>? housingPlanImageIdList,
    List<String>? virtualTourImageIdList,
    MultiLangText? addressMultiText,
    String? date,
    int? viewCount,
    int? objectTypeId,
    bool? sold,
    BuildingDTO? buildingDTOXpm,
    GeneralCharacteristics? generalCharacteristicsXpm,
    SellDataDTO? sellDataDTOXpm,
    String? houseClass,
  }) {
    return Property(
      id: id ?? this.id,
      atelier: atelier ?? this.atelier,
      separateBathroom: separateBathroom ?? this.separateBathroom,
      notesCount: notesCount ?? this.notesCount,
      apartmentNumber: apartmentNumber ?? this.apartmentNumber,
      complexId: complexId ?? this.complexId,
      floor: floor ?? this.floor,
      numberOfRooms: numberOfRooms ?? this.numberOfRooms,
      numberOfBedrooms: numberOfBedrooms ?? this.numberOfBedrooms,
      totalArea: totalArea ?? this.totalArea,
      livingArea: livingArea ?? this.livingArea,
      kitchenArea: kitchenArea ?? this.kitchenArea,
      balconyArea: balconyArea ?? this.balconyArea,
      landArea: landArea ?? this.landArea,
      sewerageId: sewerageId ?? this.sewerageId,
      heatingSystemId: heatingSystemId ?? this.heatingSystemId,
      photoIdList: photoIdList ?? this.photoIdList,
      housingPlanImageIdList:
          housingPlanImageIdList ?? this.housingPlanImageIdList,
      virtualTourImageIdList:
          virtualTourImageIdList ?? this.virtualTourImageIdList,
      addressMultiText: addressMultiText ?? this.addressMultiText,
      date: date ?? this.date,
      viewCount: viewCount ?? this.viewCount,
      objectTypeId: objectTypeId ?? this.objectTypeId,
      sold: sold ?? this.sold,
      buildingDTOXpm: buildingDTOXpm ?? this.buildingDTOXpm,
      generalCharacteristicsXpm:
          generalCharacteristicsXpm ?? this.generalCharacteristicsXpm,
      sellDataDTOXpm: sellDataDTOXpm ?? this.sellDataDTOXpm,
      houseClass: houseClass ?? this.houseClass,
    );
  }

  factory Property.fromJsonMainPage(Map<String, dynamic> json) {
    var p = json['photoIdList'];
    var h = json['housingPlanImageIdList'];
    var v = json['virtualTourImageIdList'];

    return Property(
      id: json['realPropertyId'],
      floor: json['floor'],
      numberOfRooms: json['numberOfRooms'],
      totalArea: json['totalArea'],
      photoIdList: p != null ? List<String>.from((p as List)) : null,
      housingPlanImageIdList: h != null ? List<String>.from((h as List)) : null,
      virtualTourImageIdList: v != null ? List<String>.from((v as List)) : null,
      addressMultiText: MultiLangText.fromJson(json['address']),
      date: json['creationDate'],
      objectTypeId: json['objectTypeId'],
      sold: json['sold'],
      buildingDTOXpm: BuildingDTO.fromJsonMainPage(json),
      sellDataDTOXpm: SellDataDTO.fromJsonMainPageAndSearch(json),
    );
  }

  factory Property.fromJsonSearchPage(Map<String, dynamic> json) {
    var p = json['photoIdList'];
    var h = json['housingPlanImageIdList'];
    var v = json['virtualTourImageIdList'];

    return Property(
      id: json['realPropertyId'],
      objectTypeId: json['objectTypeId'],
      addressMultiText: MultiLangText.fromJson(json['address']),
      numberOfRooms: json['numberOfRooms'],
      date: json['createdDate'],
      totalArea: json['totalArea'],
      viewCount: json['viewCount'],
      sold: json['sold'],
      floor: json['floor'],
      photoIdList: p != null ? List<String>.from((p as List)) : null,
      housingPlanImageIdList: h != null ? List<String>.from((h as List)) : null,
      virtualTourImageIdList: v != null ? List<String>.from((v as List)) : null,
      sellDataDTOXpm: SellDataDTO.fromJsonMainPageAndSearch(json),
    );
  }

  factory Property.fromJsonClientView(Map<String, dynamic> json) {
    var p = json['realPropertyDto']['photoIdList'];
    var h = json['realPropertyDto']['housingPlanImageIdList'];
    var v = json['realPropertyDto']['virtualTourImageIdList'];
    return Property(
      id: json['realPropertyDto']['id'],
      objectTypeId: json['objectTypeId'],
      atelier: json['atelier'],
      notesCount: json['notesCount'],
      apartmentNumber: json['realPropertyDto']['apartmentNumber'],
      floor: json['realPropertyDto']['floor'],
      numberOfRooms: json['realPropertyDto']['numberOfRooms'],
      numberOfBedrooms: json['realPropertyDto']['numberOfBedrooms'],
      totalArea: json['realPropertyDto']['totalArea'],
      livingArea: json['realPropertyDto']['livingArea'],
      kitchenArea: json['realPropertyDto']['kitchenArea'],
      balconyArea: json['realPropertyDto']['balconyArea'],
      landArea: json['realPropertyDto']['landArea'],
      sewerageId: json['realPropertyDto']['sewerageId'],
      heatingSystemId: json['realPropertyDto']['heatingSystemId'],
      viewCount: json['realPropertyDto']['viewCount'],
      separateBathroom: json['separateBathroom'],
      photoIdList: p != null ? List<String>.from((p as List)) : null,
      housingPlanImageIdList: h != null ? List<String>.from((h as List)) : null,
      virtualTourImageIdList: v != null ? List<String>.from((v as List)) : null,
      sellDataDTOXpm: SellDataDTO.fromJsonClientView(json['sellDataDto']),
      buildingDTOXpm:
          BuildingDTO.fromJson(json['realPropertyDto']['buildingDto']),
      addressMultiText:
          MultiLangText.fromJson(json['realPropertyDto']['address']),
      generalCharacteristicsXpm: GeneralCharacteristics.fromJson(
          json['realPropertyDto']['generalCharacteristicsDto']),
    );
  }

  factory Property.fromJsonSameApp(Map<String, dynamic> json) {
    var p = json['photoIdList'];
    var h = json['housingPlanImageIdList'];
    var v = json['virtualTourImageIdList'];

    return Property(
      apartmentNumber: json['apartmentNumber'],
      numberOfRooms: json['numberOfRooms'],
      floor: json['floor'],
      totalArea: json['totalArea'],
      date: json['creationDate'],
      photoIdList: p != null ? List<String>.from((p as List)) : null,
      housingPlanImageIdList: h != null ? List<String>.from((h as List)) : null,
      virtualTourImageIdList: v != null ? List<String>.from((v as List)) : null,
      buildingDTOXpm: BuildingDTO.fromJsonSameApp(json),
      sellDataDTOXpm: SellDataDTO.fromJsonSameApp(json),
    );
  }

  static Property fromJsonModelMain(Map<String, dynamic> json) =>
      Property.fromJsonMainPage(json);

  static Property fromJsonModelSame(Map<String, dynamic> json) =>
      Property.fromJsonSameApp(json);

  static Property fromJsonModelSearch(Map<String, dynamic> json) =>
      Property.fromJsonSearchPage(json);

  @override
  List<Object?> get props => [
        id,
        atelier,
        separateBathroom,
        notesCount,
        apartmentNumber,
        complexId,
        floor,
        numberOfRooms,
        numberOfBedrooms,
        totalArea,
        livingArea,
        kitchenArea,
        balconyArea,
        landArea,
        sewerageId,
        heatingSystemId,
        photoIdList,
        housingPlanImageIdList,
        virtualTourImageIdList,
        addressMultiText,
        date,
        viewCount,
        objectTypeId,
        sold,
        buildingDTOXpm,
        generalCharacteristicsXpm,
        sellDataDTOXpm,
      ];
}
