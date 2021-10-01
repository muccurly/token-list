import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_theme.dart';
import 'package:jurta_app/src/utils/custom_input_formatter.dart';
import 'package:jurta_app/src/utils/extensions.dart';


class RangeWidget extends StatefulWidget {
  const RangeWidget({
    Key? key,
    required this.fromController,
    required this.toController,
    required this.onChanged,
    this.space = true,
    this.maxLength,
  }) : super(key: key);
  final TextEditingController fromController;
  final TextEditingController toController;
  final Function(String value, bool from) onChanged;
  final int? maxLength;
  final bool space;

  @override
  _RangeWidgetState createState() => _RangeWidgetState();
}

class _RangeWidgetState extends State<RangeWidget> {

  final _border = OutlineInputBorder(
    borderSide: BorderSide(color: const Color(0x00000000), width: 1),
    borderRadius: BorderRadius.circular(6),
  );

  final _formatters = <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly,
    NumericTextFormatter()
  ];

  final _formattersNoSpace = <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly,
    // NumericTextFormatter()
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
            child: TextFormField(
              inputFormatters: widget.space? _formatters : _formattersNoSpace,
              controller: widget.fromController,
              maxLength: widget.maxLength,
              obscureText: false,
              keyboardType: TextInputType.number,
              onChanged: (value) => widget.onChanged(value, true),
              decoration: InputDecoration(
                isDense: true,
                hintText: AppLocalizations.of(context)!.from.capitalize(),
                hintStyle: FlutterFlowTheme.hintStyle.copyWith(),
                counterText: "",
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
              inputFormatters: widget.space? _formatters : _formattersNoSpace,
              controller: widget.toController,
              maxLength: widget.maxLength,
              obscureText: false,
              keyboardType: TextInputType.number,
              onChanged: (value) => widget.onChanged(value, false),
              decoration: InputDecoration(
                isDense: true,
                hintText: AppLocalizations.of(context)!.to.capitalize(),
                hintStyle: FlutterFlowTheme.hintStyle.copyWith(),
                counterText: "",
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

class RangeWidget2 extends StatefulWidget {
  const RangeWidget2({
    Key? key,
    required this.fromController,
    required this.toController,
    required this.onChanged,
    this.maxLength,
  }) : super(key: key);
  final TextEditingController fromController;
  final TextEditingController toController;
  final Function(String value, /*bool from*/) onChanged;
  final int? maxLength;

  @override
  _RangeWidget2State createState() => _RangeWidget2State();
}

class _RangeWidget2State extends State<RangeWidget2> {

  final _border = OutlineInputBorder(
    borderSide: BorderSide(color: const Color(0x00000000), width: 1),
    borderRadius: BorderRadius.circular(6),
  );

  final _formatters = <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly,
    NumericTextFormatter()
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
            child: TextFormField(
              inputFormatters: _formatters,
              controller: widget.fromController,
              maxLength: widget.maxLength,
              obscureText: false,
              keyboardType: TextInputType.number,
              onChanged: (value) => widget.onChanged(value, /*true*/),
              decoration: InputDecoration(
                isDense: true,
                hintText: AppLocalizations.of(context)!.from.capitalize(),
                hintStyle: FlutterFlowTheme.hintStyle.copyWith(),
                counterText: "",
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
              inputFormatters: _formatters,
              controller: widget.toController,
              maxLength: widget.maxLength,
              obscureText: false,
              keyboardType: TextInputType.number,
              onChanged: (value) => widget.onChanged(value,/* false*/),
              decoration: InputDecoration(
                isDense: true,
                hintText: AppLocalizations.of(context)!.to.capitalize(),
                hintStyle: FlutterFlowTheme.hintStyle.copyWith(),
                counterText: "",
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

class AreaWidget2 extends StatefulWidget {
  const AreaWidget2({
    Key? key,
    required this.fromController,
    required this.toController,
    required this.onChanged,
    this.maxLength,
  }) : super(key: key);
  final TextEditingController fromController;
  final TextEditingController toController;
  final Function(String value, /*bool from*/) onChanged;
  final int? maxLength;

  @override
  _AreaWidget2State createState() => _AreaWidget2State();
}

class _AreaWidget2State extends State<AreaWidget2> {

  final _border = OutlineInputBorder(
    borderSide: BorderSide(color: const Color(0x00000000), width: 1),
    borderRadius: BorderRadius.circular(6),
  );

  final _formatters = <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly,
    NumericTextFormatter()
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
            child: TextFormField(
              inputFormatters: _formatters,
              controller: widget.fromController,
              maxLength: widget.maxLength,
              obscureText: false,
              keyboardType: TextInputType.number,
              onChanged: (value) => widget.onChanged(value, /*true*/),
              decoration: InputDecoration(
                isDense: true,
                hintText: AppLocalizations.of(context)!.from.capitalize(),
                hintStyle: FlutterFlowTheme.hintStyle.copyWith(),
                counterText: "",
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
              inputFormatters: _formatters,
              controller: widget.toController,
              maxLength: widget.maxLength,
              obscureText: false,
              keyboardType: TextInputType.number,
              onChanged: (value) => widget.onChanged(value,/* false*/),
              decoration: InputDecoration(
                isDense: true,
                hintText: AppLocalizations.of(context)!.to.capitalize(),
                hintStyle: FlutterFlowTheme.hintStyle.copyWith(),
                counterText: "",
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
