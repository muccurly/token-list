import 'package:equatable/equatable.dart';
import 'package:jurta_app/src/data/entity/range.dart';
import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';
import 'package:jurta_app/src/data/entity/residential_complex.dart';

class SearchFilter extends Equatable {
  // final int? objectTypeId;
  final DictionaryMultiLangItem? objectType;
  final Range? areaRange;
  final Range? priceRange;
  final String? addressCode;
  final bool? atelier;
  final String direction;
  final bool? encumbrance;
  final bool? exchange;
  final bool? probabilityOfBidding;
  final int? houseClassId;

  // final int? housingConditionId;
  final DictionaryMultiLangItem? housingCondition;
  final bool moreThanFiveRooms;
  final List<int> numberOfRooms;
  final int pageNumber;
  final int pageSize;

  // final int? residentialComplexId;
  final ResidentialComplex? complex;
  final String sortBy;
  final Range? yearOfConstruction;

  const SearchFilter({
    // this.objectTypeId,
    this.objectType,
    this.housingCondition,
    this.areaRange,
    this.priceRange,
    this.addressCode,
    this.atelier,
    this.direction = 'DESC',
    this.encumbrance,
    this.exchange,
    this.probabilityOfBidding,
    this.houseClassId,
    // this.housingConditionId,
    this.moreThanFiveRooms = false,
    this.numberOfRooms = const <int>[],
    this.pageNumber = 0,
    this.pageSize = 20,
    this.complex,
    this.sortBy = 'id',
    this.yearOfConstruction,
  });

  SearchFilter copyWith({
    // int? objectTypeId,
    DictionaryMultiLangItem? objectType,
    DictionaryMultiLangItem? housingCondition,
    Range? areaRange,
    Range? priceRange,
    required String? addressCode,
    required bool? atelier,
    String? direction,
    required bool? encumbrance,
    required bool? exchange,
    required bool? probabilityOfBidding,
    int? houseClassId,
    // int? housingConditionId,
    bool? moreThanFiveRooms,
    List<int>? numberOfRooms,
    int? pageNumber,
    int? pageSize,
    ResidentialComplex? complex,
    String? sortBy,
    Range? yearOfConstruction,
  }) {
    return SearchFilter(
      // objectTypeId: objectTypeId ?? this.objectTypeId,
      objectType: objectType ?? this.objectType,
      housingCondition: housingCondition ?? this.housingCondition,
      areaRange: areaRange ?? this.areaRange,
      priceRange: priceRange ?? this.priceRange,
      addressCode: addressCode,
      atelier: atelier,
      direction: direction ?? this.direction,
      encumbrance: encumbrance,
      exchange: exchange,
      probabilityOfBidding: probabilityOfBidding,
      houseClassId: houseClassId ?? this.houseClassId,
      // housingConditionId: housingConditionId ?? this.housingConditionId,
      moreThanFiveRooms: moreThanFiveRooms ?? this.moreThanFiveRooms,
      numberOfRooms: numberOfRooms ?? this.numberOfRooms,
      pageNumber: pageNumber ?? this.pageNumber,
      pageSize: pageSize ?? this.pageSize,
      complex: complex ?? this.complex,
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
        "probabilityOfBidding": this.probabilityOfBidding,
        "houseClassId": this.houseClassId,
        "housingConditionId":
            this.housingCondition?.id == 0 ? null : this.housingCondition?.id,
        "moreThanFiveRooms": this.moreThanFiveRooms,
        "numberOfRooms": this.numberOfRooms,
        // "objectTypeId": this.objectTypeId != 0 ? this.objectTypeId : null,
        "objectTypeId": this.objectType?.id != 0 ? this.objectType?.id : null,
        "pageNumber": this.pageNumber,
        "pageSize": this.pageSize,
        "priceRange": this.priceRange?.toJson(),
        "residentialComplexId": this.complex?.id == 0 ? null : this.complex?.id,
        "sortBy": this.sortBy,
        "areaRange": this.areaRange?.toJson(),
        "yearOfConstruction": this.yearOfConstruction?.toJson()
      };

  @override
  String toString() {
    return 'SearchFilter{objectTypeId: ${objectType?.id}, areaRange: $areaRange, priceRange: $priceRange, addressCode: $addressCode, atelier: $atelier, direction: $direction, encumbrance: $encumbrance, exchange: $exchange, probabilityOfBidding: $probabilityOfBidding, houseClassId: $houseClassId, housingConditionId: ${housingCondition?.id}, moreThanFiveRooms: $moreThanFiveRooms, numberOfRooms: $numberOfRooms, pageNumber: $pageNumber, pageSize: $pageSize, residentialComplexId: ${complex?.id}, sortBy: $sortBy, yearOfConstruction: $yearOfConstruction}';
  }

  @override
  List<Object?> get props => [
        // objectTypeId,
        objectType,
        housingCondition,
        areaRange,
        priceRange,
        addressCode,
        atelier,
        direction,
        encumbrance,
        exchange,
        probabilityOfBidding,
        houseClassId,
        // housingConditionId,
        moreThanFiveRooms,
        numberOfRooms,
        pageNumber,
        pageSize,
        complex,
        sortBy,
        yearOfConstruction,
      ];
}
