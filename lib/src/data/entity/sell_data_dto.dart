import 'package:equatable/equatable.dart';

class SellDataDTO extends Equatable {
  final int appId;
  final double objectPrice;
  final List<int>? applicationFlagIdList;
  final bool? mortgage;
  final bool? probabilityOfBidding;
  final int? theSizeOfTrades;
  final List<int>? possibleReasonForBiddingIdList;
  final String? note;
  final bool? encumbrance;
  final bool? sharedOwnershipProperty;
  final bool? exchange;
  final String? description;

  const SellDataDTO({
    required this.appId,
    this.applicationFlagIdList,
    this.mortgage,
    this.probabilityOfBidding,
    this.theSizeOfTrades,
    this.possibleReasonForBiddingIdList,
    this.note,
    required this.objectPrice,
    this.encumbrance,
    this.sharedOwnershipProperty,
    this.exchange,
    this.description,
  });

  SellDataDTO copyWith({
    int? appId,
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
      appId: appId ?? this.appId,
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

  factory SellDataDTO.fromJsonMainPageAndSearch(Map<String, dynamic> json) {
    return SellDataDTO(
      appId: json['applicationId'],
      objectPrice: (json['objectPrice'] as int).toDouble(),
    );
  }

  factory SellDataDTO.fromJsonSameApp(Map<String, dynamic> json) {
    return SellDataDTO(
      appId: json['id'],
      objectPrice: json['price'],
    );
  }

  factory SellDataDTO.fromJsonClientView(Map<String, dynamic> json) {
    var bidding = json['possibleReasonForBiddingIdList'];
    var flags = json['applicationFlagIdList'];
    return SellDataDTO(
      appId: json['applicationId'],
      applicationFlagIdList:
          flags != null ? List<int>.from((flags as List)) : null,
      possibleReasonForBiddingIdList:
          bidding != null ? List<int>.from((bidding as List)) : null,
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

  @override
  List<Object?> get props => [
        appId,
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
