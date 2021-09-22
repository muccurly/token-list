import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterWidget extends StatefulWidget {
  FilterWidget({Key key}) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
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
                child: Align(
                  alignment: Alignment(0, 0),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SwitchListTile(
                        value: switchListTileValue1 ??= true,
                        onChanged: (newValue) =>
                            setState(() => switchListTileValue1 = newValue),
                        title: Text(
                          'Горящие',
                          style: TextStyle(
                            color: FlutterFlowTheme.secondaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ),
                        ),
                        tileColor: FlutterFlowTheme.white,
                        activeColor: FlutterFlowTheme.primaryColor,
                        dense: true,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment(0, 0),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SwitchListTile(
                        value: switchListTileValue2 ??= true,
                        onChanged: (newValue) =>
                            setState(() => switchListTileValue2 = newValue),
                        title: Text(
                          'Новые',
                          style: TextStyle(
                            color: FlutterFlowTheme.secondaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ),
                        ),
                        tileColor: FlutterFlowTheme.white,
                        activeColor: FlutterFlowTheme.primaryColor,
                        dense: true,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
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
            'ТИП НЕДВИЖИМОСТИ',
            style: GoogleFonts.getFont(
              'Roboto',
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
            textStyle: TextStyle(
              color: FlutterFlowTheme.secondaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
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
            style: GoogleFonts.getFont(
              'Roboto',
              color: FlutterFlowTheme.white,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: FlutterFlowTheme.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: 30,
                  height: 40,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.primaryColor,
                  ),
                  child: Align(
                    alignment: Alignment(0, 0),
                    child: Text(
                      '1',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 30,
                  height: 40,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.white,
                  ),
                  child: Align(
                    alignment: Alignment(0, 0),
                    child: Text(
                      '2',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.secondaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 30,
                  height: 40,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.primaryColor,
                  ),
                  child: Align(
                    alignment: Alignment(0, 0),
                    child: Text(
                      '3',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 30,
                  height: 40,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.primaryColor,
                  ),
                  child: Align(
                    alignment: Alignment(0, 0),
                    child: Text(
                      '4',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 30,
                  height: 40,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.primaryColor,
                  ),
                  child: Align(
                    alignment: Alignment(0, 0),
                    child: Text(
                      '5+',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Roboto',
                      ),
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
            'ДИАПАЗОН ЦЕН, ₸',
            style: GoogleFonts.getFont(
              'Roboto',
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
                      hintStyle: TextStyle(),
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
                    style: TextStyle(
                      color: FlutterFlowTheme.secondaryColor,
                    ),
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
                      hintStyle: TextStyle(),
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
                    style: TextStyle(
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
            style: GoogleFonts.getFont(
              'Roboto',
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
                      hintStyle: TextStyle(),
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
                    style: TextStyle(
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
                      hintStyle: TextStyle(),
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
                    style: TextStyle(
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
            onPressed: () {
              print('Button pressed ...');
            },
            text: 'ОТМЕНА',
            options: FFButtonOptions(
              width: 130,
              height: 48,
              color: FlutterFlowTheme.tertiaryColor,
              textStyle: TextStyle(
                color: FlutterFlowTheme.secondaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
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
              textStyle: TextStyle(
                color: FlutterFlowTheme.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
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
    );
  }
}
