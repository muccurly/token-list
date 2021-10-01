import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jurta_app/src/business_logic/details/details.dart';
import 'package:jurta_app/src/data/entity/property.dart';
import 'package:jurta_app/src/data/repository/i_dictionary_repository.dart';
import 'package:jurta_app/src/data/repository/i_other_structures_repository.dart';
import 'package:jurta_app/src/data/repository/i_property_repository.dart';
import 'package:jurta_app/src/data/repository/i_settings_repository.dart';
import 'package:jurta_app/src/ui/components/images_box_widget.dart';
import 'package:jurta_app/src/ui/components/main_object_box_widget.dart';
import 'package:jurta_app/src/ui/components/small_info_box_widget.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_theme.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_util.dart';
import 'package:jurta_app/src/utils/extensions.dart';
import 'package:jurta_app/src/utils/placeholders.dart' as placeholders;

class ObjectInfoPageWidget extends StatelessWidget {
  const ObjectInfoPageWidget({
    Key? key,
    required this.property,
  }) : super(key: key);

  final Property property;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailsBloc>(
      create: (context) => DetailsBloc(
        property: property,
        settingsRepository: RepositoryProvider.of<ISettingsRepository>(context),
        propertyRepository: RepositoryProvider.of<IPropertyRepository>(context),
        dictionaryRepository:
            RepositoryProvider.of<IDictionaryRepository>(context),
        otherStructuresRepository:
            RepositoryProvider.of<IOtherStructuresRepository>(context),
      )..add(DetailsLoad(property.sellDataDTOXpm.appId)),
      child: ObjectInfoPage(),
    );
  }
}

class ObjectInfoPage extends StatefulWidget {
  ObjectInfoPage({Key? key}) : super(key: key);

  @override
  _ObjectInfoPageState createState() => _ObjectInfoPageState();
}

class _ObjectInfoPageState extends State<ObjectInfoPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _pad = MediaQuery.of(context).padding;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: FlutterFlowTheme.tertiaryColor,
          leading: InkWell(
            onTap: () async {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
              size: 22,
            ),
          ),
          title: Text(
            AppLocalizations.of(context)!.back.capitalize(),
            style: FlutterFlowTheme.subtitleTextDark.copyWith(),
          ),
        ),
      ),
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: SingleChildScrollView(
        child: BlocBuilder<DetailsBloc, DetailsState>(
            buildWhen: (p, c) => p.property != c.property,
            builder: (context, state) {
              if (state.property == null)
                return Container(
                  height: _size.height - 50 - _pad.top,
                  width: _size.width,
                  child: Center(child: CircularProgressIndicator()),
                );
              return Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BlocBuilder<DetailsBloc, DetailsState>(
                      buildWhen: (p, c) => p.property != c.property,
                      builder: (context, state) {
                        return ImagesBoxWidget(
                          list: state.property?.photoIdList ?? [],
                        );
                      }),
                  BlocBuilder<DetailsBloc, DetailsState>(
                      builder: (context, state) {
                    if (state.property == null) return SizedBox.shrink();
                    return MainObjectBoxWidget(property: state.property!);
                    // return Container(child: Center(child: CircularProgressIndicator(),),);
                  }),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 12, 0, 0),
                    child: Text(
                      'ПОХОЖИЕ ОБЪЕКТЫ',
                      style: GoogleFonts.getFont(
                        'Roboto',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: BlocBuilder<DetailsBloc, DetailsState>(
                        buildWhen: (p, c) =>
                            p.sameLoadStatus != c.sameLoadStatus,
                        builder: (context, state) {
                          if (state.sameLoadStatus.isSubmissionInProgress &&
                              state.sameProps.isEmpty)
                            return Container(
                              width: 170,
                              height: 310,
                              child: Row(children: [
                                placeholders.gridItemShimmer,
                                placeholders.gridItemShimmer,
                              ]),
                            );
                          if (state.sameProps.isEmpty)
                            return Container(
                                width: _size.width,
                                height: 150,
                                child: Center(
                                  child: Text('Похожих объектов не найдено'),
                                ));
                          return Container(
                            width: 170,
                            height: 325,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  state.sameLoadStatus.isSubmissionInProgress
                                      ? state.sameProps.length + 1
                                      : state.sameProps.length,
                              itemBuilder: (context, index) {
                                if (index == state.sameProps.length &&
                                    state.sameLoadStatus.isSubmissionInProgress)
                                  return placeholders.gridItemShimmer;
                                if (index == state.sameProps.length - 4)
                                  context
                                      .read<DetailsBloc>()
                                      .add(DetailsLoadSameMore());
                                return InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          duration: Duration(milliseconds: 300),
                                          reverseDuration:
                                              Duration(milliseconds: 300),
                                          child: ObjectInfoPageWidget(
                                              property: state.sameProps[index]),
                                        ),
                                      );
                                    },
                                    child: SmallInfoBoxWidget(
                                        property: state.sameProps[index]));
                              },
                            ),
                          );
                        }),
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.max,
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    //         child: InkWell(
                    //           onTap: () async {
                    //             await Navigator.push(
                    //               context,
                    //               PageTransition(
                    //                 type: PageTransitionType.fade,
                    //                 duration: Duration(milliseconds: 300),
                    //                 reverseDuration: Duration(milliseconds: 300),
                    //                 child: ObjectInfoPageWidgetSample(),
                    //               ),
                    //             );
                    //           },
                    //           child: SmallInfoBoxWidgetSample(),
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
