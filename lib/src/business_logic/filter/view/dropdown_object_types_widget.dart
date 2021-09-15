import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jurta_app/src/business_logic/filter/filter.dart';
import 'package:jurta_app/src/data/entity/object_type.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_drop_down_object_types.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_theme.dart';
import 'package:jurta_app/src/utils/placeholders.dart' as placeholders;

class ObjectTypesDropDown extends StatefulWidget {
  const ObjectTypesDropDown({Key? key}) : super(key: key);

  @override
  _ObjectTypesDropDownState createState() => _ObjectTypesDropDownState();
}

class _ObjectTypesDropDownState extends State<ObjectTypesDropDown> {
  ObjectType? dropDownValue;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return BlocBuilder<FilterBloc, FilterState>(builder: (context, state) {
      if (state.objectTypes == null) {
        return placeholders.objectTypesDropDownPlaceholder;
      }
      return FlutterFlowDropDownObjectTypes(
        options: state.objectTypes!,
        onChanged: (value) {
          setState(() => dropDownValue = value);
          context.read<FilterBloc>().add(ObjectTypeChose(value));
        },
        width: _size.width,
        height: 40,
        textStyle: FlutterFlowTheme.darkNormal16.copyWith(),
        icon: Icon(
          Icons.keyboard_arrow_down_outlined,
          color: FlutterFlowTheme.secondaryColor,
          size: 24,
        ),
        fillColor: Colors.white,
        elevation: 2,
        borderColor: Colors.transparent,
        borderWidth: 0,
        borderRadius: 0,
        margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
        hidesUnderline: true,
      );
    });
  }
}
