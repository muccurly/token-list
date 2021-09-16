import 'package:equatable/equatable.dart';
import 'package:jurta_app/src/data/entity/range.dart';

class RealPropertyFilter extends Equatable {
  final Range? areaRange;
  final String direction;
  final int? flagId;
  final bool moreThanFiveRooms;
  final List<int>? numberOfRooms;
  final int? objectTypeId;
  final int pageNumber;
  final int pageSize;
  final Range? priceRange;
  final bool showNew;
  final String sortBy;

  const RealPropertyFilter({
    this.areaRange,
    this.direction = 'ASC',
    this.flagId,
    this.moreThanFiveRooms = false,
    this.numberOfRooms,
    this.objectTypeId,
    this.pageNumber = 0,
    this.pageSize = 10,
    this.priceRange,
    this.showNew = false,
    this.sortBy = 'id',
  });

  RealPropertyFilter copyWith({
    Range? areaRange,
    String? direction,
    required int? flagId,
    bool? moreThanFiveRooms,
    List<int>? numberOfRooms,
    required int? objectTypeId,
    int? pageNumber,
    int? pageSize,
    Range? priceRange,
    bool? showNew,
    String? sortBy,
  }) {
    return RealPropertyFilter(
      areaRange: areaRange ?? this.areaRange,
      direction: direction ?? this.direction,
      flagId: flagId,
      moreThanFiveRooms: moreThanFiveRooms ?? this.moreThanFiveRooms,
      numberOfRooms: numberOfRooms ?? this.numberOfRooms,
      objectTypeId: objectTypeId,
      pageNumber: pageNumber ?? this.pageNumber,
      pageSize: pageSize ?? this.pageSize,
      priceRange: priceRange ?? this.priceRange,
      showNew: showNew ?? this.showNew,
      sortBy: sortBy ?? this.sortBy,
    );
  }

  Map<String, dynamic> toJson() => {
        "areaRange": this.areaRange?.toJson(),
        "direction": this.direction,
        "flagId": this.flagId,
        "moreThanFiveRooms": this.moreThanFiveRooms,
        "numberOfRooms": this.numberOfRooms,
        "objectTypeId": this.objectTypeId,
        "pageNumber": this.pageNumber,
        "pageSize": this.pageSize,
        "priceRange": this.priceRange?.toJson(),
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

  @override
  String toString() {
    return 'RealPropertyFilter{areaRange: $areaRange, direction: $direction, flagId: $flagId,'
        '\nmoreThanFiveRooms: $moreThanFiveRooms, numberOfRooms: $numberOfRooms, '
        '\nobjectTypeId: $objectTypeId, pageNumber: $pageNumber, pageSize: $pageSize, '
        '\npriceRange: $priceRange, showNew: $showNew, sortBy: $sortBy}';
  }
}
