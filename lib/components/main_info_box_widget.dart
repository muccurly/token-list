import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class MainInfoBoxWidget extends StatefulWidget {
  MainInfoBoxWidget({
    Key key,
    this.objectImg1,
    this.objectImg2,
    this.objectImg3,
    this.houseName,
    this.rooms,
    this.floorAt,
    this.floorTotal,
    this.sqMeters,
    this.price,
    this.city,
    this.district,
    this.street,
    this.house,
    this.agent,
    this.classType,
    this.quality,
    this.ceiling,
    this.washroom,
    this.parking,
    this.yearBuilt,
  }) : super(key: key);

  final String objectImg1;
  final String objectImg2;
  final String objectImg3;
  final String houseName;
  final int rooms;
  final int floorAt;
  final int floorTotal;
  final int sqMeters;
  final int price;
  final String city;
  final String district;
  final String street;
  final String house;
  final String agent;
  final String classType;
  final String quality;
  final int ceiling;
  final String washroom;
  final String parking;
  final int yearBuilt;

  @override
  _MainInfoBoxWidgetState createState() => _MainInfoBoxWidgetState();
}

class _MainInfoBoxWidgetState extends State<MainInfoBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 350,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              CachedNetworkImage(
                imageUrl: widget.objectImg1,
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 1,
                fit: BoxFit.cover,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.objectImg2,
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.21,
                    fit: BoxFit.cover,
                  ),
                  CachedNetworkImage(
                    imageUrl: widget.objectImg3,
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.22,
                    fit: BoxFit.cover,
                  )
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 18, 16, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '${widget.houseName}, ${widget.price.toString()} ₸',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.primaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await Share.share('Sharing is caring');
                    },
                    child: FaIcon(
                      FontAwesomeIcons.solidShareSquare,
                      color: FlutterFlowTheme.primaryColor,
                      size: 18,
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 17, 0, 20),
                child: Text(
                  '${widget.rooms.toString()}-комнатная квартира, ${widget.floorAt.toString()} из ${widget.floorTotal.toString()}, ${widget.sqMeters.toString()} м',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Roboto',
                    color: FlutterFlowTheme.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: Color(0xFFBABABA),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${widget.city}, ${widget.district}, ${widget.street}, ${widget.house}',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.primaryColor,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '${widget.classType} Бизнес',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.secondaryColor,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 34, 0, 0),
                child: Text(
                  'Количество комнат ................................ ${widget.rooms.toString()}',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Roboto',
                    color: FlutterFlowTheme.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                child: Text(
                  'Площадь .................................................. ${widget.sqMeters.toString()}',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Roboto',
                    color: FlutterFlowTheme.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Text(
                'Этаж ......................................................... ${widget.floorAt.toString()} из ${widget.floorTotal.toString()}',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Text(
                  'Состояние ............................................... ${widget.quality}',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Roboto',
                    color: FlutterFlowTheme.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                child: Text(
                  'Потолки ................................................... ${widget.ceiling.toString()} м',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Roboto',
                    color: FlutterFlowTheme.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Text(
                'Санузел.................................................... ${widget.washroom}',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                child: Text(
                  'Паркинг ................................................... ${widget.parking}',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Roboto',
                    color: FlutterFlowTheme.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Text(
                'Год постройки ........................................ ${widget.yearBuilt.toString()}',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Показать больше',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.primaryColor,
                        fontSize: 18,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: Colors.black,
                        size: 18,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
