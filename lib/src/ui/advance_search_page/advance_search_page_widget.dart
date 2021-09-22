import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jurta_app/src/business_logic/search/search.dart';
import 'package:jurta_app/src/data/entity/search_filter.dart';
import 'package:jurta_app/src/ui/advance_search_page/drop_down.dart';
import 'package:jurta_app/src/ui/components/range_widget.dart';
import 'package:jurta_app/src/utils/custom_input_formatter.dart';

import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import '../search_result_page/search_result_page_widget.dart';
import 'package:formz/formz.dart';
import 'package:jurta_app/src/utils/placeholders.dart' as placeholders;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:jurta_app/src/utils/extensions.dart';

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
  TextEditingController textController5 = TextEditingController();
  TextEditingController textController6 = TextEditingController();
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
    required bool price,
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
    context.read<SearchBloc>().add(
        price ? SearchPriceRangeChanged(f, t) : SearchAreaRangeChanged(f, t));
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
                    child:RangeWidget(
                      fromController: priceFromController,
                      toController: priceToController,
                      onChanged: (String value, bool from) => _onChanged(
                          fromC: priceFromController,
                          toC: priceToController,
                          value: value,
                          priceFrom: from,
                          price: true),
                    ), ),
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
                          price: false),
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
                          onChanged: (val) {
                            setState(() {});
                            //choose
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                            child: TextFormField(
                              controller: textController6,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'Улица',
                                hintStyle:
                                    FlutterFlowTheme.hintStyle.copyWith(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.white,
                              ),
                              style: TextStyle(
                                color: FlutterFlowTheme.secondaryColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                            child: TextFormField(
                              controller: textController7,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'Жилой комплекс',
                                hintStyle:
                                    FlutterFlowTheme.hintStyle.copyWith(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.white,
                              ),
                              style: TextStyle(
                                color: FlutterFlowTheme.secondaryColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )
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
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.primaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 17, 0, 17),
                              child: Text(
                                'Любая',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: FlutterFlowTheme.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: Text(
                                'Изолированные\nкомнаты',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  color: FlutterFlowTheme.dark,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 19, 0, 19),
                              child: Text(
                                'Студия',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  color: FlutterFlowTheme.dark,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        )
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
                    child: FlutterFlowDropDown(
                      options: ['Дизайнерский ремонт'].toList(),
                      onChanged: (value) {
                        setState(() => dropDownValue2 = value);
                      },
                      width: 130,
                      height: 48,
                      textStyle: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 16,
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        size: 15,
                      ),
                      fillColor: Colors.white,
                      elevation: 1,
                      borderColor: FlutterFlowTheme.tertiaryColor,
                      borderWidth: 1,
                      borderRadius: 8,
                      margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                      hidesUnderline: true,
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
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                            child: TextFormField(
                              controller: textController8,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'от',
                                hintStyle:
                                    FlutterFlowTheme.hintStyle.copyWith(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.white,
                              ),
                              style: TextStyle(
                                color: FlutterFlowTheme.secondaryColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                            child: TextFormField(
                              controller: textController9,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'до',
                                hintStyle:
                                    FlutterFlowTheme.hintStyle.copyWith(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.white,
                              ),
                              style: TextStyle(
                                color: FlutterFlowTheme.secondaryColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )
                      ],
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
                    child: SwitchListTile(
                      value: switchListTileValue1 ??= true,
                      onChanged: (newValue) =>
                          setState(() => switchListTileValue1 = newValue),
                      title: Text(
                        'Есть торг',
                        style: FlutterFlowTheme.darkNormal16.copyWith(),
                      ),
                      tileColor: FlutterFlowTheme.white,
                      activeColor: FlutterFlowTheme.primaryColor,
                      dense: true,
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SwitchListTile(
                        value: switchListTileValue2 ??= true,
                        onChanged: (newValue) =>
                            setState(() => switchListTileValue2 = newValue),
                        title: Text(
                          'Есть обременение',
                          style: FlutterFlowTheme.darkNormal16.copyWith(),
                        ),
                        tileColor: FlutterFlowTheme.white,
                        activeColor: FlutterFlowTheme.primaryColor,
                        dense: true,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SwitchListTile(
                        value: switchListTileValue3 ??= true,
                        onChanged: (newValue) =>
                            setState(() => switchListTileValue3 = newValue),
                        title: Text(
                          'Обмен',
                          style: FlutterFlowTheme.darkNormal16.copyWith(),
                        ),
                        tileColor: FlutterFlowTheme.white,
                        activeColor: FlutterFlowTheme.primaryColor,
                        dense: true,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 12, 0, 50),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: HomePageWidget(),
                                  ),
                                );
                              },
                              text: 'Сбросить',
                              options: FFButtonOptions(
                                width: 130,
                                height: 48,
                                color: FlutterFlowTheme.secondaryColor,
                                textStyle:
                                    FlutterFlowTheme.btnTextWhite.copyWith(
                                  color: Colors.white,
                                ),
                                borderSide: BorderSide(
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
                            padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: SearchResultPageWidget(),
                                  ),
                                );
                              },
                              text: 'ПОИСК',
                              options: FFButtonOptions(
                                width: 130,
                                height: 48,
                                color: FlutterFlowTheme.primaryColor,
                                textStyle:
                                    FlutterFlowTheme.btnTextWhite.copyWith(
                                  color: Colors.white,
                                ),
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
