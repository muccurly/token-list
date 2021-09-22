import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jurta_app/src/business_logic/search/search.dart';
import 'package:jurta_app/src/data/entity/search_filter.dart';
import 'package:jurta_app/src/ui/advance_search_page/drop_down.dart';
import 'package:jurta_app/src/ui/advance_search_page/drop_down_complex.dart';
import 'package:jurta_app/src/ui/components/range_widget.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_drop_down_object_types.dart';
import 'package:jurta_app/src/utils/custom_input_formatter.dart';
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
  String? dropDownValue1;
  TextEditingController priceFromController = TextEditingController();
  TextEditingController priceToController = TextEditingController();
  TextEditingController areaFromController = TextEditingController();
  TextEditingController areaToController = TextEditingController();
  TextEditingController yearFromController = TextEditingController();
  TextEditingController yearToController = TextEditingController();
  TextEditingController textController7 = TextEditingController();
  String? dropDownValue2;
  TextEditingController textController8 = TextEditingController();
  TextEditingController textController9 = TextEditingController();
  bool? switchListTileValue1;
  bool? switchListTileValue2;
  bool? switchListTileValue3;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int room_1 = 1;
  int room_2 = 1;
  int room_3 = 1;
  int room_4 = 1;
  int roomMore5 = 1;

  int any = 1;
  int studio = 1;
  int isolatedRooms = 1;

  static const _PRICE = 'price';
  static const _AREA = 'area';
  static const _YEAR = 'year';

  @override
  void initState() {
    _setFields();
    super.initState();
  }

  _setFields() {
    SearchFilter filter = BlocProvider.of<SearchBloc>(context).state.filter;
    if (filter.priceRange != null) {
      if (filter.priceRange!.from != null)
        priceFromController.text = filter.priceRange!.from.toString();
      if (filter.priceRange!.to != null)
        priceToController.text = filter.priceRange!.to.toString();
    }
    if (filter.areaRange != null) {
      if (filter.areaRange!.from != null)
        areaFromController.text = filter.areaRange!.from.toString();
      if (filter.areaRange!.to != null)
        areaToController.text = filter.areaRange!.to.toString();
    }
  }

  @override
  void dispose() {
    priceFromController.dispose();
    priceToController.dispose();
    areaFromController.dispose();
    areaToController.dispose();
    super.dispose();
  }

  void _onChanged({
    required TextEditingController fromC,
    required TextEditingController toC,
    required String value,
    required bool priceFrom,
    required String type,
  }) {
    int from = 0, to = 0;
    if (value.isNotEmpty)
      priceFrom
          ? from = int.parse(value.replaceAll(' ', ''))
          : to = int.parse(value.replaceAll(' ', ''));
    if (priceFrom) {
      if (toC.text.isNotEmpty) to = int.parse(toC.text.replaceAll(' ', ''));
      if (to < from)
        toC.text = NumericTextFormatter()
            .formatEditUpdate(const TextEditingValue(),
                TextEditingValue(text: from.toString()))
            .text;
    } else {
      if (fromC.text.isNotEmpty)
        from = int.parse(fromC.text.replaceAll(' ', ''));
      if (to < from) {
        if (to == 0)
          fromC.clear();
        else
          fromC.text = NumericTextFormatter()
              .formatEditUpdate(const TextEditingValue(),
                  TextEditingValue(text: to.toString()))
              .text;
      }
    }
    int? f, t;
    if (fromC.text.isNotEmpty) f = int.parse(fromC.text.replaceAll(' ', ''));
    if (toC.text.isNotEmpty) t = int.parse(toC.text.replaceAll(' ', ''));
    switch (type) {
      case _PRICE:
        {
          context.read<SearchBloc>().add(SearchPriceRangeChanged(f, t));
          break;
        }
      case _AREA:
        {
          context.read<SearchBloc>().add(SearchAreaRangeChanged(f, t));
          break;
        }
      case _YEAR:
        {
          context.read<SearchBloc>().add(YearsRangeChanged(f, t));
          break;
        }
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.tertiaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 50, 0, 0),
                child: InkWell(
                  onTap: () async => Navigator.pop(context),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.black,
                        size: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                        child: Text(
                          AppLocalizations.of(context)!.back.capitalize(),
                          style: FlutterFlowTheme.subtitleTextDark.copyWith(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12, 0, 8),
                    child: Text(
                      AppLocalizations.of(context)!.propertyType.toUpperCase(),
                      style: FlutterFlowTheme.titleTextWDark,
                    ),
                  ),
                  SearchObjTypesDropDown(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12, 0, 8),
                    child: Text(
                      AppLocalizations.of(context)!.numberOfRooms.toUpperCase(),
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
                      fromController: priceFromController,
                      toController: priceToController,
                      onChanged: (String value, bool from) => _onChanged(
                          fromC: priceFromController,
                          toC: priceToController,
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
                      fromController: areaFromController,
                      toController: areaToController,
                      onChanged: (String value, bool from) => _onChanged(
                          fromC: areaFromController,
                          toC: areaToController,
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
                        return FlutterFlowDropDownAddress(
                          options: state.cities,
                          hintText: 'Город',
                          onChanged: (val) {
                            setState(() {});
                            context.read<SearchBloc>().add(
                                CityChanged(val.address.addressObject.code));
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
                        return FlutterFlowDropDownAddress(
                          options: state.districts,
                          hintText: 'Район',
                          onChanged: (val) {
                            setState(() {});
                            context.read<SearchBloc>().add(DistrictChanged(
                                val.address.addressObject.code));
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
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: BlocBuilder<SearchBloc, SearchState>(
                              buildWhen: (previous, current) =>
                                  previous.streets != current.streets ||
                                  previous.streetsStatus !=
                                      current.streetsStatus,
                              builder: (context, state) {
                                if (state.streetsStatus.isSubmissionInProgress)
                                  return placeholders
                                      .objectTypesDropDownPlaceholder;
                                return FlutterFlowDropDownAddress(
                                  width: double.infinity,
                                  hintText: 'Улица',
                                  options: state.streets,
                                  onChanged: (val) {
                                    setState(() {});
                                    context.read<SearchBloc>().add(
                                        StreetChanged(
                                            val.address.addressObject.code));
                                  },
                                );
                              },
                            ),
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
                                if (state.complexStatus.isSubmissionInProgress)
                                  return placeholders
                                      .objectTypesDropDownPlaceholder;
                                return FlutterFlowDropDownComplex(
                                  width: double.infinity,
                                  options: state.complexes,
                                  onChanged: (val) {
                                    setState(() {});
                                    //choose
                                  },
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
                        return FlutterFlowDropDownObjectTypes(
                          options: state.conditions,
                          onChanged: (value) {
                            setState(() {});
                            context
                                .read<SearchBloc>()
                                .add(ConditionChoose(value));
                          },
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
                      fromController: yearFromController,
                      toController: yearToController,
                      maxLength: 5,
                      onChanged: (String value, bool from) => _onChanged(
                          fromC: yearFromController,
                          toC: yearToController,
                          value: value,
                          priceFrom: from,
                          type: _YEAR),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
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
                                style: FlutterFlowTheme.darkNormal16.copyWith(),
                              ),
                              tileColor: FlutterFlowTheme.white,
                              activeColor: FlutterFlowTheme.primaryColor,
                              dense: true,
                              controlAffinity: ListTileControlAffinity.trailing,
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
                                style: FlutterFlowTheme.darkNormal16.copyWith(),
                              ),
                              tileColor: FlutterFlowTheme.white,
                              activeColor: FlutterFlowTheme.primaryColor,
                              dense: true,
                              controlAffinity: ListTileControlAffinity.trailing,
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
                                priceFromController.clear();
                                priceToController.clear();
                                areaFromController.clear();
                                areaToController.clear();
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
                            child: FFButtonWidget(
                              onPressed: () async {
                                print('????? clicked');
                              },
                              text: AppLocalizations.of(context)!
                                  .save
                                  .capitalize(),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 48,
                                color: FlutterFlowTheme.primaryColor,
                                textStyle:
                                    FlutterFlowTheme.btnTextWhite.copyWith(),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 8,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: BlocBuilder<SearchBloc, SearchState>(
                        builder: (context, state) {
                      if (state.searchStatus.isSubmissionInProgress)
                        return Center(child: CircularProgressIndicator());
                      return FFButtonWidget(
                        onPressed: () =>
                            context.read<SearchBloc>().add(SearchProperties()),
                        text: AppLocalizations.of(context)!.search.capitalize(),
                        options: FFButtonOptions(
                          width: 170,
                          height: 48,
                          color: FlutterFlowTheme.primaryColor,
                          textStyle: FlutterFlowTheme.btnTextWhite.copyWith(),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 8,
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
