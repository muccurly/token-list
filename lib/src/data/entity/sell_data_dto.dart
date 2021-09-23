import 'package:equatable/equatable.dart';
import 'package:jurta_app/src/data/entity/real_property.dart';

class SellDataDTO extends Equatable {
  final int applicationId;
  final List<int>? applicationFlagIdList;
  final bool? mortgage;
  final bool? probabilityOfBidding;
  final int? theSizeOfTrades;
  final List<int>? possibleReasonForBiddingIdList;
  final String? note;
  final double objectPrice;
  final bool? encumbrance;
  final bool? sharedOwnershipProperty;
  final bool? exchange;
  final String? description;

  const SellDataDTO({
    required this.applicationId,
    this.applicationFlagIdList,
    this.mortgage,
    this.probabilityOfBidding,
    this.theSizeOfTrades,
    required this.possibleReasonForBiddingIdList,
    this.note,
    required this.objectPrice,
    this.encumbrance,
    this.sharedOwnershipProperty,
    this.exchange,
    this.description,
  });

  SellDataDTO copyWith({
    int? applicationId,
    List<int>? applicationFlagIdList,
    bool? mortgage,
    bool? probabilityOfBidding,
    int? theSizeOfTrades,
    List<int>? possibleReasonForBiddingIdList,
    String? note,
    double? objectPrice,
    bool? encumbrance,
    bool? sharedOwnershipProperty,
    bool? exchange,
    String? description,
  }) {
    return SellDataDTO(
      applicationId: applicationId ?? this.applicationId,
      applicationFlagIdList:
          applicationFlagIdList ?? this.applicationFlagIdList,
      mortgage: mortgage ?? this.mortgage,
      probabilityOfBidding: probabilityOfBidding ?? this.probabilityOfBidding,
      theSizeOfTrades: theSizeOfTrades ?? this.theSizeOfTrades,
      possibleReasonForBiddingIdList:
          possibleReasonForBiddingIdList ?? this.possibleReasonForBiddingIdList,
      note: note ?? this.note,
      objectPrice: objectPrice ?? this.objectPrice,
      encumbrance: encumbrance ?? this.encumbrance,
      sharedOwnershipProperty:
          sharedOwnershipProperty ?? this.sharedOwnershipProperty,
      exchange: exchange ?? this.exchange,
      description: description ?? this.description,
    );
  }

  factory SellDataDTO.fromJson(Map<String, dynamic> json) {
    return SellDataDTO(
      applicationId: json['applicationId'],
      applicationFlagIdList: json['applicationFlagIdList'] != null
          ? List<int>.from((json['applicationFlagIdList'] as List))
          : null,
      possibleReasonForBiddingIdList: json['possibleReasonForBiddingIdList']!= null
          ? List<int>.from((json['possibleReasonForBiddingIdList'] as List))
          : null,
      objectPrice: json['objectPrice'],
      mortgage: json['mortgage'],
      probabilityOfBidding: json['probabilityOfBidding'],
      theSizeOfTrades: json['theSizeOfTrades'],
      note: json['note'],
      encumbrance: json['encumbrance'],
      exchange: json['exchange'],
      description: json['description'],
      sharedOwnershipProperty: json['sharedOwnershipProperty'],
    );
  }

  factory SellDataDTO.fromRealProperty(RealProperty p) {
    return SellDataDTO(
      applicationId: p.applicationId,
      applicationFlagIdList: <int>[],
      possibleReasonForBiddingIdList: <int>[],
      objectPrice: p.objectPrice.toDouble(),
      mortgage: null,
      probabilityOfBidding: null,
      theSizeOfTrades: null,
      note: null,
      encumbrance: null,
      exchange: null,
      description: null,
      sharedOwnershipProperty: null,
    );
  }


  @override
  String toString() {
    return 'SellDataDTO{applicationId: $applicationId, applicationFlagIdList: $applicationFlagIdList, mortgage: $mortgage, probabilityOfBidding: $probabilityOfBidding, theSizeOfTrades: $theSizeOfTrades, possibleReasonForBiddingIdList: $possibleReasonForBiddingIdList, note: $note, objectPrice: $objectPrice, encumbrance: $encumbrance, sharedOwnershipProperty: $sharedOwnershipProperty, exchange: $exchange, description: $description}';
  }

  @override
  List<Object?> get props => [
        applicationId,
        applicationFlagIdList,
        mortgage,
        probabilityOfBidding,
        theSizeOfTrades,
        possibleReasonForBiddingIdList,
        note,
        objectPrice,
        encumbrance,
        sharedOwnershipProperty,
        exchange,
        description,
      ];
}
