import 'package:flutter/material.dart';

import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class FilterWidget extends StatefulWidget {
  FilterWidget({
    Key? key,
    required this.onCancel,
  }) : super(key: key);

  final VoidCallback onCancel;
  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  String? dropDownValue;
  bool? switchListTileValue1;
  bool? switchListTileValue2;
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  TextEditingController textController3 = TextEditingController();
  TextEditingController textController4 = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int room_1 = 1;
  int room_2 = 1;
  int room_3 = 1;
  int room_4 = 1;
  int roomMore5 = 1;

  int any = 1;
  int studio = 1;
  int isolatedRooms = 1;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      width: _size.width * .7,
      height: _size.height,
      // color: Color(0xCD131E34),
      color: const Color.fromRGBO(19, 30, 52, .8),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: SwitchListTile(
                          value: switchListTileValue1 ??= true,
                          onChanged: (newValue) =>
                              setState(() => switchListTileValue1 = newValue),
                          title: Text(
                            'Горящие',
                            style: FlutterFlowTheme.dark50016.copyWith(),
                          ),
                          tileColor: FlutterFlowTheme.white,
                          activeColor: FlutterFlowTheme.primaryColor,
                          dense: true,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                    ),
                  ),
                  // child: Align(
                  //   alignment: Alignment(0, 0),
                  //   child: Padding(
                  //     padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                  //     child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(8),
                  //       child: SwitchListTile(
                  //         value: switchListTileValue1 ??= true,
                  //         onChanged: (newValue) =>
                  //             setState(() => switchListTileValue1 = newValue),
                  //         title: Text(
                  //           'Горящие',
                  //           style: FlutterFlowTheme.dark50016.copyWith(),
                  //         ),
                  //         tileColor: FlutterFlowTheme.white,
                  //         activeColor: FlutterFlowTheme.primaryColor,
                  //         dense: true,
                  //         controlAffinity: ListTileControlAffinity.trailing,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ),
                // Expanded(
                //   child: Align(
                //     alignment: Alignment(0, 0),
                //     child: Padding(
                //       padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                //       child: ClipRRect(
                //         borderRadius: BorderRadius.circular(8),
                //         child: SwitchListTile(
                //           value: switchListTileValue2 ??= true,
                //           onChanged: (newValue) =>
                //               setState(() => switchListTileValue2 = newValue),
                //           title: Text(
                //             'Новые',
                //             style: FlutterFlowTheme.dark50016.copyWith(),
                //           ),
                //           tileColor: FlutterFlowTheme.white,
                //           activeColor: FlutterFlowTheme.primaryColor,
                //           dense: true,
                //           controlAffinity: ListTileControlAffinity.trailing,
                //         ),
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 24, 0, 0),
            child: Text(
              'ТИП НЕДВИЖИМОСТИ',
              style: FlutterFlowTheme.filterTitle.copyWith(
                color: FlutterFlowTheme.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: FlutterFlowDropDown(
              options: ['Квартира'].toList(),
              onChanged: (value) {
                setState(() => dropDownValue = value);
              },
              width: MediaQuery.of(context).size.width,
              height: 40,
              textStyle: FlutterFlowTheme.darkNormal16.copyWith(),
              icon: Icon(
                Icons.keyboard_arrow_down_outlined,
                color: FlutterFlowTheme.secondaryColor,
                size: 24,
              ),
              fillColor: Colors.white,
              elevation: 2,
              borderColor: Colors.transparent,
              borderWidth: 0,
              borderRadius: 0,
              margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
              hidesUnderline: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 24, 0, 0),
            child: Text(
              'ТИП НЕДВИЖИМОСТИ',
              style: FlutterFlowTheme.filterTitle.copyWith(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: FlutterFlowTheme.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          room_1 = 0;
                        });
                      },
                      child: Container(
                        width: 30,
                        height: 40,
                        decoration: BoxDecoration(
                          color: room_1 == 0
                              ? FlutterFlowTheme.primaryColor
                              : FlutterFlowTheme.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(0),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment(0, 0),
                          child: Text(
                            '1',
                            style: FlutterFlowTheme.btnTextWhite.copyWith(
                              color: room_1 == 0
                                  ? FlutterFlowTheme.white
                                  : FlutterFlowTheme.secondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          room_2 = 0;
                        });
                      },
                      child: Container(
                        width: 30,
                        height: 40,
                        decoration: BoxDecoration(
                          color: room_2 == 0
                              ? FlutterFlowTheme.primaryColor
                              : FlutterFlowTheme.white,
                        ),
                        child: Align(
                          alignment: Alignment(0, 0),
                          child: Text(
                            '2',
                            style: FlutterFlowTheme.btnTextWhite.copyWith(
                              color: room_2 == 0
                                  ? FlutterFlowTheme.white
                                  : FlutterFlowTheme.secondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          room_3 = 0;
                        });
                      },
                      child: Container(
                        width: 30,
                        height: 40,
                        decoration: BoxDecoration(
                          color: room_3 == 0
                              ? FlutterFlowTheme.primaryColor
                              : FlutterFlowTheme.white,
                        ),
                        child: Align(
                          alignment: Alignment(0, 0),
                          child: Text(
                            '3',
                            style: FlutterFlowTheme.btnTextWhite.copyWith(
                              color: room_3 == 0
                                  ? FlutterFlowTheme.white
                                  : FlutterFlowTheme.secondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          room_4 = 0;
                        });
                      },
                      child: Container(
                        width: 30,
                        height: 40,
                        decoration: BoxDecoration(
                          color: room_4 == 0
                              ? FlutterFlowTheme.primaryColor
                              : FlutterFlowTheme.white,
                        ),
                        child: Align(
                          alignment: Alignment(0, 0),
                          child: Text(
                            '4',
                            style: FlutterFlowTheme.btnTextWhite.copyWith(
                              color: room_4 == 0
                                  ? FlutterFlowTheme.white
                                  : FlutterFlowTheme.secondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          roomMore5 = 0;
                        });
                      },
                      child: Container(
                        width: 30,
                        height: 40,
                        decoration: BoxDecoration(
                          color: roomMore5 == 0
                              ? FlutterFlowTheme.primaryColor
                              : FlutterFlowTheme.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(8),
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment(0, 0),
                          child: Text(
                            '5+',
                            style: FlutterFlowTheme.btnTextWhite.copyWith(
                              color: roomMore5 == 0
                                  ? FlutterFlowTheme.white
                                  : FlutterFlowTheme.secondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 24, 0, 0),
            child: Text(
              'ДИАПАЗОН ЦЕН, ₸',
              style: FlutterFlowTheme.filterTitle.copyWith(
                color: FlutterFlowTheme.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child: TextFormField(
                      controller: textController1,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'от',
                        hintStyle: FlutterFlowTheme.hintStyle.copyWith(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.white,
                      ),
                      style: FlutterFlowTheme.darkNormal16.copyWith(),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: TextFormField(
                      controller: textController2,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'до',
                        hintStyle: FlutterFlowTheme.hintStyle.copyWith(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.white,
                      ),
                      style: FlutterFlowTheme.darkNormal16.copyWith(
                        color: FlutterFlowTheme.secondaryColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 24, 0, 0),
            child: Text(
              'ПЛОЩАДЬ, М',
              style: FlutterFlowTheme.filterTitle.copyWith(
                color: FlutterFlowTheme.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child: TextFormField(
                      controller: textController3,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'от',
                        hintStyle: FlutterFlowTheme.hintStyle.copyWith(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.white,
                      ),
                      style: FlutterFlowTheme.darkNormal16.copyWith(
                        color: FlutterFlowTheme.secondaryColor,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: TextFormField(
                      controller: textController4,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'до',
                        hintStyle: FlutterFlowTheme.hintStyle.copyWith(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.white,
                      ),
                      style: FlutterFlowTheme.darkNormal16.copyWith(
                        color: FlutterFlowTheme.secondaryColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 20, 8, 0),
            child: FFButtonWidget(
              onPressed: widget.onCancel,
              text: 'ОТМЕНА',
              options: FFButtonOptions(
                width: 130,
                height: 48,
                color: FlutterFlowTheme.secondaryColor,
                textStyle: FlutterFlowTheme.btnTextWhite.copyWith(),
                elevation: 0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 8,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 12, 8, 0),
            child: FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: 'ПОКАЗАТЬ',
              options: FFButtonOptions(
                width: 130,
                height: 48,
                color: FlutterFlowTheme.primaryColor,
                textStyle: FlutterFlowTheme.btnTextWhite.copyWith(),
                elevation: 0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 8,
              ),
            ),
          )
        ],
      ),
    );
  }
}
