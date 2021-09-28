import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jurta_app/src/data/entity/address.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_theme.dart';

class FlutterFlowDropDownAddress extends StatefulWidget {
  const FlutterFlowDropDownAddress({
    this.initialOption,
    required this.options,
    required this.onChanged,
    this.width,
    required this.hintText,
  });

  final Address? initialOption;
  final List<Address> options;
  final Function(Address) onChanged;
  final double? width;
  final String hintText;

  @override
  State<FlutterFlowDropDownAddress> createState() =>
      _FlutterFlowDropDownAddressState();
}

class _FlutterFlowDropDownAddressState
    extends State<FlutterFlowDropDownAddress> {
  Address? dropDownValue;

  List<Address> get effectiveOptions =>
      widget.options.isEmpty ? [Address.empty] : widget.options;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      // dropDownValue = widget.initialOption ?? widget.options.first;
      // widget.onChanged(dropDownValue!);
    });
  }

  _text(Address item) {
    final locale = AppLocalizations.of(context)!.localeName;
    var t = locale == 'ru'
        ? item.address?.addressObject.name.nameRu
        : locale == 'kk'
            ? item.address?.addressObject.name.nameKz
            : item.address?.addressObject.name.nameEn;
    return t ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final dropdownWidget = DropdownButton<Address>(
      hint: Text(
        widget.hintText,
        style: const TextStyle(color: const Color(0xFFADADAD)),
      ),
      value: effectiveOptions.contains(dropDownValue) ? dropDownValue : null,
      items: effectiveOptions
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(
                  _text(e),
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
