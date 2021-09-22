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
        color: Color(0x00FFFFFF),
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
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            newUp = 0;
                            priceDown = 1;
                            priceUp = 1;
                            roomDown = 1;
                            roomUp = 1;
                            meterDown = 1;
                            meterUp = 1;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: newUp == 0
                                  ? FlutterFlowTheme.primaryColor
                                  : FlutterFlowTheme.white),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'По новизне',
                                  style: newUp == 0
                                      ? FlutterFlowTheme.bodyTextDark.copyWith()
                                      : FlutterFlowTheme.bodyTextWhite,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            newUp = 1;
                            priceDown = 0;
                            priceUp = 1;
                            roomDown = 1;
                            roomUp = 1;
                            meterDown = 1;
                            meterUp = 1;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: priceDown == 0
                                ? FlutterFlowTheme.primaryColor
                                : FlutterFlowTheme.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Цена (по убыванию)',
                                  style: priceDown == 0
                                      ? FlutterFlowTheme.bodyTextDark.copyWith()
                                      : FlutterFlowTheme.bodyTextWhite,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            newUp = 1;
                            priceDown = 1;
                            priceUp = 0;
                            roomDown = 1;
                            roomUp = 1;
                            meterDown = 1;
                            meterUp = 1;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: priceUp == 0
                                ? FlutterFlowTheme.primaryColor
                                : FlutterFlowTheme.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Цена (по возрастанию)',
                                  style: priceUp == 0
                                      ? FlutterFlowTheme.bodyTextDark.copyWith()
                                      : FlutterFlowTheme.bodyTextWhite,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            newUp = 1;
                            priceDown = 1;
                            priceUp = 1;
                            roomDown = 0;
                            roomUp = 1;
                            meterDown = 1;
                            meterUp = 1;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: roomDown == 0
                                ? FlutterFlowTheme.primaryColor
                                : FlutterFlowTheme.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'По комнатам (по убыванию)',
                                  style: roomDown == 0
                                      ? FlutterFlowTheme.bodyTextDark.copyWith()
                                      : FlutterFlowTheme.bodyTextWhite,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            newUp = 1;
                            priceDown = 1;
                            priceUp = 1;
                            roomDown = 1;
                            roomUp = 0;
                            meterDown = 1;
                            meterUp = 1;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: roomUp == 0
                                ? FlutterFlowTheme.primaryColor
                                : FlutterFlowTheme.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'По комнатам (по возрастанию)',
                                  style: roomUp == 0
                                      ? FlutterFlowTheme.bodyTextDark.copyWith()
                                      : FlutterFlowTheme.bodyTextWhite,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            newUp = 1;
                            priceDown = 1;
                            priceUp = 1;
                            roomDown = 1;
                            roomUp = 1;
                            meterDown = 0;
                            meterUp = 1;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: meterDown == 0
                                ? FlutterFlowTheme.primaryColor
                                : FlutterFlowTheme.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'По площади (по убыванию)',
                                  style: meterDown == 0
                                      ? FlutterFlowTheme.bodyTextDark.copyWith()
                                      : FlutterFlowTheme.bodyTextWhite,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            newUp = 1;
                            priceDown = 1;
                            priceUp = 1;
                            roomDown = 1;
                            roomUp = 1;
                            meterDown = 1;
                            meterUp = 0;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: meterUp == 0
                                ? FlutterFlowTheme.primaryColor
                                : FlutterFlowTheme.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'По площади (по возрастанию)',
                                  style: meterUp == 0
                                      ? FlutterFlowTheme.bodyTextDark.copyWith()
                                      : FlutterFlowTheme.bodyTextWhite,
                                ),
                              ],
                            ),
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
