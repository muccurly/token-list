import 'package:equatable/equatable.dart';

class SameAppFilter extends Equatable {
  final String direction;
  final String? districtCode;
  final int? houseRank;
  final int? numberOfRooms;
  final int? objectPrice;
  final int? objectTypeId;
  final int pageNumber;
  final int pageSize;
  final String? sortBy;
  final int? sourceApplicationId;

  const SameAppFilter({
    this.sourceApplicationId,
    this.direction = 'DESC',
    this.districtCode,
    this.houseRank,
    this.numberOfRooms,
    this.objectPrice,
    this.objectTypeId,
    this.pageNumber = 0,
    this.pageSize = 15,
    this.sortBy = "id",
  });

  SameAppFilter copyWith({
    String? direction,
    String? districtCode,
    int? houseRank,
    int? numberOfRooms,
    int? objectPrice,
    int? objectTypeId,
    int? pageNumber,
    int? pageSize,
    String? sortBy,
    int? sourceApplicationId,
  }) {
    return SameAppFilter(
      direction: direction ?? this.direction,
      districtCode: districtCode ?? this.districtCode,
      houseRank: houseRank ?? this.houseRank,
      numberOfRooms: numberOfRooms ?? this.numberOfRooms,
      objectPrice: objectPrice ?? this.objectPrice,
      objectTypeId: objectTypeId ?? this.objectTypeId,
      pageNumber: pageNumber ?? this.pageNumber,
      pageSize: pageSize ?? this.pageSize,
      sortBy: sortBy ?? this.sortBy,
      sourceApplicationId: sourceApplicationId ?? this.sourceApplicationId,
    );
  }

  Map<String, dynamic> toJson() => {
        "direction": "DESC",
        // "districtCode": this.districtCode,
        // "houseRank": this.houseRank,
        "numberOfRooms": this.numberOfRooms,
        "objectPrice": this.objectPrice,
        "objectTypeId": this.objectTypeId,
        "pageNumber": this.pageNumber,
        "pageSize": this.pageSize,
        "sortBy": this.sortBy,
        "sourceApplicationId": this.sourceApplicationId
      };

  @override
  List<Object?> get props => [
        direction,
        districtCode,
        houseRank,
        numberOfRooms,
        objectPrice,
        objectTypeId,
        pageNumber,
        pageSize,
        sortBy,
        sourceApplicationId,
      ];
}
