import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SortFilterBoxWidget extends StatefulWidget {
  SortFilterBoxWidget({Key key}) : super(key: key);

  @override
  _SortFilterBoxWidgetState createState() => _SortFilterBoxWidgetState();
}

class _SortFilterBoxWidgetState extends State<SortFilterBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: Color(0x00FFFFFF),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
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
                            padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                            child: Text(
                              'Сортировать по',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
                            child: InkWell(
                              onTap: () async {
                                Navigator.pop(context);
                              },
                              child: Icon(
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
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'По новизне',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  color: FlutterFlowTheme.dark,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Цена (по убыванию)',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  color: FlutterFlowTheme.dark,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Цена (по возрастанию)',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  color: FlutterFlowTheme.dark,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'По комнатам (по убыванию)',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  color: FlutterFlowTheme.dark,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'По комнатам (по возрастанию)',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  color: FlutterFlowTheme.dark,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'По площади (по убыванию)',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  color: FlutterFlowTheme.dark,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.primaryColor,
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'По площади (по возрастанию)',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  color: FlutterFlowTheme.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
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
