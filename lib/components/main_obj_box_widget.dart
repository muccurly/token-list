import '../components/side_bar_filter_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../object_page/object_page_widget.dart';
import '../search_page/search_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MainObjBoxWidget extends StatefulWidget {
  MainObjBoxWidget({
    Key key,
    this.price,
    this.rooms,
    this.floors,
    this.sqMeters,
    this.city,
    this.district,
    this.street,
    this.house,
    this.agent,
    this.objectImg,
  }) : super(key: key);

  final int price;
  final int rooms;
  final int floors;
  final int sqMeters;
  final String city;
  final String district;
  final String street;
  final String house;
  final String agent;
  final String objectImg;

  @override
  _MainObjBoxWidgetState createState() => _MainObjBoxWidgetState();
}

class _MainObjBoxWidgetState extends State<MainObjBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      child: Stack(
        children: [
          Image.network(
            valueOrDefault<String>(
              widget.objectImg,
              'https://torontolife.com/wp-content/uploads/2019/10/HZIsuuNp.jpg',
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment(-1, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.23,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.dark,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(25),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(25),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(16, 0, 10, 0),
                            child: Image.asset(
                              'assets/images/Jurta-2.png',
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 1,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                      child: InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchPageWidget(),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.search_outlined,
                              color: FlutterFlowTheme.white,
                              size: 24,
                            ),
                            Text(
                              'Поиск',
                              style: FlutterFlowTheme.title3.override(
                                fontFamily: 'Roboto',
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return Container(
                              height: MediaQuery.of(context).size.height * 1,
                              child: SideBarFilterWidget(),
                            );
                          },
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.import_export_outlined,
                            color: FlutterFlowTheme.white,
                            size: 24,
                          ),
                          Text(
                            'Фильтр',
                            style: FlutterFlowTheme.title3.override(
                              fontFamily: 'Roboto',
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 40),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${widget.price.toString()} ₸',
                                  style: FlutterFlowTheme.title1.override(
                                    fontFamily: 'Roboto',
                                    fontSize: 22,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 13, 0, 14),
                                  child: Text(
                                    '${widget.rooms.toString()}-комнатный дом   •   ${widget.floors.toString()} этаж(а)   •   ${widget.sqMeters.toString()} м²',
                                    style: FlutterFlowTheme.title3.override(
                                      fontFamily: 'Roboto',
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Text(
                                  '${widget.city}, ${widget.district}, ${widget.street}, ${widget.house}',
                                  style: FlutterFlowTheme.subtitle1.override(
                                    fontFamily: 'Roboto',
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 35),
                              child: Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.white,
                                  borderRadius: BorderRadius.circular(60),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Icon(
                                  Icons.phone_sharp,
                                  color: FlutterFlowTheme.dark,
                                  size: 24,
                                ),
                              ),
                            ),
                            FaIcon(
                              FontAwesomeIcons.solidShareSquare,
                              color: FlutterFlowTheme.white,
                              size: 32,
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ObjectPageWidget(),
                                    ),
                                  );
                                },
                                text: 'Подробнее',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 48,
                                  color: FlutterFlowTheme.secondaryColor,
                                  textStyle:
                                      FlutterFlowTheme.subtitle2.override(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 24,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
