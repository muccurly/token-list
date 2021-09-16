import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jurta_app/src/business_logic/filter/filter.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jurta_app/src/utils/custom_input_formatter.dart';

class PriceWidget extends StatefulWidget {
  const PriceWidget({Key? key}) : super(key: key);

  @override
  _PriceWidgetState createState() => _PriceWidgetState();
}

class _PriceWidgetState extends State<PriceWidget> {
  final _fromController = TextEditingController();
  final _toController = TextEditingController();

  final _border = OutlineInputBorder(
    borderSide: BorderSide(color: const Color(0x00000000), width: 1),
    borderRadius: BorderRadius.circular(6),
  );

  final _formatters = <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly,
    NumericTextFormatter()
  ];

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  void _onChanged(String value, bool priceFrom) {
    int from = 0, to = 0;
    if (value.isNotEmpty)
      priceFrom
          ? from = int.parse(value.replaceAll(' ', ''))
          : to = int.parse(value.replaceAll(' ', ''));
    if (priceFrom) {
      if (_toController.text.isNotEmpty)
        to = int.parse(_toController.text.replaceAll(' ', ''));
      if (to < from)
        _toController.text = NumericTextFormatter()
            .formatEditUpdate(const TextEditingValue(),
                TextEditingValue(text: from.toString()))
            .text;
    } else {
      if (_fromController.text.isNotEmpty)
        from = int.parse(_fromController.text.replaceAll(' ', ''));
      if (to < from) {
        if (to == 0)
          _fromController.clear();
        else
          _fromController.text = NumericTextFormatter()
              .formatEditUpdate(const TextEditingValue(),
                  TextEditingValue(text: to.toString()))
              .text;
      }
    }
    int? f, t;
    if (_fromController.text.isNotEmpty)
      f = int.parse(_fromController.text.replaceAll(' ', ''));
    if (_toController.text.isNotEmpty)
      t = int.parse(_toController.text.replaceAll(' ', ''));
    context.read<FilterBloc>().add(PriceRangeChanged(f, t));
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
              inputFormatters: _formatters,
              controller: _fromController,
              obscureText: false,
              keyboardType: TextInputType.number,
              onChanged: (value) => _onChanged(value, true),
              decoration: InputDecoration(
                isDense: true,
                hintText: AppLocalizations.of(context)!.from,
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
              inputFormatters: _formatters,
              controller: _toController,
              obscureText: false,
              keyboardType: TextInputType.number,
              onChanged: (value) => _onChanged(value, false),
              decoration: InputDecoration(
                isDense: true,
                hintText: AppLocalizations.of(context)!.to,
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
