import 'package:equatable/equatable.dart';
import 'package:jurta_app/src/data/entity/real_property.dart';
import 'package:jurta_app/src/data/entity/sell_data_dto.dart';

class ApplicationClientView extends Equatable {
  final int id;
  final int? operationTypeId;
  final int objectTypeId;
  final int? applicationStatusId;
  final SellDataDTO sellDataDto;
  final RealPropertyDTO realPropertyDTO;
  final String? clientLogin;
  final bool? isReserved;

  const ApplicationClientView({
    required this.id,
    this.operationTypeId,
    required this.objectTypeId,
    this.applicationStatusId,
    required this.sellDataDto,
    required this.realPropertyDTO,
    required this.clientLogin,
    required this.isReserved,
  });

  ApplicationClientView copyWith({
    int? id,
    int? operationTypeId,
    int? objectTypeId,
    int? applicationStatusId,
    SellDataDTO? sellDataDto,
    RealPropertyDTO? realPropertyDTO,
    String? clientLogin,
    bool? isReserved,
  }) {
    return ApplicationClientView(
      id: id ?? this.id,
      operationTypeId: operationTypeId ?? this.operationTypeId,
      objectTypeId: objectTypeId ?? this.objectTypeId,
      applicationStatusId: applicationStatusId ?? this.applicationStatusId,
      sellDataDto: sellDataDto ?? this.sellDataDto,
      realPropertyDTO: realPropertyDTO ?? this.realPropertyDTO,
      clientLogin: clientLogin ?? this.clientLogin,
      isReserved: isReserved ?? this.isReserved,
    );
  }

  factory ApplicationClientView.fromRealProperty(RealProperty property){
    return ApplicationClientView(
      id: property.applicationId,
      operationTypeId: null,
      objectTypeId: property.objectTypeId ?? 0,
      applicationStatusId: null,
      sellDataDto: SellDataDTO.fromRealProperty(property),
      realPropertyDTO: RealPropertyDTO.fromRealProperty(property),
      clientLogin: property.agent?.login,
      isReserved: null,
    );
  }

  factory ApplicationClientView.fromJson(Map<String, dynamic> json) {
    return ApplicationClientView(
      id: json['id'],
      operationTypeId: json['operationTypeId'],
      objectTypeId: json['objectTypeId'],
      applicationStatusId: json['applicationStatusId'],
      sellDataDto: SellDataDTO.fromJson(json['sellDataDto']),
      realPropertyDTO: RealPropertyDTO.fromJson(json['realPropertyDto']),
      clientLogin: json['clientLogin'],
      isReserved: json['isReserved'],
    );
  }


  @override
  String toString() {
    return 'ApplicationClientView{id: $id, operationTypeId: $operationTypeId, objectTypeId: $objectTypeId, applicationStatusId: $applicationStatusId, sellDataDto: $sellDataDto, realPropertyDTO: $realPropertyDTO, clientLogin: $clientLogin, isReserved: $isReserved}';
  }

  @override
  List<Object?> get props => [
        id,
        operationTypeId,
        objectTypeId,
        applicationStatusId,
        sellDataDto,
        realPropertyDTO,
        clientLogin,
        isReserved,
      ];
}
