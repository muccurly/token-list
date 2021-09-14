import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:jurta_app/src/business_logic/home/home.dart';
import 'package:jurta_app/src/utils/placeholders.dart' as placeholders;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jurta_app/src/utils/extensions.dart';

import '../components/filter_widget.dart';
import '../components/home_object_box_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../search_page/search_page_widget.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final pageViewController = PageController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool showFilter = false;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: SingleChildScrollView(
        child: Container(
          width: _size.width,
          height: _size.height,
          child: Stack(
            children: [
              BlocListener<HomeBloc, HomeState>(
                listenWhen: (previous, current) =>
                    previous.status != current.status,
                listener: (context, state) {
                  if (state.status.isSubmissionFailure && state.message != null)
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.message!)));
                },
                child: BlocBuilder<HomeBloc, HomeState>(
                  buildWhen: (previous, current) =>
                      previous.properties != current.properties ||
                      previous.status != current.status,
                  builder: (context, state) {
                    if(state.status.isSubmissionInProgress && state.firstLoading){
                      return placeholders.shimmer;
                    }
                    if (state.properties.isEmpty) {
                      if (state.status.isSubmissionInProgress ||
                          state.status.isPure)
                        return placeholders.shimmer;
                      else
                        return Container(
                          width: _size.width,
                          height: _size.height,
                          color: Colors.blue[300]!,
                          child: Center(
                            child: Text('Empty properties!'
                                '\nNeed a placeholder for this situation...'),
                          ),
                        );
                    }
                    return Container(
                      width: _size.width,
                      height: _size.height,
                      child: RefreshIndicator(
                        onRefresh: () async {
                          context.read<HomeBloc>().add(LoadProperties());
                          await Future.delayed(const Duration(seconds: 2));
                        },
                        child: PageView.builder(
                          controller: pageViewController,
                          scrollDirection: Axis.vertical,
                          onPageChanged: (page) {
                            print('current page: $page');
                            if (page == state.properties.length - 3)
                              context
                                  .read<HomeBloc>()
                                  .add(LoadMoreProperties());
                          },
                          itemCount: state.status.isSubmissionInProgress
                              ? state.properties.length + 1
                              : state.properties.length,
                          itemBuilder: (context, index) =>
                              index == state.properties.length
                                  ? placeholders.shimmer
                                  : HomeObjectBoxWidget(
                                      realProperty: state.properties[index]),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment(-1, 0),
                            child: Container(
                              width: _size.width * 0.25,
                              height: _size.height * 0.05,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.secondaryColor,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: const Radius.circular(0),
                                  bottomRight: const Radius.circular(16),
                                  topLeft: const Radius.circular(0),
                                  topRight: const Radius.circular(16),
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.secondaryColor,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
                                child: Image.asset(
                                  'assets/images/Jurta-2.png',
                                  width: _size.width * 0.75,
                                  height: _size.height * 0.75,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          child: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: const Duration(milliseconds: 300),
                                  reverseDuration: const Duration(milliseconds: 300),
                                  child: SearchPageWidget(),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.search.capitalize(),
                                  style:
                                      FlutterFlowTheme.subtitleText.copyWith(),
                                ),
                                Icon(
                                  Icons.search_outlined,
                                  color: FlutterFlowTheme.white,
                                  size: 24,
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () =>
                            setState(() => showFilter = !showFilter),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.filter.capitalize(),
                                style: FlutterFlowTheme.subtitleText.copyWith(),
                              ),
                              Icon(
                                Icons.import_export_outlined,
                                color: FlutterFlowTheme.white,
                                size: 24,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              AnimatedPositioned(
                left: showFilter ? _size.width * .3 : _size.width,
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 300),
                child: FilterWidget(
                  onCancel: () =>
                    setState(() => showFilter = !showFilter),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
