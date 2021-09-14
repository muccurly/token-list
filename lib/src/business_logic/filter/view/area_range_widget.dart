import 'package:flutter/material.dart';
import 'package:jurta_app/src/business_logic/filter/filter.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        if (value.isNotEmpty)
          context
              .read<FilterBloc>()
              .add(AreaRangeChanged(null, int.parse(value)));
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
