import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jurta_app/src/business_logic/filter/bloc/filter_bloc.dart';
import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_drop_down_object_types.dart';
import 'package:jurta_app/src/ui//flutter_flow/flutter_flow_theme.dart';
import 'package:jurta_app/src/ui//flutter_flow/flutter_flow_widgets.dart';
import 'package:jurta_app/src/utils/placeholders.dart' as placeholders;

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
  TextEditingController textController2 = TextEditingController();
  TextEditingController textController3 = TextEditingController();
  TextEditingController textController4 = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int any = 1;
  int studio = 1;
  int isolatedRooms = 1;

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
              'ТИП НЕДВИЖИМОСТИ',
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
              'ТИП НЕДВИЖИМОСТИ',
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
                  Expanded(
                    child: RoomButton(
                      number: 5,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(8),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 24, 0, 0),
            child: Text(
              'ДИАПАЗОН ЦЕН, ₸',
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
              'ПЛОЩАДЬ, М',
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
              text: 'ОТМЕНА',
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
                print('Button pressed ...');
              },
              text: 'ПОКАЗАТЬ',
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

class HotWidget extends StatelessWidget {
  const HotWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      buildWhen: (previous, current) =>
          previous.filter.flagId != current.filter.flagId,
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              const Radius.circular(10),
            ),
          ),
          child: SwitchListTile(
            value: state.filter.flagId == null ? false : true,
            onChanged: (newValue) =>
                context.read<FilterBloc>().add(HotPressed(newValue)),
            title: Text(
              'Горящие',
              style: FlutterFlowTheme.dark50016.copyWith(),
            ),
            tileColor: FlutterFlowTheme.white,
            activeColor: FlutterFlowTheme.primaryColor,
            dense: true,
            controlAffinity: ListTileControlAffinity.trailing,
          ),
        );
      },
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      buildWhen: (previous, current) =>
          previous.filter.showNew != current.filter.showNew,
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              const Radius.circular(10),
            ),
          ),
          child: SwitchListTile(
            value: state.filter.showNew,
            onChanged: (newValue) =>
                context.read<FilterBloc>().add(NewPressed(newValue)),
            title: Text(
              'Новые',
              style: FlutterFlowTheme.dark50016.copyWith(),
            ),
            tileColor: FlutterFlowTheme.white,
            activeColor: FlutterFlowTheme.primaryColor,
            dense: true,
            controlAffinity: ListTileControlAffinity.trailing,
          ),
        );
      },
    );
  }
}

class ObjectTypesDropDown extends StatefulWidget {
  const ObjectTypesDropDown({Key? key}) : super(key: key);

  @override
  _ObjectTypesDropDownState createState() => _ObjectTypesDropDownState();
}

class _ObjectTypesDropDownState extends State<ObjectTypesDropDown> {
  DictionaryMultiLangItem? dropDownValue;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return BlocBuilder<FilterBloc, FilterState>(builder: (context, state) {
      if (state.objectTypes == null) {
        return placeholders.objectTypesDropDownPlaceholder;
      }
      return FlutterFlowDropDownObjectTypes(
        options: state.objectTypes!,
        onChanged: (value) => setState(() => dropDownValue = value),
        width: _size.width,
        height: 40,
        textStyle: FlutterFlowTheme.darkNormal16.copyWith(),
        icon: Icon(
          Icons.keyboard_arrow_down_outlined,
          color: FlutterFlowTheme.secondaryColor,
          size: 24,
        ),
        fillColor: Colors.white,
        elevation: 2,
        borderColor: Colors.transparent,
        borderWidth: 0,
        borderRadius: 0,
        margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
        hidesUnderline: true,
      );
    });
  }
}

class RoomButton extends StatelessWidget {
  const RoomButton({
    Key? key,
    required this.number,
    this.borderRadius,
  }) : super(key: key);

  final int number;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
        buildWhen: (previous, current) =>
            previous.filter.numberOfRooms != current.filter.numberOfRooms ||
            previous.filter.moreThanFiveRooms !=
                current.filter.moreThanFiveRooms,
        builder: (context, state) {
          return InkWell(
            onTap: () => context.read<FilterBloc>().add(RoomsPressed(number)),
            child: Container(
              width: 30,
              height: 40,
              decoration: BoxDecoration(
                color: state.filter.numberOfRooms != null
                    ? state.filter.numberOfRooms!.contains(number)
                        ? FlutterFlowTheme.primaryColor
                        : FlutterFlowTheme.white
                    : FlutterFlowTheme.white,
                borderRadius: borderRadius,
              ),
              child: Center(
                child: Text(
                  number.toString(),
                  style: FlutterFlowTheme.btnTextWhite.copyWith(
                    color: state.filter.numberOfRooms != null
                        ? state.filter.numberOfRooms!.contains(number)
                            ? FlutterFlowTheme.white
                            : FlutterFlowTheme.secondaryColor
                        : FlutterFlowTheme.secondaryColor,
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class MoreThan5 extends StatelessWidget {
  const MoreThan5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      buildWhen: (previous, current) =>
          previous.filter.moreThanFiveRooms != current.filter.moreThanFiveRooms,
      builder: (context, state) {
        return InkWell(
          onTap: () => context.read<FilterBloc>().add(MoreThan5Pressed()),
          child: Container(
            width: 30,
            height: 40,
            decoration: BoxDecoration(
              color: state.filter.moreThanFiveRooms
                  ? FlutterFlowTheme.primaryColor
                  : FlutterFlowTheme.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: const Radius.circular(0),
                bottomRight: const Radius.circular(8),
                topLeft: const Radius.circular(0),
                topRight: const Radius.circular(8),
              ),
            ),
            child: Center(
              child: Text(
                '5+',
                style: FlutterFlowTheme.btnTextWhite.copyWith(
                  color: state.filter.moreThanFiveRooms
                      ? FlutterFlowTheme.white
                      : FlutterFlowTheme.secondaryColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class PriceRangeFrom extends StatefulWidget {
  const PriceRangeFrom({Key? key}) : super(key: key);

  @override
  _PriceRangeFromState createState() => _PriceRangeFromState();
}

class _PriceRangeFromState extends State<PriceRangeFrom> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      obscureText: false,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        if (value.isNotEmpty)
          context
              .read<FilterBloc>()
              .add(PriceRangeChanged(int.parse(value), null));
      },
      decoration: InputDecoration(
        isDense: true,
        hintText: 'от',
        hintStyle: FlutterFlowTheme.hintStyle.copyWith(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        filled: true,
        fillColor: FlutterFlowTheme.white,
      ),
      style: FlutterFlowTheme.darkNormal16.copyWith(),
    );
  }
}

class PriceRangeTo extends StatefulWidget {
  const PriceRangeTo({Key? key}) : super(key: key);

  @override
  _PriceRangeToState createState() => _PriceRangeToState();
}

class _PriceRangeToState extends State<PriceRangeTo> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      obscureText: false,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        if (value.isNotEmpty)
          context
              .read<FilterBloc>()
              .add(PriceRangeChanged(null, int.parse(value)));
      },
      decoration: InputDecoration(
        isDense: true,
        hintText: 'до',
        hintStyle: FlutterFlowTheme.hintStyle.copyWith(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        filled: true,
        fillColor: FlutterFlowTheme.white,
      ),
      style: FlutterFlowTheme.darkNormal16.copyWith(),
    );
  }
}

class AreaRangeFrom extends StatefulWidget {
  const AreaRangeFrom({Key? key}) : super(key: key);

  @override
  _AreaRangeFromState createState() => _AreaRangeFromState();
}

class _AreaRangeFromState extends State<AreaRangeFrom> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      obscureText: false,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        if (value.isNotEmpty)
          context
              .read<FilterBloc>()
              .add(AreaRangeChanged(int.parse(value), null));
      },
      decoration: InputDecoration(
        isDense: true,
        hintText: 'от',
        hintStyle: FlutterFlowTheme.hintStyle.copyWith(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        filled: true,
        fillColor: FlutterFlowTheme.white,
      ),
      style: FlutterFlowTheme.darkNormal16.copyWith(),
    );
  }
}

class AreaRangeTo extends StatefulWidget {
  const AreaRangeTo({Key? key}) : super(key: key);

  @override
  _AreaRangeToState createState() => _AreaRangeToState();
}

class _AreaRangeToState extends State<AreaRangeTo> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      obscureText: false,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        if (value.isNotEmpty)
          context
              .read<FilterBloc>()
              .add(AreaRangeChanged(null, int.parse(value)));
      },
      decoration: InputDecoration(
        isDense: true,
        hintText: 'до',
        hintStyle: FlutterFlowTheme.hintStyle.copyWith(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        filled: true,
        fillColor: FlutterFlowTheme.white,
      ),
      style: FlutterFlowTheme.darkNormal16.copyWith(),
    );
  }
}
