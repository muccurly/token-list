import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jurta_app/src/ui/components/images_box_widget_sample.dart';
import 'package:jurta_app/src/ui/components/main_object_box_widget_sample.dart';

import '../components/small_info_box_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';

class ObjectInfoPageWidgetSample extends StatefulWidget {
  ObjectInfoPageWidgetSample({
    Key? key,
  }) : super(key: key);

  @override
  _ObjectInfoPageWidgetSampleState createState() => _ObjectInfoPageWidgetSampleState();
}

class _ObjectInfoPageWidgetSampleState extends State<ObjectInfoPageWidgetSample> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.tertiaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_back_outlined,
                            color: Colors.black,
                            size: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                            child: Text(
                              'Назад',
                              style:
                                  FlutterFlowTheme.subtitleTextDark.copyWith(),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            ImagesBoxWidgetSample(),
            MainObjectBoxWidgetSample(),
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
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 300),
                              reverseDuration: Duration(milliseconds: 300),
                              child: ObjectInfoPageWidgetSample(),
                            ),
                          );
                        },
                        child: SmallInfoBoxWidget(),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
