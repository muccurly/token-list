import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jurta_app/src/business_logic/filter/filter.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_theme.dart';

class RoomButton extends StatelessWidget {
  const RoomButton({
    Key? key,
    required this.number,
    this.borderRadius,
  }) : super(key: key);

  final int number;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
        buildWhen: (previous, current) =>
        previous.filter.numberOfRooms != current.filter.numberOfRooms ||
            previous.filter.moreThanFiveRooms !=
                current.filter.moreThanFiveRooms,
        builder: (context, state) {
          return InkWell(
            onTap: () => context.read<FilterBloc>().add(RoomsPressed(number)),
            child: Container(
              width: 30,
              height: 40,
              decoration: BoxDecoration(
                color: state.filter.numberOfRooms != null
                    ? state.filter.numberOfRooms!.contains(number)
                    ? FlutterFlowTheme.primaryColor
                    : FlutterFlowTheme.white
                    : FlutterFlowTheme.white,
                borderRadius: borderRadius,
              ),
              child: Center(
                child: Text(
                  number.toString(),
                  style: FlutterFlowTheme.btnTextWhite.copyWith(
                    color: state.filter.numberOfRooms != null
                        ? state.filter.numberOfRooms!.contains(number)
                        ? FlutterFlowTheme.white
                        : FlutterFlowTheme.secondaryColor
                        : FlutterFlowTheme.secondaryColor,
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class MoreThan5 extends StatelessWidget {
  const MoreThan5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      buildWhen: (previous, current) =>
      previous.filter.moreThanFiveRooms != current.filter.moreThanFiveRooms,
      builder: (context, state) {
        return InkWell(
          onTap: () => context.read<FilterBloc>().add(MoreThan5Pressed()),
          child: Container(
            width: 30,
            height: 40,
            decoration: BoxDecoration(
              color: state.filter.moreThanFiveRooms
                  ? FlutterFlowTheme.primaryColor
                  : FlutterFlowTheme.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: const Radius.circular(0),
                bottomRight: const Radius.circular(8),
                topLeft: const Radius.circular(0),
                topRight: const Radius.circular(8),
              ),
            ),
            child: Center(
              child: Text(
                '5+',
                style: FlutterFlowTheme.btnTextWhite.copyWith(
                  color: state.filter.moreThanFiveRooms
                      ? FlutterFlowTheme.white
                      : FlutterFlowTheme.secondaryColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
