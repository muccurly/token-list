import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jurta_app/src/business_logic/search/search.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_drop_down_object_types.dart';
import 'package:jurta_app/src/utils/placeholders.dart' as placeholders;

class SearchObjTypesDropDown extends StatefulWidget {
  const SearchObjTypesDropDown({Key? key}) : super(key: key);

  @override
  _SearchObjTypesDropDownState createState() => _SearchObjTypesDropDownState();
}

class _SearchObjTypesDropDownState extends State<SearchObjTypesDropDown> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) =>
      previous.objectTypes != current.objectTypes,
      builder: (context, state) {
        if (state.objectTypes.isEmpty)
          return placeholders.objectTypesDropDownPlaceholder;
        return FlutterFlowDropDownObjectTypes(
          options: state.objectTypes,
          onChanged: (value) {
            setState(() {});
            context
                .read<SearchBloc>()
                .add(SearchObjectTypeChoose(value));
          },
        );
      },
    );
  }
}

