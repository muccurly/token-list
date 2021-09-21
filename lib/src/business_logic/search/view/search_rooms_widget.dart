import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jurta_app/src/business_logic/search/search.dart';
import 'package:jurta_app/src/ui/components/room_button_widget.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_theme.dart';

class SearchRoomsWidget extends StatelessWidget {
  const SearchRoomsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: FlutterFlowTheme.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: BlocBuilder<SearchBloc, SearchState>(
          buildWhen: (previous, current) =>
          previous.filter.numberOfRooms !=
              current.filter.numberOfRooms ||
              previous.filter.moreThanFiveRooms !=
                  current.filter.moreThanFiveRooms,
          builder: (context, state) {
            return Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: RoomButton(
                    text: '1',
                    onPressed: () => context
                        .read<SearchBloc>()
                        .add(SearchRoomsPressed(1)),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: const Radius.circular(8),
                      bottomRight: const Radius.circular(0),
                      topLeft: const Radius.circular(8),
                      topRight: const Radius.circular(0),
                    ),
                    isActive:
                    state.filter.numberOfRooms.contains(1)
                        ? true
                        : false,
                  ),
                ),
                Expanded(
                  child: RoomButton(
                    text: '2',
                    onPressed: () => context
                        .read<SearchBloc>()
                        .add(SearchRoomsPressed(2)),
                    isActive:
                    state.filter.numberOfRooms.contains(2)
                        ? true
                        : false,
                  ),
                ),
                Expanded(
                  child: RoomButton(
                    text: '3',
                    onPressed: () => context
                        .read<SearchBloc>()
                        .add(SearchRoomsPressed(3)),
                    isActive:
                    state.filter.numberOfRooms.contains(3)
                        ? true
                        : false,
                  ),
                ),
                Expanded(
                  child: RoomButton(
                    text: '4',
                    onPressed: () => context
                        .read<SearchBloc>()
                        .add(SearchRoomsPressed(4)),
                    isActive:
                    state.filter.numberOfRooms.contains(4)
                        ? true
                        : false,
                  ),
                ),
                Expanded(
                  child: RoomButton(
                    text: '5+',
                    onPressed: () => context
                        .read<SearchBloc>()
                        .add(SearchMoreThan5Pressed()),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: const Radius.circular(0),
                      bottomRight: const Radius.circular(8),
                      topLeft: const Radius.circular(0),
                      topRight: const Radius.circular(8),
                    ),
                    isActive: state.filter.moreThanFiveRooms,
                  ),
                ),
              ],
            );
          }),
    );
  }
}
