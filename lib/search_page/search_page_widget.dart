import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../result_page/result_page_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPageWidget extends StatefulWidget {
  SearchPageWidget({Key key}) : super(key: key);

  @override
  _SearchPageWidgetState createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  String dropDownValue1;
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  TextEditingController textController4;
  String dropDownValue2;
  String dropDownValue3;
  String dropDownValue4;
  String dropDownValue5;
  TextEditingController textController5;
  TextEditingController textController6;
  bool switchListTileValue1;
  bool switchListTileValue2;
  bool switchListTileValue3;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int room_1 = 1;
  int room_2 = 1;
  int room_3 = 1;
  int room_4 = 1;
  int room_more_5 = 1;

  int any = 1;
  int studio = 1;
  int isolated_rooms = 1;
  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    textController5 = TextEditingController();
    textController6 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.tertiaryColor,
        iconTheme: IconThemeData(color: FlutterFlowTheme.dark),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 24,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(6, 20, 0, 0),
                child: AutoSizeText(
                  'ТИП НЕДВИЖИМОСТИ',
                  style: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Roboto',
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: FlutterFlowDropDown(
                  options: ['Квартира'].toList(),
                  onChanged: (value) {
                    setState(() => dropDownValue1 = value);
                  },
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  textStyle: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: FlutterFlowTheme.dark,
                    size: 24,
                  ),
                  fillColor: Colors.white,
                  elevation: 2,
                  borderColor: Color(0xFFB5B5B5),
                  borderWidth: 1,
                  borderRadius: 10,
                  margin: EdgeInsets.fromLTRB(30, 19, 8, 19),
                  hidesUnderline: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(6, 16, 0, 12),
                child: AutoSizeText(
                  'КОМНАТНОСТЬ',
                  style: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Roboto',
                    fontSize: 18,
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.92,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
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
                              width: MediaQuery.of(context).size.width * 0.18,
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
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(6, 16, 0, 12),
                child: AutoSizeText(
                  'ДИАПАЗОН ЦЕН, ₸',
                  style: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Roboto',
                    fontSize: 18,
                  ),
                ),
              ),
              Row(
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
              Padding(
                padding: EdgeInsets.fromLTRB(6, 16, 0, 12),
                child: AutoSizeText(
                  'ПЛОЩАДЬ, М2',
                  style: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Roboto',
                    fontSize: 18,
                  ),
                ),
              ),
              Row(
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
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 12),
                child: AutoSizeText(
                  'РАСШИРЕННЫЙ ПОИСК',
                  style: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Roboto',
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FlutterFlowDropDown(
                      options: ['Есильский р-н'].toList(),
                      onChanged: (value) {
                        setState(() => dropDownValue2 = value);
                      },
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      textStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: FlutterFlowTheme.dark,
                        size: 24,
                      ),
                      fillColor: Colors.white,
                      elevation: 2,
                      borderColor: Color(0xFFB5B5B5),
                      borderWidth: 1,
                      borderRadius: 10,
                      margin: EdgeInsets.fromLTRB(30, 19, 8, 19),
                      hidesUnderline: true,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                          child: FlutterFlowDropDown(
                            options: ['Улица'].toList(),
                            onChanged: (value) {
                              setState(() => dropDownValue3 = value);
                            },
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: 60,
                            textStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: FlutterFlowTheme.dark,
                              size: 24,
                            ),
                            fillColor: Colors.white,
                            elevation: 2,
                            borderColor: Color(0xFFB5B5B5),
                            borderWidth: 1,
                            borderRadius: 10,
                            margin: EdgeInsets.fromLTRB(30, 19, 8, 19),
                            hidesUnderline: true,
                          ),
                        ),
                        FlutterFlowDropDown(
                          options: ['Жилой комплекс'].toList(),
                          onChanged: (value) {
                            setState(() => dropDownValue4 = value);
                          },
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: 60,
                          textStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: FlutterFlowTheme.dark,
                            size: 24,
                          ),
                          fillColor: Colors.white,
                          elevation: 2,
                          borderColor: Color(0xFFB5B5B5),
                          borderWidth: 1,
                          borderRadius: 10,
                          margin: EdgeInsets.fromLTRB(30, 19, 8, 19),
                          hidesUnderline: true,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 16, 0, 12),
                      child: AutoSizeText(
                        'ПЛАНИРОВКА',
                        style: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Roboto',
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              any = 0;
                              studio = 1;
                              isolated_rooms = 1;
                            });
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.28,
                              height: 60,
                              decoration: BoxDecoration(
                                color: any == 0
                                    ? FlutterFlowTheme.secondaryColor
                                    : FlutterFlowTheme.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color(0xFFBABABA),
                                ),
                              ),
                              child: Align(
                                alignment: Alignment(0, 0),
                                child: AutoSizeText(
                                  'Любая',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Roboto',
                                    color: any == 0
                                        ? FlutterFlowTheme.white
                                        : FlutterFlowTheme.dark,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              any = 1;
                              studio = 0;
                              isolated_rooms = 1;
                            });
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.28,
                              height: 60,
                              decoration: BoxDecoration(
                                color: studio == 0
                                    ? FlutterFlowTheme.secondaryColor
                                    : FlutterFlowTheme.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color(0xFFBABABA),
                                ),
                              ),
                              child: Align(
                                alignment: Alignment(0, 0),
                                child: AutoSizeText(
                                  'Студия',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Roboto',
                                    color: studio == 0
                                        ? FlutterFlowTheme.white
                                        : FlutterFlowTheme.dark,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              any = 1;
                              studio = 1;
                              isolated_rooms = 0;
                            });
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.28,
                              height: 60,
                              decoration: BoxDecoration(
                                color: isolated_rooms == 0
                                    ? FlutterFlowTheme.secondaryColor
                                    : FlutterFlowTheme.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color(0xFFBABABA),
                                ),
                              ),
                              child: Align(
                                alignment: Alignment(0, 0),
                                child: AutoSizeText(
                                  'Изолированные\nкомнаты',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Roboto',
                                    color: isolated_rooms == 0
                                        ? FlutterFlowTheme.white
                                        : FlutterFlowTheme.dark,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 16, 0, 12),
                      child: AutoSizeText(
                        'СОСТОЯНИЕ НЕДВИЖИМОСТИ',
                        style: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Roboto',
                          fontSize: 18,
                        ),
                      ),
                    ),
                    FlutterFlowDropDown(
                      options: ['Дизайнерский ремонт'].toList(),
                      onChanged: (value) {
                        setState(() => dropDownValue5 = value);
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
                      elevation: 2,
                      borderColor: Color(0xFFB5B5B5),
                      borderWidth: 1,
                      borderRadius: 10,
                      margin: EdgeInsets.fromLTRB(30, 19, 8, 19),
                      hidesUnderline: true,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 16, 0, 12),
                      child: AutoSizeText(
                        'ГОД ПОСТРОЙКИ',
                        style: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Roboto',
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: TextFormField(
                              controller: textController5,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'От',
                                hintStyle: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFFBABABA),
                                  fontSize: 18,
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
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: TextFormField(
                              controller: textController6,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'До',
                                hintStyle: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFFBABABA),
                                  fontSize: 18,
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
                                color: FlutterFlowTheme.dark,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 16, 0, 12),
                      child: AutoSizeText(
                        'ПОКАЗЫВАТЬ ТОЛЬКО',
                        style: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Roboto',
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color(0xFFBABABA),
                          width: 1,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SwitchListTile(
                          value: switchListTileValue1 ??= true,
                          onChanged: (newValue) =>
                              setState(() => switchListTileValue1 = newValue),
                          title: Text(
                            'Есть торг',
                            style: FlutterFlowTheme.bodyText2.override(
                              fontFamily: 'Roboto',
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          activeColor: FlutterFlowTheme.secondaryColor,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xFFBABABA),
                            width: 1,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SwitchListTile(
                            value: switchListTileValue2 ??= true,
                            onChanged: (newValue) =>
                                setState(() => switchListTileValue2 = newValue),
                            title: Text(
                              'Есть обременение',
                              style: FlutterFlowTheme.bodyText2.override(
                                fontFamily: 'Roboto',
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            activeColor: FlutterFlowTheme.secondaryColor,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color(0xFFBABABA),
                          width: 1,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SwitchListTile(
                          value: switchListTileValue3 ??= true,
                          onChanged: (newValue) =>
                              setState(() => switchListTileValue3 = newValue),
                          title: Text(
                            'Обмен',
                            style: FlutterFlowTheme.bodyText2.override(
                              fontFamily: 'Roboto',
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          activeColor: FlutterFlowTheme.secondaryColor,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: 'Сбросить',
                options: FFButtonOptions(
                  width: 653,
                  height: 48,
                  color: FlutterFlowTheme.dark,
                  textStyle: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: 12,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 40),
                child: FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPageWidget(),
                      ),
                    );
                  },
                  text: 'ПОИСК',
                  options: FFButtonOptions(
                    width: 653,
                    height: 48,
                    color: FlutterFlowTheme.secondaryColor,
                    textStyle: FlutterFlowTheme.subtitle2.override(
                      fontFamily: 'Roboto',
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 12,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
