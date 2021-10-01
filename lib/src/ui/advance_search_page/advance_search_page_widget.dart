import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jurta_app/src/business_logic/search/search.dart';
import 'package:jurta_app/src/data/entity/search_filter.dart';
import 'package:jurta_app/src/data/entity/address.dart';
import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';
import 'package:jurta_app/src/data/entity/residential_complex.dart';
import 'package:jurta_app/src/ui/components/Complex_search.dart';
import 'package:jurta_app/src/ui/components/range_widget.dart';
import 'package:jurta_app/src/ui/components/street_search_widget.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_util.dart';
import 'package:jurta_app/src/ui/search_result_page/search_result_page_widget.dart';
import 'package:jurta_app/src/utils/extensions.dart';
import 'package:jurta_app/src/utils/placeholders.dart' as placeholders;

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class AdvanceSearchPageWidget extends StatefulWidget {
  AdvanceSearchPageWidget({Key? key}) : super(key: key);

  @override
  _AdvanceSearchPageWidgetState createState() =>
      _AdvanceSearchPageWidgetState();
}

class _AdvanceSearchPageWidgetState extends State<AdvanceSearchPageWidget> {
  // String? dropDownValue1;
  final TextEditingController _priceFromController = TextEditingController();
  final TextEditingController _priceToController = TextEditingController();
  final TextEditingController _areaFromController = TextEditingController();
  final TextEditingController _areaToController = TextEditingController();
  final TextEditingController _yearFromController = TextEditingController();
  final TextEditingController _yearToController = TextEditingController();
  final TextEditingController _complexController = TextEditingController();
  final TextEditingController _streetController = new TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  DictionaryMultiLangItem? dropDownValue;
  DictionaryMultiLangItem? condDrop;
  Address? cityDrop;
  Address? distDrop;
  Address? streetDrop;
  ResidentialComplex? complexDrop;

  static const _PRICE = 'price';
  static const _AREA = 'area';
  static const _YEAR = 'year';

  @override
  void initState() {
    _setFields();
    super.initState();
  }

  _setFields() {
    SearchState state = BlocProvider.of<SearchBloc>(context).state;
    SearchFilter filter = BlocProvider.of<SearchBloc>(context).state.filter;
    if (filter.priceRange != null) {
      if (filter.priceRange!.from != null)
        _priceFromController.text = filter.priceRange!.from.toString();
      if (filter.priceRange!.to != null)
        _priceToController.text = filter.priceRange!.to.toString();
    }
    if (filter.areaRange != null) {
      if (filter.areaRange!.from != null)
        _areaFromController.text = filter.areaRange!.from.toString();
      if (filter.areaRange!.to != null)
        _areaToController.text = filter.areaRange!.to.toString();
    }
    if (filter.objectType != null)
      dropDownValue = filter.objectType;
    else
      dropDownValue = DictionaryMultiLangItem.empty;
    if (state.city != null) cityDrop = state.city!;
    if (state.district != null)
      distDrop = state.district!;
    else
      distDrop = Address.empty;
    if (state.street != null) {
      streetDrop = state.street!;
      _streetController.text = state.street!.address!.addressObject.name.nameRu;
    } else
      streetDrop = Address.empty;
    if (state.complex != null) {
      complexDrop = state.complex!;
      _complexController.text = state.complex!.name!;
    } else
      complexDrop = ResidentialComplex.empty;
    if (state.filter.housingCondition != null)
      condDrop = state.filter.housingCondition;
    else
      condDrop = DictionaryMultiLangItem.emptyE;
  }

  @override
  void dispose() {
    _priceFromController.dispose();
    _priceToController.dispose();
    _areaFromController.dispose();
    _areaToController.dispose();
    _yearFromController.dispose();
    _yearToController.dispose();
    _streetController.dispose();
    _complexController.dispose();
    super.dispose();
  }

  void _onChanged({
    required TextEditingController fromC,
    required TextEditingController toC,
    required String value,
    required bool priceFrom,
    required String type,
  }) {
    int? f, t;
    if (fromC.text.isNotEmpty) f = int.parse(fromC.text.noWhiteSpaces());
    if (toC.text.isNotEmpty) t = int.parse(toC.text.noWhiteSpaces());
    switch (type) {
      case _PRICE:
        context.read<SearchBloc>().add(SearchPriceRangeChanged(f, t));
        break;
      case _AREA:
        context.read<SearchBloc>().add(SearchAreaRangeChanged(f, t));
        break;
      case _YEAR:
        context.read<SearchBloc>().add(YearsRangeChanged(f, t));
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!.localeName;
    final _size = MediaQuery.of(context).size;

    return BlocListener<SearchBloc, SearchState>(
      listenWhen: (p, c) => p.searchStatus != c.searchStatus,
      listener: (context, state) async {
        if (state.searchStatus.isSubmissionSuccess) {
          if (state.properties.isNotEmpty)
            await Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                duration: Duration(milliseconds: 300),
                reverseDuration: Duration(milliseconds: 300),
                child: SearchResultPageWidget(
                  isSearchMini: false,
                ),
              ),
            );
          else
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Поиск не дал результатов'),
              ),
            );
        }
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.tertiaryColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            elevation: 0,
            backgroundColor: FlutterFlowTheme.tertiaryColor,
            leading: InkWell(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_outlined,
                color: Colors.black,
                size: 22,
              ),
            ),
            title: Text(
              AppLocalizations.of(context)!.back.capitalize(),
              style: FlutterFlowTheme.subtitleTextDark.copyWith(),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 8),
                      child: Text(
                        AppLocalizations.of(context)!
                            .propertyType
                            .toUpperCase(),
                        style: FlutterFlowTheme.titleTextWDark,
                      ),
                    ),
                    BlocBuilder<SearchBloc, SearchState>(
                      buildWhen: (previous, current) =>
                          previous.objectTypes != current.objectTypes ||
                          previous.filter.objectType !=
                              current.filter.objectType,
                      builder: (context, state) {
                        if (state.objectTypes.isEmpty)
                          return placeholders.objectTypesDropDownPlaceholder;
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.transparent,
                                width: 0,
                              ),
                              color: Colors.white,
                            ),
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<DictionaryMultiLangItem>(
                                  value: dropDownValue,
                                  items: state.objectTypes
                                      .map((e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(
                                              locale == 'ru'
                                                  ? e.name.nameRu
                                                  : locale == 'kk'
                                                      ? e.name.nameKz
                                                      : e.name.nameEn,
                                              style:
                                                  FlutterFlowTheme.darkNormal16,
                                            ),
                                          ))
                                      .toList(),
                                  elevation: 2,
                                  onChanged: (value) {
                                    if (value != null) {
                                      setState(() => dropDownValue = value);
                                      context
                                          .read<SearchBloc>()
                                          .add(SearchObjectTypeChoose(value));
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: FlutterFlowTheme.secondaryColor,
                                    size: 24,
                                  ),
                                  isExpanded: true,
                                  dropdownColor: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 8),
                      child: Text(
                        AppLocalizations.of(context)!
                            .numberOfRooms
                            .toUpperCase(),
                        style: FlutterFlowTheme.titleTextWDark,
                      ),
                    ),
                    SearchRoomsWidget(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                      child: Text(
                        '${AppLocalizations.of(context)!.priceRange.toUpperCase()}, \u{3012}',
                        style: FlutterFlowTheme.titleTextWDark,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: RangeWidget(
                        fromController: _priceFromController,
                        toController: _priceToController,
                        onChanged: (String value, bool from) => _onChanged(
                            fromC: _priceFromController,
                            toC: _priceToController,
                            value: value,
                            priceFrom: from,
                            type: _PRICE),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                      child: Text(
                        '${AppLocalizations.of(context)!.area.toUpperCase()}, м²',
                        style: FlutterFlowTheme.titleTextWDark,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: RangeWidget(
                        fromController: _areaFromController,
                        toController: _areaToController,
                        onChanged: (String value, bool from) => _onChanged(
                            fromC: _areaFromController,
                            toC: _areaToController,
                            value: value,
                            priceFrom: from,
                            type: _AREA),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                      child: Text(
                        'МЕСТОПОЛОЖЕНИЕ',
                        style: FlutterFlowTheme.searchPageTitle.copyWith(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: BlocBuilder<SearchBloc, SearchState>(
                        buildWhen: (previous, current) =>
                            previous.cities != current.cities,
                        builder: (context, state) {
                          if (state.cities.isEmpty)
                            return placeholders.objectTypesDropDownPlaceholder;
                          return DropDownAddress(
                            dropValue: cityDrop,
                            items: state.cities,
                            hintText: 'Город',
                            onChanged: (v) {
                              setState(() => cityDrop = v);
                              context.read<SearchBloc>().add(CityChanged(v));
                              distDrop = Address.empty;
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: BlocBuilder<SearchBloc, SearchState>(
                        buildWhen: (previous, current) =>
                            previous.districts != current.districts ||
                            previous.districtsStatus != current.districtsStatus,
                        builder: (context, state) {
                          if (state.districtsStatus.isSubmissionInProgress)
                            return placeholders.objectTypesDropDownPlaceholder;
                          return DropDownAddress(
                            dropValue: distDrop,
                            items: state.districts,
                            hintText: 'Район',
                            onChanged: (v) {
                              setState(() => distDrop = v);
                              context
                                  .read<SearchBloc>()
                                  .add(DistrictChanged(v));
                              streetDrop = Address.empty;
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Row(
                        children: [
                          Expanded(
                            child: BlocBuilder<SearchBloc, SearchState>(
                              buildWhen: (previous, current) =>
                                  previous.streets != current.streets ||
                                  previous.streetsStatus !=
                                      current.streetsStatus,
                              builder: (context, state) {
                                if (state.streetsStatus.isSubmissionInProgress)
                                  return placeholders
                                      .objectTypesDropDownPlaceholder;
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Colors.transparent,
                                      width: 0,
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: TextField(
                                      enabled: distDrop!= Address.empty,
                                      controller: _streetController,
                                      onTap: distDrop!= Address.empty
                                          ? () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.vertical(
                                                  top: Radius.circular(16))),
                                          context: context,
                                          backgroundColor:
                                          FlutterFlowTheme.tertiaryColor,
                                          builder: (context) {
                                            return Container(
                                              height: 500,
                                              child: StreetSearch(
                                                streets: state.streets,
                                                onChoice: (a){
                                                  context.read<SearchBloc>().add(StreetChanged(a));
                                                  _streetController.text = a.address!.addressObject.name.nameRu;
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      } : null,
                                      decoration: InputDecoration(
                                        hintText: 'Улица',
                                        hintStyle: const TextStyle(
                                            color: const Color(
                                                0xFFADADAD)),
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder:
                                        InputBorder.none,
                                      ),
                                      onChanged: (v) {
                                        // if (v.isEmpty)
                                        //   setState(() => complexDrop =
                                        //       ResidentialComplex
                                        //           .empty);
                                      },
                                    ),
                                  ),
                                  // InkWell(
                                  //   onTap: () async {
                                  //     await showModalBottomSheet(
                                  //       isScrollControlled: true,
                                  //       shape: RoundedRectangleBorder(
                                  //           borderRadius: BorderRadius.vertical(
                                  //               top: Radius.circular(16))),
                                  //       context: context,
                                  //       backgroundColor:
                                  //           FlutterFlowTheme.tertiaryColor,
                                  //       builder: (context) {
                                  //         return Container(
                                  //           height: 500,
                                  //           child: StreetSearch(
                                  //             streets: state.streets,
                                  //           ),
                                  //         );
                                  //       },
                                  //     );
                                  //   },
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.only(right: 5),
                                  //     child: Container(
                                  //       width: MediaQuery.of(context).size.width,
                                  //       height: 40,
                                  //       decoration: BoxDecoration(
                                  //         borderRadius: BorderRadius.circular(8),
                                  //         border: Border.all(
                                  //           color: Colors.transparent,
                                  //           width: 0,
                                  //         ),
                                  //         color: Colors.white,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: BlocBuilder<SearchBloc, SearchState>(
                                buildWhen: (previous, current) =>
                                    previous.complexes != current.complexes ||
                                    previous.complexStatus !=
                                        current.complexStatus,
                                builder: (context, state) {
                                  if (state
                                      .complexStatus.isSubmissionInProgress)
                                    return placeholders
                                        .objectTypesDropDownPlaceholder;
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Colors.transparent,
                                        width: 0,
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: new TextField(
                                        enabled: distDrop!= Address.empty,
                                        controller: _complexController,
                                        onTap: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.vertical(
                                                    top: Radius.circular(16))),
                                            context: context,
                                            backgroundColor:
                                            FlutterFlowTheme.tertiaryColor,
                                            builder: (context) {
                                              return Container(
                                                height: 500,
                                                child: ComplexSearch(
                                                  complex: state.complexes,
                                                  onChoice: (a){
                                                    context.read<SearchBloc>().add(ComplexChanged(a));
                                                    _complexController.text = a.name!;
                                                  },
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'ЖК',
                                          hintStyle: const TextStyle(
                                              color: const Color(
                                                  0xFFADADAD)),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder:
                                              InputBorder.none,
                                        ),
                                        onChanged: (v) {
                                          // if (v.isEmpty)
                                          //   setState(() => complexDrop =
                                          //       ResidentialComplex
                                          //           .empty);
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                      child: Text(
                        'ПЛАНИРОВКА',
                        style: FlutterFlowTheme.searchPageTitle.copyWith(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: BlocBuilder<SearchBloc, SearchState>(
                                builder: (context, state) {
                              return Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: state.filter.atelier == null
                                    ? FlutterFlowTheme.primaryColor
                                    : FlutterFlowTheme.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(8),
                                  onTap: () => context
                                      .read<SearchBloc>()
                                      .add(AtelierChanged(null)),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 17, 0, 17),
                                    child: Text(
                                      'Любая',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: state.filter.atelier == null
                                            ? FlutterFlowTheme.white
                                            : FlutterFlowTheme.dark,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                          Expanded(
                            child: BlocBuilder<SearchBloc, SearchState>(
                                builder: (context, state) {
                              return Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: state.filter.atelier == false
                                    ? FlutterFlowTheme.primaryColor
                                    : FlutterFlowTheme.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(8),
                                  onTap: () => context
                                      .read<SearchBloc>()
                                      .add(AtelierChanged(false)),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: Text(
                                      'Изолированные\nкомнаты',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        color: state.filter.atelier == false
                                            ? FlutterFlowTheme.white
                                            : FlutterFlowTheme.dark,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                          Expanded(
                            child: BlocBuilder<SearchBloc, SearchState>(
                                builder: (context, state) {
                              return Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: state.filter.atelier == true
                                    ? FlutterFlowTheme.primaryColor
                                    : FlutterFlowTheme.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(8),
                                  onTap: () => context
                                      .read<SearchBloc>()
                                      .add(AtelierChanged(true)),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 19, 0, 19),
                                    child: Text(
                                      'Студия',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        color: state.filter.atelier == true
                                            ? FlutterFlowTheme.white
                                            : FlutterFlowTheme.dark,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                      child: Text(
                        'СОСТОЯНИЕ НЕДВИЖИМОСТИ',
                        style: FlutterFlowTheme.searchPageTitle.copyWith(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: BlocBuilder<SearchBloc, SearchState>(
                        buildWhen: (previous, current) =>
                            previous.conditions != current.conditions,
                        builder: (context, state) {
                          if (state.conditions.isEmpty)
                            return placeholders.objectTypesDropDownPlaceholder;
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.transparent,
                                  width: 0,
                                ),
                                color: Colors.white,
                              ),
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButtonHideUnderline(
                                  child:
                                      DropdownButton<DictionaryMultiLangItem>(
                                    value: condDrop,
                                    items: state.conditions
                                        .map((e) => DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e.name.nameRu,
                                                style: FlutterFlowTheme
                                                    .darkNormal16,
                                              ),
                                            ))
                                        .toList(),
                                    elevation: 2,
                                    onChanged: (value) {
                                      setState(() => condDrop = value);
                                      context
                                          .read<SearchBloc>()
                                          .add(ConditionChoose(value!));
                                    },
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: FlutterFlowTheme.secondaryColor,
                                      size: 24,
                                    ),
                                    isExpanded: true,
                                    dropdownColor: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                      child: Text(
                        'ГОД ПОСТРОЙКИ',
                        style: FlutterFlowTheme.searchPageTitle.copyWith(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: RangeWidget(
                        fromController: _yearFromController,
                        toController: _yearToController,
                        maxLength: 5,
                        onChanged: (String value, bool from) => _onChanged(
                            fromC: _yearFromController,
                            toC: _yearToController,
                            value: value,
                            priceFrom: from,
                            type: _YEAR),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 12, 0, 8),
                      child: Text(
                        'ПОКАЗЫВАТЬ ТОЛЬКО',
                        style: FlutterFlowTheme.searchPageTitle.copyWith(),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: BlocBuilder<SearchBloc, SearchState>(
                          buildWhen: (p, c) =>
                              p.filter.probabilityOfBidding !=
                              c.filter.probabilityOfBidding,
                          builder: (context, state) {
                            return SwitchListTile(
                              value: state.filter.probabilityOfBidding ?? false,
                              onChanged: (newValue) => setState(() => context
                                  .read<SearchBloc>()
                                  .add(BiddingChanged())),
                              title: Text(
                                'Есть торг',
                                style: FlutterFlowTheme.darkNormal16.copyWith(),
                              ),
                              tileColor: FlutterFlowTheme.white,
                              activeColor: FlutterFlowTheme.primaryColor,
                              dense: true,
                              controlAffinity: ListTileControlAffinity.trailing,
                            );
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: BlocBuilder<SearchBloc, SearchState>(
                            buildWhen: (p, c) =>
                                p.filter.encumbrance != c.filter.encumbrance,
                            builder: (context, state) {
                              return SwitchListTile(
                                value: state.filter.encumbrance ?? false,
                                onChanged: (newValue) => setState(() => context
                                    .read<SearchBloc>()
                                    .add(EncumbranceChanged())),
                                title: Text(
                                  'Есть обременение',
                                  style:
                                      FlutterFlowTheme.darkNormal16.copyWith(),
                                ),
                                tileColor: FlutterFlowTheme.white,
                                activeColor: FlutterFlowTheme.primaryColor,
                                dense: true,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              );
                            }),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: BlocBuilder<SearchBloc, SearchState>(
                            buildWhen: (p, c) =>
                                p.filter.exchange != c.filter.exchange,
                            builder: (context, state) {
                              return SwitchListTile(
                                value: state.filter.exchange ?? false,
                                onChanged: (newValue) => setState(() => context
                                    .read<SearchBloc>()
                                    .add(ExchangeChanged())),
                                title: Text(
                                  'Обмен',
                                  style:
                                      FlutterFlowTheme.darkNormal16.copyWith(),
                                ),
                                tileColor: FlutterFlowTheme.white,
                                activeColor: FlutterFlowTheme.primaryColor,
                                dense: true,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              );
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: FFButtonWidget(
                                onPressed: () {
                                  BlocProvider.of<SearchBloc>(context)
                                      .add(SearchReset());

                                  _priceFromController.clear();
                                  _priceToController.clear();
                                  _areaFromController.clear();
                                  _areaToController.clear();
                                  _yearFromController.clear();
                                  _yearToController.clear();
                                  _complexController.clear();
                                  _streetController.clear();
                                  dropDownValue = DictionaryMultiLangItem.empty;
                                  condDrop = DictionaryMultiLangItem.emptyE;
                                  cityDrop = Address.empty;
                                  distDrop = Address.empty;
                                  streetDrop = Address.empty;
                                  complexDrop = ResidentialComplex.empty;
                                  setState(() {});
                                },
                                text: AppLocalizations.of(context)!
                                    .reset
                                    .capitalize(),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 48,
                                  color: FlutterFlowTheme.secondaryColor,
                                  textStyle:
                                      FlutterFlowTheme.btnTextWhite.copyWith(),
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 8,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: BlocBuilder<SearchBloc, SearchState>(
                                  builder: (context, state) {
                                if (state.searchStatus.isSubmissionInProgress)
                                  return Center(
                                      child: CircularProgressIndicator());
                                return FFButtonWidget(
                                  onPressed: () {
                                    print(json.encode(state.filter.toJson()));
                                    context
                                        .read<SearchBloc>()
                                        .add(SearchProperties());
                                  },
                                  text: AppLocalizations.of(context)!
                                      .search
                                      .capitalize(),
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 48,
                                    color: FlutterFlowTheme.primaryColor,
                                    textStyle: FlutterFlowTheme.btnTextWhite
                                        .copyWith(),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: 8,
                                  ),
                                );
                              }),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

class DropDownAddress extends StatefulWidget {
  const DropDownAddress({
    Key? key,
    required this.dropValue,
    required this.items,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);
  final Address? dropValue;
  final List<Address> items;
  final String hintText;
  final Function(Address a) onChanged;

  @override
  _DropDownAddressState createState() => _DropDownAddressState();
}

class _DropDownAddressState extends State<DropDownAddress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.transparent,
            width: 0,
          ),
          color: Colors.white,
        ),
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<Address>(
              hint: Text(
                widget.hintText,
                style: const TextStyle(color: const Color(0xFFADADAD)),
              ),
              value: widget.dropValue,
              items: widget.items
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e.address!.addressObject.name.nameRu,
                          style: FlutterFlowTheme.darkNormal16,
                        ),
                      ))
                  .toList(),
              elevation: 2,
              onChanged: (value) => widget.onChanged(value!),
              icon: const Icon(
                Icons.keyboard_arrow_down_outlined,
                color: FlutterFlowTheme.secondaryColor,
                size: 24,
              ),
              isExpanded: true,
              dropdownColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
