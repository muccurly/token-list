import '../advance_search_page/advance_search_page_widget.dart';
import '../components/small_info_box_widget.dart';
import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../object_info_page/object_info_page_widget.dart';
import '../search_result_page/search_result_page_widget.dart';
import 'package:flutter/material.dart';

class SearchPageWidget extends StatefulWidget {
  SearchPageWidget({Key? key}) : super(key: key);

  @override
  _SearchPageWidgetState createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  String? dropDownValue;
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

  // @override
  // void initState() {
  //   super.initState();
  //   textController1 = TextEditingController();
  //   textController2 = TextEditingController();
  //   textController3 = TextEditingController();
  //   textController4 = TextEditingController();
  // }

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
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.tertiaryColor,
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(8, 50, 0, 0),
                child: InkWell(
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
                          style: FlutterFlowTheme.subtitleTextDark.copyWith(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                    child: Text(
                      'ТИП НЕДВИЖИМОСТИ',
                      style: FlutterFlowTheme.titleTextWDark.copyWith(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: FlutterFlowDropDown(
                      options:
                          ['Квартиры', 'Дома', 'Офисные помещение'].toList(),
                      onChanged: (value) {
                        setState(() => dropDownValue = value);
                      },
                      width: 130,
                      height: 48,
                      textStyle: FlutterFlowTheme.bodyTextDark.copyWith(),
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        size: 15,
                      ),
                      fillColor: Colors.white,
                      elevation: 1,
                      borderColor: Color(0xFFBEBEBE),
                      borderWidth: 1,
                      borderRadius: 8,
                      margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                      hidesUnderline: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                    child: Text(
                      'КОМНАТНОСТЬ',
                      style: FlutterFlowTheme.titleTextWDark.copyWith(),
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
                                    style:
                                        FlutterFlowTheme.btnTextWhite.copyWith(
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
                                    style:
                                        FlutterFlowTheme.btnTextWhite.copyWith(
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
                                    style:
                                        FlutterFlowTheme.btnTextWhite.copyWith(
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
                                    style:
                                        FlutterFlowTheme.btnTextWhite.copyWith(
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
                                    style:
                                        FlutterFlowTheme.btnTextWhite.copyWith(
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
                    padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                    child: Text(
                      'ДИАПАЗОН ЦЕН, ₸',
                      style: FlutterFlowTheme.titleTextWDark.copyWith(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
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
                                hintStyle:
                                    FlutterFlowTheme.hintStyle.copyWith(),
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
                                hintStyle:
                                    FlutterFlowTheme.hintStyle.copyWith(),
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
                    padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                    child: Text(
                      'ПЛОЩАДЬ, М',
                      style: FlutterFlowTheme.titleTextWDark.copyWith(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
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
                                hintStyle:
                                    FlutterFlowTheme.hintStyle.copyWith(),
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
                                hintStyle:
                                    FlutterFlowTheme.hintStyle.copyWith(),
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
                    padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 300),
                            reverseDuration: Duration(milliseconds: 300),
                            child: AdvanceSearchPageWidget(),
                          ),
                        );
                      },
                      child: Text(
                        'РАСШИРЕННЫЙ ПОИСК',
                        style: FlutterFlowTheme.titleTextWDark.copyWith(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'Сбросить',
                          options: FFButtonOptions(
                            width: 170,
                            height: 48,
                            color: FlutterFlowTheme.secondaryColor,
                            textStyle: FlutterFlowTheme.btnTextWhite.copyWith(),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 8,
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 300),
                                reverseDuration: Duration(milliseconds: 300),
                                child: SearchResultPageWidget(),
                              ),
                            );
                          },
                          text: 'ПРИМЕНИТЬ',
                          options: FFButtonOptions(
                            width: 170,
                            height: 48,
                            color: FlutterFlowTheme.primaryColor,
                            textStyle: FlutterFlowTheme.btnTextWhite.copyWith(),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 8,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 12, 0, 8),
              child: Text(
                'ГОРЯЩИЕ',
                style: FlutterFlowTheme.titleTextWDark.copyWith(),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
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
                    child: SmallInfoBoxWidget(),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 12, 0, 8),
              child: Text(
                'НОВЫЕ',
                style: FlutterFlowTheme.titleTextWDark.copyWith(),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [SmallInfoBoxWidget()],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
