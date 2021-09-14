import 'package:flutter/material.dart';
import 'package:jurta_app/src/business_logic/filter/filter.dart';
import 'package:jurta_app/src/ui//flutter_flow/flutter_flow_theme.dart';
import 'package:jurta_app/src/ui//flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
              style: FlutterFlowTheme.filterTitle.copyWith(),
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
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: RoomButton(
                      number: 1,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: const Radius.circular(8),
                        bottomRight: const Radius.circular(0),
                        topLeft: const Radius.circular(8),
                        topRight: const Radius.circular(0),
                      ),
                    ),
                  ),
                  Expanded(child: RoomButton(number: 2)),
                  Expanded(child: RoomButton(number: 3)),
                  Expanded(child: RoomButton(number: 4)),
                  Expanded(child: MoreThan5()),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 24, 0, 0),
            child: Text(
              '${AppLocalizations.of(context)!.priceRange.toUpperCase()}, ₸',
              style: FlutterFlowTheme.filterTitle.copyWith(
                color: FlutterFlowTheme.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child: PriceRangeFrom(),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: PriceRangeTo(),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 24, 0, 0),
            child: Text(
              '${AppLocalizations.of(context)!.area.toUpperCase()}, М',
              style: FlutterFlowTheme.filterTitle.copyWith(
                color: FlutterFlowTheme.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: AreaRangeFrom()),
                ),
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: AreaRangeTo()),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 20, 8, 0),
            child: FFButtonWidget(
              onPressed: widget.onCancel,
              text: AppLocalizations.of(context)!.cancel.toUpperCase(),
              options: FFButtonOptions(
                width: 130,
                height: 48,
                color: FlutterFlowTheme.secondaryColor,
                textStyle: FlutterFlowTheme.btnTextWhite.copyWith(),
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
            padding: EdgeInsets.fromLTRB(8, 12, 8, 0),
            child: FFButtonWidget(
              onPressed: () {
                print('Show Button pressed ...');
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
