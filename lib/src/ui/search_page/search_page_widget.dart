import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:jurta_app/src/business_logic/search/search.dart';
import 'package:jurta_app/src/data/entity/search_filter.dart';
import 'package:jurta_app/src/ui/components/range_widget.dart';
import 'package:jurta_app/src/ui/object_info_page/object_info_page_widget_sample.dart';
import 'package:jurta_app/src/utils/custom_input_formatter.dart';
import 'package:jurta_app/src/utils/extensions.dart';

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
  TextEditingController priceFromController = TextEditingController();
  TextEditingController priceToController = TextEditingController();
  TextEditingController areaFromController = TextEditingController();
  TextEditingController areaToController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
      ),
    );
  }
}
