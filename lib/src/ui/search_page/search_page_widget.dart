import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:jurta_app/src/business_logic/hots/bloc/hots_bloc.dart';
import 'package:jurta_app/src/business_logic/news/news.dart';
import 'package:jurta_app/src/business_logic/search_mini/search_mini.dart';
import 'package:jurta_app/src/data/entity/search_filter.dart';
import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';
import 'package:jurta_app/src/ui/components/range_widget.dart';
import 'package:jurta_app/src/ui/components/room_button_widget.dart';
import 'package:jurta_app/src/ui/object_info_page/object_info_page_widget.dart';
import 'package:jurta_app/src/utils/extensions.dart';
import 'package:jurta_app/src/utils/placeholders.dart' as placeholders;

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
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.tertiaryColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /*Header(),*/
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
                          buildWhen: (p, c) => p.pagination != c.pagination,
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
                                child: Text(
                                  state.pagination?.total.toString() ?? '',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          })
                    ],
                  )),
              HotWidget(),
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
                            'НОВЫЕ',
                            style: FlutterFlowTheme.titleTextWDark,
                          ),
                        ),
                      ),
                      BlocBuilder<NewsBloc, NewsState>(
                          buildWhen: (p, c) => p.pagination != c.pagination,
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
                                child: Text(
                                  state.pagination?.total.toString() ?? '',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          })
                    ],
                  )),
              NewsWidget(),
              const SizedBox(height: 20),
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
  TextEditingController priceFromController = TextEditingController();
  TextEditingController priceToController = TextEditingController();
  TextEditingController areaFromController = TextEditingController();
  TextEditingController areaToController = TextEditingController();

  DictionaryMultiLangItem? dropDownValue;

  @override
  void initState() {
    _setFields();
    super.initState();
  }

  _setFields() {
    SearchFilter filter = BlocProvider.of<SearchMiniBloc>(context).state.filter;
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

    if (filter.objectType != null) dropDownValue = filter.objectType;
    else dropDownValue = DictionaryMultiLangItem.empty;
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
    // int from = 0, to = 0;
    // if (value.isNotEmpty)
    //   priceFrom
    //       ? from = int.parse(value.replaceAll(' ', ''))
    //       : to = int.parse(value.replaceAll(' ', ''));
    // if (priceFrom) {
    //   if (toC.text.isNotEmpty) to = int.parse(toC.text.replaceAll(' ', ''));
    //   if (to < from)
    //     toC.text = NumericTextFormatter()
    //         .formatEditUpdate(const TextEditingValue(),
    //             TextEditingValue(text: from.toString()))
    //         .text;
    // } else {
    //   if (fromC.text.isNotEmpty)
    //     from = int.parse(fromC.text.replaceAll(' ', ''));
    //   if (to < from) {
    //     if (to == 0)
    //       fromC.clear();
    //     else
    //       fromC.text = NumericTextFormatter()
    //           .formatEditUpdate(const TextEditingValue(),
    //               TextEditingValue(text: to.toString()))
    //           .text;
    //   }
    // }
    int? f, t;
    if (fromC.text.isNotEmpty) f = int.parse(fromC.text.noWhiteSpaces());
    if (toC.text.isNotEmpty) t = int.parse(toC.text.noWhiteSpaces());
    context.read<SearchMiniBloc>().add(price
        ? SearchMiniPriceRangeChanged(f, t)
        : SearchMiniAreaRangeChanged(f, t));
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!.localeName;
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
                previous.objectTypes != current.objectTypes ||
                previous.filter.objectType != current.filter.objectType,
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
                                  child: Text( e.name.nameRu,
                                    style: FlutterFlowTheme.darkNormal16,
                                  ),
                                ))
                            .toList(),
                        elevation: 2,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() => dropDownValue = value);
                            context
                                .read<SearchMiniBloc>()
                                .add(SearchMiniObjectTypeChoose(value));
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
                        // print('${BlocProvider.of<SearchMiniBloc>(context).state.filter.objectType}');
                        BlocProvider.of<SearchMiniBloc>(context)
                            .add(SearchMiniReset());
                        priceFromController.clear();
                        priceToController.clear();
                        areaFromController.clear();
                        areaToController.clear();
                        setState(() {
                          dropDownValue = DictionaryMultiLangItem.empty;
                        });
                      },
                      text: AppLocalizations.of(context)!.reset.capitalize(),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48,
                        color: FlutterFlowTheme.secondaryColor,
                        textStyle: FlutterFlowTheme.btnTextWhite,
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
                    child: BlocBuilder<SearchMiniBloc, SearchMiniState>(
                        builder: (context, state) {
                      if (state.searchStatus.isSubmissionInProgress)
                        return Center(child: CircularProgressIndicator());
                      return FFButtonWidget(
                        onPressed: () => context
                            .read<SearchMiniBloc>()
                            .add(SearchMiniProperties()),
                        text: AppLocalizations.of(context)!.search.capitalize(),
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
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HotWidget extends StatelessWidget {
  const HotWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotsBloc, HotsState>(
      buildWhen: (p, c) => p.status != c.status,
      builder: (context, state) {
        return Container(
          width: 170,
          height: 310,
          child: state.firstLoad
              ? Row(
                  children: [
                    placeholders.gridItemShimmer,
                    placeholders.gridItemShimmer,
                  ],
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.status.isSubmissionInProgress
                      ? state.properties.length + 1
                      : state.properties.length,
                  itemBuilder: (context, index) {
                    if (index == state.properties.length &&
                        state.status.isSubmissionInProgress)
                      return placeholders.gridItemShimmer;
                    if (index == state.properties.length - 4)
                      context.read<HotsBloc>().add(LoadHotsMore());
                    return InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 300),
                            reverseDuration: Duration(milliseconds: 300),
                            child: ObjectInfoPageWidget(
                              property: state.properties[index],
                            ),
                          ),
                        );
                      },
                      child:
                          SmallInfoBoxWidget(property: state.properties[index]),
                    );
                  }),
        );
      },
    );
  }
}

class NewsWidget extends StatelessWidget {
  const NewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      buildWhen: (p, c) => p.status != c.status,
      builder: (context, state) {
        return Container(
          width: 170,
          height: 325,
          child: state.firstLoad
              ? Row(
                  children: [
                    placeholders.gridItemShimmer,
                    placeholders.gridItemShimmer,
                  ],
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.status.isSubmissionInProgress
                      ? state.properties.length + 1
                      : state.properties.length,
                  itemBuilder: (context, index) {
                    if (index == state.properties.length &&
                        state.status.isSubmissionInProgress)
                      return placeholders.gridItemShimmer;
                    if (index == state.properties.length - 3)
                      context.read<NewsBloc>().add(LoadNewsMore());
                    return InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 300),
                            reverseDuration: Duration(milliseconds: 300),
                            child: ObjectInfoPageWidget(
                              property: state.properties[index],
                            ),
                          ),
                        );
                      },
                      child:
                          SmallInfoBoxWidget(property: state.properties[index]),
                    );
                  }),
        );
      },
    );
  }
}
