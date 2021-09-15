import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';
import 'package:jurta_app/src/data/entity/multi_lang_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FlutterFlowDropDownObjectTypes extends StatefulWidget {
  const FlutterFlowDropDownObjectTypes({
    this.initialOption,
    required this.options,
    required this.onChanged,
    this.icon = const Icon(
      Icons.keyboard_arrow_down,
      size: 15,
    ),
    this.width,
    this.height,
    this.fillColor = Colors.white,
    required this.textStyle,
    this.elevation = 1,
    this.borderWidth = 1,
    this.borderRadius,
    required this.borderColor,
    this.margin = const EdgeInsets.fromLTRB(8, 4, 8, 4),
    this.hidesUnderline = false,
  });

  final DictionaryMultiLangItem? initialOption;
  final List<DictionaryMultiLangItem> options;
  final Function(DictionaryMultiLangItem) onChanged;
  final Widget icon;
  final double? width;
  final double? height;
  final Color fillColor;
  final TextStyle textStyle;
  final double elevation;
  final double borderWidth;
  final double? borderRadius;
  final Color borderColor;
  final EdgeInsetsGeometry margin;
  final bool hidesUnderline;

  @override
  State<FlutterFlowDropDownObjectTypes> createState() =>
      _FlutterFlowDropDownObjectTypesState();
}

class _FlutterFlowDropDownObjectTypesState
    extends State<FlutterFlowDropDownObjectTypes> {
  DictionaryMultiLangItem? dropDownValue;

  List<DictionaryMultiLangItem> get effectiveOptions => widget.options.isEmpty
      ? [
          DictionaryMultiLangItem(
              code: 'code',
              id: 0,
              name: MultiLangText(
                  nameEn: 'Option', nameRu: 'Option', nameKz: 'Option'))
        ]
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
    final dropdownWidget = DropdownButton<DictionaryMultiLangItem>(
      value: effectiveOptions.contains(dropDownValue) ? dropDownValue : null,
      items: effectiveOptions
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(
                  locale == 'ru'
                      ? e.name.nameRu
                      : locale == 'kz'
                          ? e.name.nameKz
                          : e.name.nameEn,
                  style: widget.textStyle,
                ),
              ))
          .toList(),
      elevation: widget.elevation.toInt(),
      onChanged: (value) {
        if (value != null) {
          dropDownValue = value;
          widget.onChanged(value);
        }
      },
      icon: widget.icon,
      isExpanded: true,
      dropdownColor: widget.fillColor,
    );
    final childWidget = DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 28),
        border: Border.all(
          color: widget.borderColor,
          width: widget.borderWidth,
        ),
        color: widget.fillColor,
      ),
      child: Padding(
        padding: widget.margin,
        child: widget.hidesUnderline
            ? DropdownButtonHideUnderline(child: dropdownWidget)
            : dropdownWidget,
      ),
    );
    if (widget.height != null || widget.width != null) {
      return Container(
          width: widget.width, height: widget.height, child: childWidget);
    }
    return childWidget;
  }
}
