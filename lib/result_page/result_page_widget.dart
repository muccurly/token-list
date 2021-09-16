import '../components/result_object_box_widget.dart';
import '../components/sorting_screen_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPageWidget extends StatefulWidget {
  ResultPageWidget({Key key}) : super(key: key);

  @override
  _ResultPageWidgetState createState() => _ResultPageWidgetState();
}

class _ResultPageWidgetState extends State<ResultPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 100,
            height: 80,
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 35, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'РЕЗУЛЬТАТ ПОИСКА',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment(1, 0),
                      child: InkWell(
                        onTap: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return SortingScreenWidget();
                            },
                          );
                        },
                        child: Text(
                          'СОРТИРОВКА',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return SortingScreenWidget();
                        },
                      );
                    },
                    child: Icon(
                      Icons.import_export_outlined,
                      color: Colors.black,
                      size: 24,
                    ),
                  )
                ],
              ),
            ),
          ),
          Text(
            'СПИСОК',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.bodyText1.override(
              fontFamily: 'Roboto',
              color: FlutterFlowTheme.secondaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            thickness: 3,
            color: FlutterFlowTheme.secondaryColor,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: GridView(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 200,
                  childAspectRatio: 1,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  ResultObjectBoxWidget(
                    objectImg: 'https://collage.studio/img/24092020/11.jpg',
                    houseName: 'ЖК Весна',
                    rooms: 5,
                    floorAt: 2,
                    floorTotal: 4,
                    sqMeters: '140',
                    price: 6000000,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
