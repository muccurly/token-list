import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:jurta_app/src/business_logic/search/search.dart';
import 'package:jurta_app/src/business_logic/search_mini/bloc/search_mini_bloc.dart';
import 'package:jurta_app/src/data/entity/real_property.dart';
import 'package:jurta_app/src/ui/object_info_page/object_info_page_widget.dart';
import 'package:jurta_app/src/utils/placeholders.dart' as placeholders;

import '../components/search_result_box_widget.dart';
import '../components/sort_filter_box_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';

class SearchResultPageWidget extends StatelessWidget {
  SearchResultPageWidget({
    Key? key,
    required this.isSearchMini,
  }) : super(key: key);
  final bool isSearchMini;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.tertiaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () async => Navigator.pop(context),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.arrow_back_outlined,
                            color: Colors.black,
                            size: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                            child: Text(
                              'РЕЗУЛЬТАТ ПОИСКА',
                              style: FlutterFlowTheme.subtitleTextDark.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Color(0x1AFFFFFF),
                          barrierColor: Color(0xCBFFFFFF),
                          context: context,
                          builder: (context) {
                            return Container(
                              height: MediaQuery.of(context).size.height,
                              child: SortFilterBoxWidget(),
                            );
                          },
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                            child: Text(
                              'Сортировка',
                              style:
                                  FlutterFlowTheme.subtitleTextDark.copyWith(),
                            ),
                          ),
                          Icon(
                            Icons.import_export_outlined,
                            color: Colors.black,
                            size: 20,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
              child: Text(
                'СПИСОК',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.titleText.copyWith(
                  color: FlutterFlowTheme.primaryColor,
                ),
              ),
            ),
            Divider(
              thickness: 3,
              color: FlutterFlowTheme.primaryColor,
            ),
            Expanded(
              child: FromBloc(isMini: isSearchMini),
            )
          ],
        ),
      ),
    );
  }
}

class FromBloc extends StatelessWidget {
  const FromBloc({Key? key, required this.isMini}) : super(key: key);

  final bool isMini;

  @override
  Widget build(BuildContext context) {
    return isMini
        ? BlocBuilder<SearchMiniBloc, SearchMiniState>(
            buildWhen: (p, c) =>
                p.moreStatus != c.moreStatus ||
                p.properties != c.properties ||
                p.updateStatus != c.updateStatus,
            builder: (context, state) {
              if(state.updateStatus.isSubmissionInProgress)
                return placeholders.gridShimmer;
              return ContentWidget(
                items: state.properties,
                status: state.moreStatus,
                load: () =>
                    context.read<SearchMiniBloc>().add(SearchMiniMore()),
              );
            })
        : BlocBuilder<SearchBloc, SearchState>(
            buildWhen: (p, c) =>
                p.moreStatus != c.moreStatus || p.properties != c.properties,
            builder: (context, state) => ContentWidget(
                  items: state.properties,
                  status: state.moreStatus,
                  load: () => context.read<SearchBloc>().add(SearchMore()),
                ));
  }
}

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    Key? key,
    required this.items,
    required this.status,
    required this.load,
  }) : super(key: key);

  final List<RealProperty> items;
  final FormzStatus status;
  final VoidCallback load;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 0,
        childAspectRatio: .55,
      ),
      scrollDirection: Axis.vertical,
      itemCount:
          status.isSubmissionInProgress ? items.length + 2 : items.length,
      itemBuilder: (context, index) {
        if (index == items.length - 4) load.call();
        if (index == items.length || index == items.length + 1)
          return placeholders.gridItemShimmer;
        return InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                duration: Duration(milliseconds: 300),
                reverseDuration: Duration(milliseconds: 300),
                child: ObjectInfoPageWidget(
                  realProperty: items[index],
                ),
              ),
            );
          },
          child: SearchResultBoxWidget(
            property: items[index],
          ),
        );
      },
    );
  }
}
