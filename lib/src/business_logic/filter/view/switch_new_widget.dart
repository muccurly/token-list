import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jurta_app/src/business_logic/filter/filter.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_theme.dart';
import 'package:jurta_app/src/utils/extensions.dart';

class NewWidget extends StatelessWidget {
  const NewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      buildWhen: (previous, current) =>
      previous.filter.showNew != current.filter.showNew,
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              const Radius.circular(10),
            ),
          ),
          child: SwitchListTile(
            value: state.filter.showNew,
            contentPadding: EdgeInsets.symmetric(horizontal:3),
            onChanged: (newValue) =>
                context.read<FilterBloc>().add(NewPressed(newValue)),
            title: Text(
              AppLocalizations.of(context)!.newAdds.capitalize(),
              style: FlutterFlowTheme.dark50016.copyWith(
                  fontSize: 15
              ),
            ),
            tileColor: FlutterFlowTheme.white,
            activeColor: FlutterFlowTheme.primaryColor,
            dense: true,
            controlAffinity: ListTileControlAffinity.trailing,
          ),
        );
      },
    );
  }
}
