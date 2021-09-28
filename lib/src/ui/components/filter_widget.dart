import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jurta_app/src/business_logic/filter/filter.dart';
import 'package:jurta_app/src/business_logic/home/home.dart';
import 'package:jurta_app/src/data/entity/real_property_filter.dart';
import 'package:jurta_app/src/ui//flutter_flow/flutter_flow_theme.dart';
import 'package:jurta_app/src/ui//flutter_flow/flutter_flow_widgets.dart';
import 'package:jurta_app/src/ui/components/range_widget.dart';
import 'package:jurta_app/src/ui/components/room_button_widget.dart';
import 'package:jurta_app/src/utils/extensions.dart';

class FilterWidget extends StatefulWidget {
  FilterWidget({
    Key? key,
    required this.onCancel,
  }) : super(key: key);

  final VoidCallback onCancel;

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController priceFromController = TextEditingController();
  TextEditingController priceToController = TextEditingController();

  void _onChanged(/*String value, bool valFrom*/) {
    // int from = 0, to = 0;
    // if (value.isNotEmpty)
    //   valFrom
    //       ? from = int.parse(value.noWhiteSpaces())
    //       : to = int.parse(value.noWhiteSpaces());
    // if (valFrom) {
    //   if (textController2.text.isNotEmpty)
    //     to = int.parse(textController2.text.noWhiteSpaces());
    //   if (to < from)
    //     textController2.text = NumericTextFormatter()
    //         .formatEditUpdate(const TextEditingValue(),
    //         TextEditingValue(text: from.toString()))
    //         .text;
    // } else {
    //   if (textController1.text.isNotEmpty)
    //     from = int.parse(textController1.text.noWhiteSpaces());
    //   if (to < from) {
    //     if (to == 0)
    //       textController1.clear();
    //     else
    //       textController1.text = NumericTextFormatter()
    //           .formatEditUpdate(const TextEditingValue(),
    //           TextEditingValue(text: to.toString()))
    //           .text;
    //   }
    // }
    int? f, t;
    if (priceFromController.text.isNotEmpty)
      f = int.parse(priceFromController.text.noWhiteSpaces());
    if (priceToController.text.isNotEmpty)
      t = int.parse(priceToController.text.noWhiteSpaces());
    context.read<FilterBloc>().add(PriceRangeChanged(f, t));
  }

  @override
  void initState() {
    _initFields();
    super.initState();
  }

  @override
  void dispose() {
    priceFromController.dispose();
    priceToController.dispose();
    super.dispose();
  }

  _initFields(){
    RealPropertyFilter filter = BlocProvider.of<FilterBloc>(context).state.filter;
    if(filter.priceRange!=null){
      if(filter.priceRange!.from!=null)
        priceFromController.text = filter.priceRange!.from!.toString();
      if(filter.priceRange!.to!=null)
        priceToController.text = filter.priceRange!.to!.toString();
    }

  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      width: _size.width * .7,
      height: _size.height,
      color: const Color.fromRGBO(19, 30, 52, .8),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: HotWidget()),
                const SizedBox(width: 5),
                Expanded(child: NewWidget())
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 24, 0, 0),
            child: Text(
              AppLocalizations.of(context)!.propertyType.toUpperCase(),
              style: FlutterFlowTheme.filterTitle.copyWith(
                color: FlutterFlowTheme.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: ObjectTypesDropDown()),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 24, 0, 0),
            child: Text(
              AppLocalizations.of(context)!.numberOfRooms.toUpperCase(),
              style: FlutterFlowTheme.filterTitle.copyWith(
                color: FlutterFlowTheme.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: FlutterFlowTheme.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: BlocBuilder<FilterBloc, FilterState>(
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
                            onPressed: () =>
                                context.read<FilterBloc>().add(RoomsPressed(1)),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: const Radius.circular(8),
                              bottomRight: const Radius.circular(0),
                              topLeft: const Radius.circular(8),
                              topRight: const Radius.circular(0),
                            ),
                            isActive: state.filter.numberOfRooms == null
                                ? false
                                : state.filter.numberOfRooms!.contains(1)
                                    ? true
                                    : false,
                          ),
                        ),
                        Expanded(child: RoomButton(
                          text: '2',
                          onPressed: () =>
                              context.read<FilterBloc>().add(RoomsPressed(2)),
                          isActive: state.filter.numberOfRooms == null
                              ? false
                              : state.filter.numberOfRooms!.contains(2)
                              ? true
                              : false,
                        ),),
                        Expanded(child: RoomButton(
                            text: '3',
                            onPressed: () =>
                                context.read<FilterBloc>().add(RoomsPressed(3)),
                            isActive: state.filter.numberOfRooms == null
                                ? false
                                : state.filter.numberOfRooms!.contains(3)
                                    ? true
                                    : false,
                          ),),
                        Expanded(child: RoomButton(
                            text: '4',
                            onPressed: () =>
                                context.read<FilterBloc>().add(RoomsPressed(4)),
                            isActive: state.filter.numberOfRooms == null
                                ? false
                                : state.filter.numberOfRooms!.contains(4)
                                    ? true
                                    : false,
                          ),),
                        Expanded(child: RoomButton(
                          text: '5+',
                          onPressed: () =>
                              context.read<FilterBloc>().add(MoreThan5Pressed()),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: const Radius.circular(0),
                            bottomRight: const Radius.circular(8),
                            topLeft: const Radius.circular(0),
                            topRight: const Radius.circular(8),
                          ),
                          isActive: state.filter.moreThanFiveRooms,
                        ),),
                      ],
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 24, 0, 0),
            child: Text(
              '${AppLocalizations.of(context)!.priceRange.toUpperCase()}, \u{3012}',
              style: FlutterFlowTheme.filterTitle.copyWith(
                color: FlutterFlowTheme.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: RangeWidget2(
                fromController: priceFromController,
                toController: priceToController,
                onChanged: (String value, /*bool from*/) => _onChanged(/*value, from*/),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 24, 0, 0),
            child: Text(
              '${AppLocalizations.of(context)!.area.toUpperCase()}, м²',
              style: FlutterFlowTheme.filterTitle.copyWith(
                color: FlutterFlowTheme.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: AreaWidget(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 20, 8, 0),
            child: FFButtonWidget(
              onPressed: () => Navigator.pop(context),
              text: AppLocalizations.of(context)!.cancel.toUpperCase(),
              options: FFButtonOptions(
                width: 130,
                height: 48,
                color: Colors.white,
                textStyle: FlutterFlowTheme.btnTextWhite.copyWith(
                  color: const Color(0xFF131E34)
                ),
                elevation: 0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 8,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
            child: FFButtonWidget(
              onPressed: () {
                BlocProvider.of<HomeBloc>(context).add(LoadProperties());
                Navigator.pop(context);
                /*widget.onCancel();*/
              },
              text: AppLocalizations.of(context)!.show.toUpperCase(),
              options: FFButtonOptions(
                width: 130,
                height: 48,
                color: FlutterFlowTheme.primaryColor,
                textStyle: FlutterFlowTheme.btnTextWhite.copyWith(),
                elevation: 0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 8,
              ),
            ),
          )
        ],
      ),
    );
  }
}
