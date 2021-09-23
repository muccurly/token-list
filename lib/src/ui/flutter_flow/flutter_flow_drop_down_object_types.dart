import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';
import 'package:jurta_app/src/data/entity/multi_lang_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_theme.dart';

class FlutterFlowDropDownObjectTypes extends StatefulWidget {
  const FlutterFlowDropDownObjectTypes({
    this.initialOption,
    required this.options,
    required this.onChanged,
  });

  final DictionaryMultiLangItem? initialOption;
  final List<DictionaryMultiLangItem> options;
  final Function(DictionaryMultiLangItem) onChanged;

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

  /*Widget _buildSearchList() => Container(
       height: 150.0,
       decoration: BoxDecoration(
         border: Border.all(color: Colors.grey[400], width: 1),
         borderRadius: BorderRadius.all(Radius.circular(5)),
         color: Colors.white,
       ),
       padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
       margin: EdgeInsets.only(top: 5.0),
       child: ListView.builder(
           padding: const EdgeInsets.all(0),
           shrinkWrap: true,
           scrollDirection: Axis.vertical,
           physics:
               BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
           itemCount: _testList.length,
           itemBuilder: (context, position) {
             return InkWell(
               onTap: () {
                 _onChanged(position);
               },
               child: Container(
                   // padding: widget.padding,
                   padding:
                       EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                   decoration: BoxDecoration(
                       color: position == _selectedIndex
                           ? Colors.grey[100]
                           : Colors.white,
                       borderRadius: BorderRadius.all(Radius.circular(4.0))),
                   child: Text(_testList[position]['keyword'],style: TextStyle(color: Colors.black),)),
             );
           }),
     );
  * */

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
                      : locale == 'kk'
                          ? e.name.nameKz
                          : e.name.nameEn,
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
          child: DropdownButtonHideUnderline(child: dropdownWidget)),
    );
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        child: childWidget);
  }
}
