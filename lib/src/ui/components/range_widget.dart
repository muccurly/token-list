import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_theme.dart';
import 'package:jurta_app/src/utils/custom_input_formatter.dart';

class RangeWidget extends StatefulWidget {
  const RangeWidget({
    Key? key,
    required this.fromController,
    required this.toController,
    required this.onChanged,
<<<<<<< HEAD
=======
    this.maxLength,
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
  }) : super(key: key);
  final TextEditingController fromController;
  final TextEditingController toController;
  final Function(String value, bool from) onChanged;
<<<<<<< HEAD
=======
  final int? maxLength;
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94

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
<<<<<<< HEAD
=======
              maxLength: widget.maxLength,
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
              obscureText: false,
              keyboardType: TextInputType.number,
              onChanged: (value) => widget.onChanged(value, true),
              decoration: InputDecoration(
                isDense: true,
                hintText: AppLocalizations.of(context)!.from,
                hintStyle: FlutterFlowTheme.hintStyle.copyWith(),
<<<<<<< HEAD
=======
                counterText: "",
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
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
<<<<<<< HEAD
=======
              maxLength: widget.maxLength,
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
              obscureText: false,
              keyboardType: TextInputType.number,
              onChanged: (value) => widget.onChanged(value, false),
              decoration: InputDecoration(
                isDense: true,
                hintText: AppLocalizations.of(context)!.to,
                hintStyle: FlutterFlowTheme.hintStyle.copyWith(),
<<<<<<< HEAD
=======
                counterText: "",
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
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
