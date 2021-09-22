import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
<<<<<<< HEAD
import 'package:jurta_app/src/business_logic/search/search.dart';
import 'package:jurta_app/src/data/entity/search_filter.dart';
import 'package:jurta_app/src/ui/components/range_widget.dart';
import 'package:jurta_app/src/ui/object_info_page/object_info_page_widget_sample.dart';
import 'package:jurta_app/src/utils/custom_input_formatter.dart';
import 'package:jurta_app/src/utils/extensions.dart';
=======
import 'package:jurta_app/src/business_logic/hots/bloc/hots_bloc.dart';
import 'package:jurta_app/src/business_logic/search_mini/search_mini.dart';
import 'package:jurta_app/src/data/entity/search_filter.dart';
import 'package:jurta_app/src/ui/components/range_widget.dart';
import 'package:jurta_app/src/ui/components/room_button_widget.dart';
import 'package:jurta_app/src/ui/components/small_info_box_widget_sample.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_drop_down_object_types.dart';
import 'package:jurta_app/src/ui/object_info_page/object_info_page_widget_sample.dart';
import 'package:jurta_app/src/utils/custom_input_formatter.dart';
import 'package:jurta_app/src/utils/extensions.dart';
import 'package:jurta_app/src/utils/my_logger.dart';
import 'package:jurta_app/src/utils/placeholders.dart' as placeholders;
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94

import '../advance_search_page/advance_search_page_widget.dart';
import '../components/small_info_box_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../search_result_page/search_result_page_widget.dart';

class SearchPageWidget extends StatefulWidget {
  SearchPageWidget({Key? key}) : super(key: key);

  @override
  _SearchPageWidgetState createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
<<<<<<< HEAD
=======
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchMiniBloc, SearchMiniState>(
      listenWhen: (p, c) => p.searchStatus != c.searchStatus,
      listener: (context, state) async {
        if (state.searchStatus.isSubmissionSuccess) {
          await Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              duration: Duration(milliseconds: 300),
              reverseDuration: Duration(milliseconds: 300),
              child: SearchResultPageWidget(
                isSearchMini: true,
              ),
            ),
          );
        }
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.tertiaryColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Header(),
              SearchWidget(),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 20, 0, 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 25,
                      child: Center(
                        child: Text(
                          'ГОРЯЩИЕ',
                          style: FlutterFlowTheme.titleTextWDark,
                        ),
                      ),
                    ),
                    BlocBuilder<HotsBloc, HotsState>(
                      buildWhen: (p,c) => p.pagination!=c.pagination,
                      builder: (context, state) {
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xFFFD9733),
                          ),
                          child: Center(
                            child: Text(state.pagination?.total.toString() ?? '',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),),
                          ),
                        );
                      }
                    )
                  ],
                )
              ),
              HotWidget(),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 12, 0, 8),
                child: Text(
                  'НОВЫЕ',
                  style: FlutterFlowTheme.titleTextWDark,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [SmallInfoBoxWidgetSample()],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
  TextEditingController priceFromController = TextEditingController();
  TextEditingController priceToController = TextEditingController();
  TextEditingController areaFromController = TextEditingController();
  TextEditingController areaToController = TextEditingController();
<<<<<<< HEAD
  final scaffoldKey = GlobalKey<ScaffoldState>();
=======
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94

  @override
  void initState() {
    _setFields();
    super.initState();
  }

  _setFields() {
<<<<<<< HEAD
    SearchFilter filter = BlocProvider.of<SearchBloc>(context).state.filter;
=======
    SearchFilter filter = BlocProvider.of<SearchMiniBloc>(context).state.filter;
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
    if (filter.priceRange != null) {
      if (filter.priceRange!.from != null)
        priceFromController.text = filter.priceRange!.from.toString();
      if (filter.priceRange!.to != null)
        priceToController.text = filter.priceRange!.to.toString();
    }
    if (filter.areaRange != null) {
      if (filter.areaRange!.from != null)
        priceFromController.text = filter.areaRange!.from.toString();
      if (filter.areaRange!.to != null)
        priceToController.text = filter.areaRange!.to.toString();
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
<<<<<<< HEAD
    context.read<SearchBloc>().add(
        price ? SearchPriceRangeChanged(f, t) : SearchAreaRangeChanged(f, t));
=======
    context.read<SearchMiniBloc>().add(price
        ? SearchMiniPriceRangeChanged(f, t)
        : SearchMiniAreaRangeChanged(f, t));
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
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
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 300),
                            reverseDuration: Duration(milliseconds: 300),
                            child: AdvanceSearchPageWidget(),
                          ),
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!
                            .advanced_search
                            .toUpperCase(),
                        style: FlutterFlowTheme.titleTextWDark,
                      ),
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
            Padding(
              padding: EdgeInsets.fromLTRB(8, 12, 0, 8),
              child: Text(
                'ГОРЯЩИЕ',
                style: FlutterFlowTheme.titleTextWDark,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
                          child: ObjectInfoPageWidgetSample(),
                        ),
                      );
                    },
                    child: SmallInfoBoxWidget(),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 12, 0, 8),
              child: Text(
                'НОВЫЕ',
                style: FlutterFlowTheme.titleTextWDark,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [SmallInfoBoxWidget()],
                ),
              ),
            )
          ],
        ),
=======
    return Padding(
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
          BlocBuilder<SearchMiniBloc, SearchMiniState>(
            buildWhen: (previous, current) =>
                previous.objectTypes != current.objectTypes,
            builder: (context, state) {
              if (state.objectTypes.isEmpty)
                return placeholders.objectTypesDropDownPlaceholder;
              return FlutterFlowDropDownObjectTypes(
                options: state.objectTypes,
                onChanged: (value) {
                  setState(() {});
                  context
                      .read<SearchMiniBloc>()
                      .add(SearchMiniObjectTypeChoose(value));
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 8),
            child: Text(
              AppLocalizations.of(context)!.numberOfRooms.toUpperCase(),
              style: FlutterFlowTheme.titleTextWDark,
            ),
          ),
          Card(
            margin: const EdgeInsets.all(0),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: FlutterFlowTheme.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: BlocBuilder<SearchMiniBloc, SearchMiniState>(
                buildWhen: (previous, current) =>
                    previous.filter.numberOfRooms !=
                        current.filter.numberOfRooms ||
                    previous.filter.moreThanFiveRooms !=
                        current.filter.moreThanFiveRooms,
                builder: (context, state) {
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: RoomButton(
                          text: '1',
                          onPressed: () => context
                              .read<SearchMiniBloc>()
                              .add(SearchMiniRoomsPressed(1)),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: const Radius.circular(8),
                            bottomRight: const Radius.circular(0),
                            topLeft: const Radius.circular(8),
                            topRight: const Radius.circular(0),
                          ),
                          isActive: state.filter.numberOfRooms.contains(1)
                              ? true
                              : false,
                        ),
                      ),
                      Expanded(
                        child: RoomButton(
                          text: '2',
                          onPressed: () => context
                              .read<SearchMiniBloc>()
                              .add(SearchMiniRoomsPressed(2)),
                          isActive: state.filter.numberOfRooms.contains(2)
                              ? true
                              : false,
                        ),
                      ),
                      Expanded(
                        child: RoomButton(
                          text: '3',
                          onPressed: () => context
                              .read<SearchMiniBloc>()
                              .add(SearchMiniRoomsPressed(3)),
                          isActive: state.filter.numberOfRooms.contains(3)
                              ? true
                              : false,
                        ),
                      ),
                      Expanded(
                        child: RoomButton(
                          text: '4',
                          onPressed: () => context
                              .read<SearchMiniBloc>()
                              .add(SearchMiniRoomsPressed(4)),
                          isActive: state.filter.numberOfRooms.contains(4)
                              ? true
                              : false,
                        ),
                      ),
                      Expanded(
                        child: RoomButton(
                          text: '5+',
                          onPressed: () => context
                              .read<SearchMiniBloc>()
                              .add(SearchMiniMoreThan5Pressed()),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: const Radius.circular(0),
                            bottomRight: const Radius.circular(8),
                            topLeft: const Radius.circular(0),
                            topRight: const Radius.circular(8),
                          ),
                          isActive: state.filter.moreThanFiveRooms,
                        ),
                      ),
                    ],
                  );
                }),
          ),
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
                  price: true),
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
                  price: false),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 300),
                    reverseDuration: Duration(milliseconds: 300),
                    child: AdvanceSearchPageWidget(),
                  ),
                );
              },
              child: Text(
                AppLocalizations.of(context)!.advanced_search.toUpperCase(),
                style: FlutterFlowTheme.titleTextWDark,
              ),
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
                        BlocProvider.of<SearchMiniBloc>(context)
                            .add(SearchMiniReset());
                        priceFromController.clear();
                        priceToController.clear();
                        areaFromController.clear();
                        areaToController.clear();
                      },
                      text: AppLocalizations.of(context)!.reset.capitalize(),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48,
                        color: FlutterFlowTheme.secondaryColor,
                        textStyle: FlutterFlowTheme.btnTextWhite.copyWith(),
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
                      text: AppLocalizations.of(context)!.save.capitalize(),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48,
                        color: FlutterFlowTheme.primaryColor,
                        textStyle: FlutterFlowTheme.btnTextWhite.copyWith(),
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
            child: BlocBuilder<SearchMiniBloc, SearchMiniState>(
                builder: (context, state) {
              if (state.searchStatus.isSubmissionInProgress)
                return Center(child: CircularProgressIndicator());
              return FFButtonWidget(
                onPressed: () =>
                    context.read<SearchMiniBloc>().add(SearchMiniProperties()),
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
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
      ),
    );
  }
}
<<<<<<< HEAD
=======

class HotWidget extends StatelessWidget {
  const HotWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotsBloc, HotsState>(
      buildWhen: (p, c) => p.status != c.status,
      builder: (context, state) {
        return Container(
          width: 170,
          height: 380,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.status.isSubmissionInProgress
                  ? state.properties.length + 1
                  : state.properties.length,
              itemBuilder: (context, index) {
                if (index == state.properties.length && state.status.isSubmissionInProgress)
                  return placeholders.gridShimmer;
                if (index == state.properties.length - 3)
                  context.read<HotsBloc>().add(LoadHotsMore());
                return InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        duration: Duration(milliseconds: 300),
                        reverseDuration: Duration(milliseconds: 300),
                        child: ObjectInfoPageWidgetSample(),
                      ),
                    );
                  },
                  child: SmallInfoBoxWidget(property: state.properties[index]),
                );
              }),
        );
      },
    );
  }
}
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
