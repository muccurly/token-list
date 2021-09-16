import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jurta_app/src/business_logic/filter/filter.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jurta_app/src/utils/custom_input_formatter.dart';
import 'package:jurta_app/src/utils/extensions.dart';

class PriceRangeFrom extends StatefulWidget {
  const PriceRangeFrom({Key? key}) : super(key: key);

  @override
  _PriceRangeFromState createState() => _PriceRangeFromState();
}

class _PriceRangeFromState extends State<PriceRangeFrom> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
        buildWhen: (previous, current) =>
            previous.filter.priceRange != current.filter.priceRange,
        builder: (context, state) {
          // if (state.filter.priceRange != null) {
          //   if(state.filter.priceRange!.to!=null){
          //     int from = 0;
          //     if(_controller.text.isNotEmpty)
          //       from = int.parse(_controller.text.replaceAll(' ', ''));
          //     if(from > state.filter.priceRange!.to!)
          //       _controller.text = CustomInputFormatter()
          //           .formatEditUpdate(
          //           const TextEditingValue(),
          //           TextEditingValue(
          //               text: state.filter.priceRange!.to.toString()))
          //           .text;
          //
          //     print('state.filter.priceRange!.to : ${state.filter.priceRange!.to}');
          //     // context.read<FilterBloc>().add(PriceRangeFromChanged(state.filter.priceRange!.to));
          //   }
          // }
          return TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CustomInputFormatter(),
            ],
            controller: _controller,
            obscureText: false,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              print('from $value');
              int? val;
              if (value.isNotEmpty) val = int.parse(value.replaceAll(' ', ''));
              context.read<FilterBloc>().add(PriceRangeFromChanged(val));
            },
            decoration: InputDecoration(
              isDense: true,
              hintText: AppLocalizations.of(context)!.from,
              hintStyle: FlutterFlowTheme.hintStyle.copyWith(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: const Color(0x00000000),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: const Color(0x00000000),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              filled: true,
              fillColor: FlutterFlowTheme.white,
            ),
            style: FlutterFlowTheme.darkNormal16.copyWith(),
          );
        });
  }
}

class PriceRangeTo extends StatefulWidget {
  const PriceRangeTo({Key? key}) : super(key: key);

  @override
  _PriceRangeToState createState() => _PriceRangeToState();
}

class _PriceRangeToState extends State<PriceRangeTo> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
        buildWhen: (previous, current) =>
            previous.filter.priceRange != current.filter.priceRange,
        builder: (context, state) {
          // if (state.filter.priceRange != null) {
          //   if (state.filter.priceRange!.from != null) {
          //     int to = 0;
          //     if (_controller.text.isNotEmpty) {
          //       to = int.parse(_controller.text.replaceAll(' ', ''));
          //     }
          //     if (to < state.filter.priceRange!.from!)
          //       _controller.text = CustomInputFormatter()
          //           .formatEditUpdate(
          //               const TextEditingValue(),
          //               TextEditingValue(
          //                   text: state.filter.priceRange!.from.toString()))
          //           .text;
          //
          //     print('state.filter.priceRange!.from : ${state.filter.priceRange!.from}');
          //     context.read<FilterBloc>().add(PriceRangeToChanged(state.filter.priceRange!.from));
          //   }
          // }
          return TextFormField(
            inputFormatters: [

              FilteringTextInputFormatter.digitsOnly,
              CustomInputFormatter(),
            ],
            controller: _controller,
            obscureText: false,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              print('to $value');
              int? val;
              if (value.isNotEmpty) val = int.parse(value.replaceAll(' ', ''));
              context.read<FilterBloc>().add(PriceRangeToChanged(val));
            },
            decoration: InputDecoration(
              isDense: true,
              hintText: AppLocalizations.of(context)!.to,
              hintStyle: FlutterFlowTheme.hintStyle.copyWith(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: const Color(0x00000000),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: const Color(0x00000000),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              filled: true,
              fillColor: FlutterFlowTheme.white,
            ),
            style: FlutterFlowTheme.darkNormal16.copyWith(),
          );
        });
  }
}
