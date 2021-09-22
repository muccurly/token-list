import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
<<<<<<< HEAD
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jurta_app/src/business_logic/search/search.dart';
import 'package:jurta_app/src/data/entity/address.dart';
import 'package:jurta_app/src/data/entity/multi_lang_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
=======
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jurta_app/src/data/entity/address.dart';
import 'package:jurta_app/src/data/entity/multi_lang_text.dart';
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_theme.dart';

class FlutterFlowDropDownAddress extends StatefulWidget {
  const FlutterFlowDropDownAddress({
    this.initialOption,
    required this.options,
    required this.onChanged,
<<<<<<< HEAD
=======
    this.width,
    required this.hintText,
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
  });

  final Address? initialOption;
  final List<Address> options;
  final Function(Address) onChanged;
<<<<<<< HEAD
=======
  final double? width;
  final String hintText;
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94

  @override
  State<FlutterFlowDropDownAddress> createState() =>
      _FlutterFlowDropDownAddressState();
}

class _FlutterFlowDropDownAddressState
    extends State<FlutterFlowDropDownAddress> {
  Address? dropDownValue;

  List<Address> get effectiveOptions => widget.options.isEmpty
      ? [
          Address(
              address: AddressObjectWithType(
                  addressObject: AddressObject(
                      id: -1,
                      code: 'Option',
                      name: MultiLangText(
                          nameEn: 'Option', nameKz: 'Option', nameRu: 'Option'),
                      idKazPost: 'Option'),
                  addressType: AddressType(
                      id: -1,
                      name: MultiLangText(
                          nameEn: 'Option',
                          nameKz: 'Option',
                          nameRu: 'Option'))),
              total: 0)
        ]
      : widget.options;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
<<<<<<< HEAD
      dropDownValue = widget.initialOption ?? widget.options.first;
      widget.onChanged(dropDownValue!);
=======
      // dropDownValue = widget.initialOption ?? widget.options.first;
      // widget.onChanged(dropDownValue!);
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
    });
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!.localeName;
    final dropdownWidget = DropdownButton<Address>(
<<<<<<< HEAD
=======
      hint: Text(
        widget.hintText,
        style: const TextStyle(color: const Color(0xFFADADAD)),
      ),
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
      value: effectiveOptions.contains(dropDownValue) ? dropDownValue : null,
      items: effectiveOptions
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(
                  locale == 'ru'
                      ? e.address.addressObject.name.nameRu
                      : locale == 'kk'
                          ? e.address.addressObject.name.nameKz
                          : e.address.addressObject.name.nameEn,
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
<<<<<<< HEAD
        width: MediaQuery.of(context).size.width,
=======
        width: widget.width ?? MediaQuery.of(context).size.width,
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
        height: 40,
        child: childWidget);
  }
}
