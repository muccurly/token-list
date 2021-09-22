import '../components/search_result_box_widget.dart';
import '../components/sort_filter_box_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../object_info_page/object_info_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchResultPageWidget extends StatefulWidget {
  SearchResultPageWidget({Key key}) : super(key: key);

  @override
  _SearchResultPageWidgetState createState() => _SearchResultPageWidgetState();
}

class _SearchResultPageWidgetState extends State<SearchResultPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
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
                padding: EdgeInsets.fromLTRB(8, 0, 8, 20),
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
                            padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                            child: Text(
                              'Назад',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
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
                              height: MediaQuery.of(context).size.height * 1,
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
                            padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                            child: Text(
                              'Сортировка',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
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
              padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
              child: Text(
                'СПИСОК',
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  'Roboto',
                  color: FlutterFlowTheme.primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
            Divider(
              thickness: 3,
              color: FlutterFlowTheme.primaryColor,
            ),
            Expanded(
              child: GridView(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 120,
                  childAspectRatio: 1,
                ),
                scrollDirection: Axis.vertical,
                children: [
                  InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
                          child: ObjectInfoPageWidget(),
                        ),
                      );
                    },
                    child: SearchResultBoxWidget(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
