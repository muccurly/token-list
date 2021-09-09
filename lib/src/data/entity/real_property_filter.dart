import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:jurta_app/src/data/entity/range.dart';

class RealPropertyFilter extends Equatable {
  final Range areaRange;
  final String direction;
  final int flagId;
  final bool moreThanFiveRooms;
  final List<int> numberOfRooms;
  final int objectTypeId;
  final int pageNumber;
  final int pageSize;
  final Range priceRange;
  final bool showNew;
  final String sortBy;

  const RealPropertyFilter({
    this.areaRange = const Range(0, 9999),
    this.direction = 'ASC',
    required this.flagId,
    this.moreThanFiveRooms = false,
    required this.numberOfRooms,
    required this.objectTypeId,
    this.pageNumber = 0,
    this.pageSize = 10,
    this.priceRange = const Range(0, 999999999),
    this.showNew = false,
    this.sortBy = 'id',
  });

  Map<String, dynamic> toJson() => {
        "areaRange": this.areaRange.toJson(),
        "direction": this.direction,
        "flagId": this.flagId,
        "moreThanFiveRooms": this.moreThanFiveRooms,
        "numberOfRooms": jsonEncode(this.numberOfRooms),
        "objectTypeId": this.objectTypeId,
        "pageNumber": this.pageNumber,
        "pageSize": this.pageSize,
        "priceRange": this.priceRange.toJson(),
        "showNew": this.showNew,
        "sortBy": this.sortBy,
      };

  @override
  List<Object?> get props => [
        areaRange,
        direction,
        flagId,
        moreThanFiveRooms,
        numberOfRooms,
        objectTypeId,
        pageNumber,
        pageSize,
        priceRange,
        showNew,
        sortBy,
      ];
}
