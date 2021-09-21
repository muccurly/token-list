import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jurta_app/src/business_logic/search/search.dart';
import 'package:jurta_app/src/data/entity/address.dart';
import 'package:jurta_app/src/data/entity/multi_lang_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jurta_app/src/data/entity/residential_complex.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_theme.dart';

class FlutterFlowDropDownComplex extends StatefulWidget {
  const FlutterFlowDropDownComplex({
    this.initialOption,
    required this.options,
    required this.onChanged,
    this.width,
  });

  final ResidentialComplex? initialOption;
  final List<ResidentialComplex> options;
  final Function(ResidentialComplex) onChanged;
  final double? width;

  @override
  State<FlutterFlowDropDownComplex> createState() =>
      _FlutterFlowDropDownComplexState();
}

class _FlutterFlowDropDownComplexState
    extends State<FlutterFlowDropDownComplex> {
  ResidentialComplex? dropDownValue;

  List<ResidentialComplex> get effectiveOptions => widget.options.isEmpty
      ? [ ]
      : widget.options;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      dropDownValue = widget.initialOption ?? widget.options.first;
      widget.onChanged(dropDownValue!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!.localeName;
    final dropdownWidget = DropdownButton<ResidentialComplex>(
      value: effectiveOptions.contains(dropDownValue) ? dropDownValue : null,
      items: effectiveOptions
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e.houseName,
                  style: FlutterFlowTheme.darkNormal16,
                ),
              ))
          .toList(),
      elevation: 2,
      onChanged: (value) {
        if (value != null) {
          dropDownValue = value;
          widget.onChanged(value);
        }
      },
      icon: const Icon(
        Icons.keyboard_arrow_down_outlined,
        color: FlutterFlowTheme.secondaryColor,
        size: 24,
      ),
      isExpanded: true,
      dropdownColor: Colors.white,
    );

    final childWidget = DecoratedBox(
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
        child: DropdownButtonHideUnderline(child: dropdownWidget),
      ),
    );
    return Container(
        width: widget.width ?? MediaQuery.of(context).size.width,
        height: 40,
        child: childWidget);
  }
}
