import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideBarFilterWidget extends StatefulWidget {
  SideBarFilterWidget({Key key}) : super(key: key);

  @override
  _SideBarFilterWidgetState createState() => _SideBarFilterWidgetState();
}

class _SideBarFilterWidgetState extends State<SideBarFilterWidget> {
  String dropDownValue;
  bool switchListTileValue1;
  bool switchListTileValue2;
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  TextEditingController textController4;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
  }

  int room_1 = 1;
  int room_2 = 1;
  int room_3 = 1;
  int room_4 = 1;
  int room_more_5 = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: Color(0xCD131E34),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 170,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SwitchListTile(
                  value: switchListTileValue1 ??= true,
                  onChanged: (newValue) =>
                      setState(() => switchListTileValue1 = newValue),
                  title: Text(
                    'Горящие',
                    style: FlutterFlowTheme.title3.override(
                      fontFamily: 'Roboto',
                      color: FlutterFlowTheme.dark,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  tileColor: Color(0xFFFAFAFA),
                  activeColor: FlutterFlowTheme.secondaryColor,
                  dense: false,
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Container(
                  width: 170,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SwitchListTile(
                    value: switchListTileValue2 ??= true,
                    onChanged: (newValue) =>
                        setState(() => switchListTileValue2 = newValue),
                    title: Text(
                      'Новые',
                      style: FlutterFlowTheme.title3.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.dark,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    tileColor: Color(0xFFFAFAFA),
                    activeColor: FlutterFlowTheme.secondaryColor,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 16, 0, 0),
            child: Text(
              'ТИП НЕДВИЖИМОСТИ',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
            child: FlutterFlowDropDown(
              options: ['Квартира'].toList(),
              onChanged: (value) {
                setState(() => dropDownValue = value);
              },
              width: MediaQuery.of(context).size.width,
              height: 60,
              textStyle: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Roboto',
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              icon: Icon(
                Icons.keyboard_arrow_down_outlined,
                color: FlutterFlowTheme.dark,
                size: 24,
              ),
              fillColor: Colors.white,
              elevation: 0,
              borderColor: Color(0xFFB5B5B5),
              borderWidth: 1,
              borderRadius: 10,
              margin: EdgeInsets.fromLTRB(30, 19, 8, 19),
              hidesUnderline: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 16, 0, 8),
            child: Text(
              'КОМНАТНОСТЬ',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Color(0xFFF5F5F5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        room_1 = 0;
                        room_2 = 1;
                        room_3 = 1;
                        room_4 = 1;
                        room_more_5 = 1;
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.19,
                      height: 60,
                      decoration: BoxDecoration(
                        color: room_1 == 0
                            ? FlutterFlowTheme.secondaryColor
                            : FlutterFlowTheme.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(0),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment(0, 0),
                        child: Text(
                          '1',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Roboto',
                            color: room_1 == 0
                                ? FlutterFlowTheme.white
                                : FlutterFlowTheme.primaryColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        room_1 = 1;
                        room_2 = 0;
                        room_3 = 1;
                        room_4 = 1;
                        room_more_5 = 1;
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.18,
                      height: 60,
                      decoration: BoxDecoration(
                        color: room_2 == 0
                            ? FlutterFlowTheme.secondaryColor
                            : FlutterFlowTheme.white,
                      ),
                      child: Align(
                        alignment: Alignment(0, 0),
                        child: Text(
                          '2',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Roboto',
                            color: room_2 == 0
                                ? FlutterFlowTheme.white
                                : FlutterFlowTheme.primaryColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        room_1 = 1;
                        room_2 = 1;
                        room_3 = 0;
                        room_4 = 1;
                        room_more_5 = 1;
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.18,
                      height: 60,
                      decoration: BoxDecoration(
                        color: room_3 == 0
                            ? FlutterFlowTheme.secondaryColor
                            : FlutterFlowTheme.white,
                      ),
                      child: Align(
                        alignment: Alignment(0, 0),
                        child: Text(
                          '3',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Roboto',
                            color: room_3 == 0
                                ? FlutterFlowTheme.white
                                : FlutterFlowTheme.primaryColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        room_1 = 1;
                        room_2 = 1;
                        room_3 = 1;
                        room_4 = 0;
                        room_more_5 = 1;
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.18,
                      height: 60,
                      decoration: BoxDecoration(
                        color: room_4 == 0
                            ? FlutterFlowTheme.secondaryColor
                            : FlutterFlowTheme.white,
                      ),
                      child: Align(
                        alignment: Alignment(0, 0),
                        child: Text(
                          '4',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Roboto',
                            color: room_4 == 0
                                ? FlutterFlowTheme.white
                                : FlutterFlowTheme.primaryColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        room_1 = 1;
                        room_2 = 1;
                        room_3 = 1;
                        room_4 = 1;
                        room_more_5 = 0;
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.19,
                      height: 60,
                      decoration: BoxDecoration(
                        color: room_more_5 == 0
                            ? FlutterFlowTheme.secondaryColor
                            : FlutterFlowTheme.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(16),
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment(0, 0),
                        child: Text(
                          '5+',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Roboto',
                            color: room_more_5 == 0
                                ? FlutterFlowTheme.white
                                : FlutterFlowTheme.primaryColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 16, 0, 8),
            child: Text(
              'ДИАПАЗОН ЦЕН, ₸',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: TextFormField(
                      controller: textController1,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'От',
                        hintStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Roboto',
                          color: Color(0xFFBABABA),
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFBABABA),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFBABABA),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: TextFormField(
                      controller: textController2,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'До',
                        hintStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Roboto',
                          color: Color(0xFFBABABA),
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFBABABA),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFBABABA),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 16, 0, 8),
            child: Text(
              'ПЛОЩАДЬ, М',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: TextFormField(
                      controller: textController3,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'От',
                        hintStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Roboto',
                          color: Color(0xFFBABABA),
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFBABABA),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFBABABA),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: TextFormField(
                      controller: textController4,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'До',
                        hintStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Roboto',
                          color: Color(0xFFBABABA),
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFBABABA),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFBABABA),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: FFButtonWidget(
              onPressed: () async {
                Navigator.pop(context);
              },
              text: 'Отмена',
              options: FFButtonOptions(
                width: 130,
                height: 48,
                color: FlutterFlowTheme.tertiaryColor,
                textStyle: FlutterFlowTheme.subtitle2.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.dark,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 8,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: 'ПОКАЗАТЬ',
              options: FFButtonOptions(
                width: 130,
                height: 48,
                color: FlutterFlowTheme.secondaryColor,
                textStyle: FlutterFlowTheme.subtitle2.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
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
