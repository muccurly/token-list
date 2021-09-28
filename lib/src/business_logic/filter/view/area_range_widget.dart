import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jurta_app/src/business_logic/filter/filter.dart';
import 'package:jurta_app/src/data/entity/real_property_filter.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_theme.dart';
import 'package:jurta_app/src/utils/extensions.dart';

class AreaWidget extends StatefulWidget {
  const AreaWidget({Key? key}) : super(key: key);

  @override
  _AreaWidgetState createState() => _AreaWidgetState();
}

class _AreaWidgetState extends State<AreaWidget> {
  final _fromController = TextEditingController();
  final _toController = TextEditingController();

  final _border = OutlineInputBorder(
    borderSide: BorderSide(color: const Color(0x00000000), width: 1),
    borderRadius: BorderRadius.circular(6),
  );

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    RealPropertyFilter filter = BlocProvider.of<FilterBloc>(context).state.filter;
    if(filter.areaRange!=null){
      if(filter.areaRange!.from!=null)
        _fromController.text = filter.areaRange!.from!.toString();
      if(filter.areaRange!.to != null)
        _toController.text = filter.areaRange!.to!.toString();
    }
    super.initState();
  }

  void _onChanged(String value,/* bool priceFrom*/) {
    // int from = 0, to = 0;
    // if (value.isNotEmpty)
    //   priceFrom
    //       ? from = int.parse(value.replaceAll(' ', ''))
    //       : to = int.parse(value.replaceAll(' ', ''));
    // if (priceFrom) {
    //   if (_toController.text.isNotEmpty)
    //     to = int.parse(_toController.text.replaceAll(' ', ''));
    //   if (to < from)
    //     _toController.text = from.toString();
    // } else {
    //   if (_fromController.text.isNotEmpty)
    //     from = int.parse(_fromController.text.replaceAll(' ', ''));
    //   if (to < from) {
    //     if (to == 0)
    //       _fromController.clear();
    //     else
    //       _fromController.text = to.toString();
    //   }
    // }
    int? f, t;
    if (_fromController.text.isNotEmpty)
      f = int.parse(_fromController.text.noWhiteSpaces());
    if (_toController.text.isNotEmpty)
      t = int.parse(_toController.text.noWhiteSpaces());
    context.read<FilterBloc>().add(AreaRangeChanged(f, t));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
            child: TextFormField(
              controller: _fromController,
              obscureText: false,
              keyboardType: TextInputType.number,
              onChanged: (value) => _onChanged(value, /*true*/),
              decoration: InputDecoration(
                isDense: true,
                hintText: AppLocalizations.of(context)!.from.capitalize(),
                hintStyle: FlutterFlowTheme.hintStyle.copyWith(),
                enabledBorder: _border,
                focusedBorder: _border,
                filled: true,
                fillColor: FlutterFlowTheme.white,
              ),
              style: FlutterFlowTheme.darkNormal16.copyWith(),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
            child: TextFormField(
              controller: _toController,
              obscureText: false,
              keyboardType: TextInputType.number,
              onChanged: (value) => _onChanged(value, /*false*/),
              decoration: InputDecoration(
                isDense: true,
                hintText: AppLocalizations.of(context)!.to.capitalize(),
                hintStyle: FlutterFlowTheme.hintStyle.copyWith(),
                enabledBorder: _border,
                focusedBorder: _border,
                filled: true,
                fillColor: FlutterFlowTheme.white,
              ),
              style: FlutterFlowTheme.darkNormal16.copyWith(),
            ),
          ),
        )
      ],
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
      },
      decoration: InputDecoration(
        isDense: true,
        hintText: AppLocalizations.of(context)!.from,
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
      },
      decoration: InputDecoration(
        isDense: true,
        hintText: AppLocalizations.of(context)!.to,
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
