import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jurta_app/src/business_logic/sort/models/models.dart';
import 'package:jurta_app/src/business_logic/sort/sort.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class SortFilterBoxWidget extends StatefulWidget {
  SortFilterBoxWidget({Key? key}) : super(key: key);

  @override
  _SortFilterBoxWidgetState createState() => _SortFilterBoxWidgetState();
}

int newUp = 1;
int priceDown = 1;
int priceUp = 1;
int roomDown = 1;
int roomUp = 1;
int meterDown = 1;
int meterUp = 1;

class _SortFilterBoxWidgetState extends State<SortFilterBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: const Color(0x00FFFFFF),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Container(
              width: 350,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: FlutterFlowTheme.white,
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.white,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                            child: Text(
                              'Сортировать по',
                              style: FlutterFlowTheme.subtitleText.copyWith(
                                color: FlutterFlowTheme.primaryColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                            child: InkWell(
                              onTap: () async => Navigator.pop(context),
                              child: const Icon(
                                Icons.close_outlined,
                                color: FlutterFlowTheme.dark,
                                size: 26,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder<SortCubit, SortState>(
                        buildWhen: (p, c) => p.sortField != c.sortField,
                        builder: (context, state) => SortChoice(
                          onTap: () => context.read<SortCubit>().byDate(),
                          text: 'По новизне',
                          isActive: state.sortField == SortField.DATE,
                        ),
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder<SortCubit, SortState>(
                        builder: (context, state) => SortChoice(
                          onTap: () => context.read<SortCubit>().byPriceDown(),
                          text: 'Цена (по убыванию)',
                          isActive: state.sortField == SortField.PRICE &&
                              state.direction == Direction.DESC,
                        ),
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder<SortCubit, SortState>(
                        builder: (context, state) => SortChoice(
                          onTap: () => context.read<SortCubit>().byPriceUp(),
                          text: 'Цена (по возрастанию)',
                          isActive: state.sortField == SortField.PRICE &&
                              state.direction == Direction.ASC,
                        ),
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder<SortCubit, SortState>(
                        builder: (context, state) => SortChoice(
                          onTap: () => context.read<SortCubit>().byRoomsDown(),
                          text: 'По комнатам (по убыванию)',
                          isActive: state.sortField == SortField.ROOMS &&
                              state.direction == Direction.DESC,
                        ),
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder<SortCubit, SortState>(
                        builder: (context, state) => SortChoice(
                          onTap: () => context.read<SortCubit>().byRoomsUp(),
                          text: 'По комнатам (по возрастанию)',
                          isActive: state.sortField == SortField.ROOMS &&
                              state.direction == Direction.ASC,
                        ),
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder<SortCubit, SortState>(
                        builder: (context, state) => SortChoice(
                          onTap: () => context.read<SortCubit>().byAreaDown(),
                          text: 'По площади (по убыванию)',
                          isActive: state.sortField == SortField.AREA &&
                              state.direction == Direction.DESC,
                        ),
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder<SortCubit, SortState>(
                        builder: (context, state) => SortChoice(
                          onTap: () => context.read<SortCubit>().byAreaUp(),
                          text: 'По площади (по возрастанию)',
                          isActive: state.sortField == SortField.AREA &&
                              state.direction == Direction.ASC,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SortChoice extends StatelessWidget {
  SortChoice({
    Key? key,
    required this.onTap,
    required this.text,
    required this.isActive,
  }) : super(key: key);

  final VoidCallback onTap;
  final String text;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        onTap.call();
        Navigator.pop(context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: isActive
                ? FlutterFlowTheme.primaryColor
                : FlutterFlowTheme.white),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                text,
                style: isActive
                    ? FlutterFlowTheme.bodyTextWhite
                    : FlutterFlowTheme.bodyTextDark,
              )
            ],
          ),
        ),
      ),
    );
  }
}
