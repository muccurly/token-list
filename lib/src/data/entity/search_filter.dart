import 'package:equatable/equatable.dart';
import 'package:jurta_app/src/data/entity/range.dart';

class SearchFilter extends Equatable {
  final int? objectTypeId;
  final Range? areaRange;
  final Range? priceRange;
  final String? addressCode;
  final bool? atelier;
  final String direction;
  final bool? encumbrance;
  final bool? exchange;
<<<<<<< HEAD
=======
  final bool? probabilityOfBidding;
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
  final int? houseClassId;
  final int? housingConditionId;
  final bool moreThanFiveRooms;
  final List<int> numberOfRooms;
  final int pageNumber;
  final int pageSize;
  final int? residentialComplexId;
  final String sortBy;
  final Range? yearOfConstruction;

  const SearchFilter({
    this.objectTypeId,
    this.areaRange,
    this.priceRange,
    this.addressCode,
    this.atelier,
    this.direction = 'DESC',
    this.encumbrance,
    this.exchange,
<<<<<<< HEAD
=======
    this.probabilityOfBidding,
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
    this.houseClassId,
    this.housingConditionId,
    this.moreThanFiveRooms = false,
    this.numberOfRooms = const <int>[],
    this.pageNumber = 0,
<<<<<<< HEAD
    this.pageSize = 15,
=======
    this.pageSize = 20,
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
    this.residentialComplexId,
    this.sortBy = 'id',
    this.yearOfConstruction,
  });

  SearchFilter copyWith({
    int? objectTypeId,
    Range? areaRange,
    Range? priceRange,
    String? addressCode,
    bool? atelier,
    String? direction,
    bool? encumbrance,
    bool? exchange,
<<<<<<< HEAD
=======
    bool? probabilityOfBidding,
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
    int? houseClassId,
    int? housingConditionId,
    bool? moreThanFiveRooms,
    List<int>? numberOfRooms,
    int? pageNumber,
    int? pageSize,
    int? residentialComplexId,
    String? sortBy,
    Range? yearOfConstruction,
  }) {
    return SearchFilter(
      objectTypeId: objectTypeId ?? this.objectTypeId,
      areaRange: areaRange ?? this.areaRange,
      priceRange: priceRange ?? this.priceRange,
      addressCode: addressCode ?? this.addressCode,
<<<<<<< HEAD
      atelier: atelier ?? this.atelier,
      direction: direction ?? this.direction,
      encumbrance: encumbrance ?? this.encumbrance,
      exchange: exchange ?? this.exchange,
=======
      atelier: atelier,
      direction: direction ?? this.direction,
      encumbrance: encumbrance,
      exchange: exchange,
      probabilityOfBidding: probabilityOfBidding,
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
      houseClassId: houseClassId ?? this.houseClassId,
      housingConditionId: housingConditionId ?? this.housingConditionId,
      moreThanFiveRooms: moreThanFiveRooms ?? this.moreThanFiveRooms,
      numberOfRooms: numberOfRooms ?? this.numberOfRooms,
      pageNumber: pageNumber ?? this.pageNumber,
      pageSize: pageSize ?? this.pageSize,
      residentialComplexId: residentialComplexId ?? this.residentialComplexId,
      sortBy: sortBy ?? this.sortBy,
      yearOfConstruction: yearOfConstruction ?? this.yearOfConstruction,
    );
  }

  Map<String, dynamic> toJson() => {
        "addressCode": this.addressCode,
        "atelier": this.atelier,
        "direction": this.direction,
        "encumbrance": this.encumbrance,
        "exchange": this.exchange,
<<<<<<< HEAD
=======
        "probabilityOfBidding": this.probabilityOfBidding,
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
        "houseClassId": this.houseClassId,
        "housingConditionId": this.housingConditionId,
        "moreThanFiveRooms": this.moreThanFiveRooms,
        "numberOfRooms": this.numberOfRooms,
        "objectTypeId": this.objectTypeId,
        "pageNumber": this.pageNumber,
        "pageSize": this.pageSize,
        "price": this.priceRange?.toJson(),
        "residentialComplexId": this.residentialComplexId,
        "sortBy": this.sortBy,
        "totalArea": this.areaRange?.toJson(),
        "yearOfConstruction": this.yearOfConstruction?.toJson()
      };

<<<<<<< HEAD
=======

  @override
  String toString() {
    return 'SearchFilter{objectTypeId: $objectTypeId, areaRange: $areaRange, priceRange: $priceRange, addressCode: $addressCode, atelier: $atelier, direction: $direction, encumbrance: $encumbrance, exchange: $exchange, probabilityOfBidding: $probabilityOfBidding, houseClassId: $houseClassId, housingConditionId: $housingConditionId, moreThanFiveRooms: $moreThanFiveRooms, numberOfRooms: $numberOfRooms, pageNumber: $pageNumber, pageSize: $pageSize, residentialComplexId: $residentialComplexId, sortBy: $sortBy, yearOfConstruction: $yearOfConstruction}';
  }

>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
  @override
  List<Object?> get props => [
        objectTypeId,
        areaRange,
        priceRange,
        addressCode,
        atelier,
        direction,
        encumbrance,
        exchange,
<<<<<<< HEAD
=======
        probabilityOfBidding,
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
        houseClassId,
        housingConditionId,
        moreThanFiveRooms,
        numberOfRooms,
        pageNumber,
        pageSize,
        residentialComplexId,
        sortBy,
        yearOfConstruction,
      ];
}
