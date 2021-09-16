import '../components/img_carousel_widget.dart';
import '../components/near_object_box_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoreInfoBoxWidget extends StatefulWidget {
  MoreInfoBoxWidget({
    Key key,
    this.description,
    this.ratingDistrict,
    this.ratingHouse,
  }) : super(key: key);

  final String description;
  final int ratingDistrict;
  final int ratingHouse;

  @override
  _MoreInfoBoxWidgetState createState() => _MoreInfoBoxWidgetState();
}

class _MoreInfoBoxWidgetState extends State<MoreInfoBoxWidget> {
  int school = 1;
  int hospital = 1;
  int children_sad = 1;
  int shop_center = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
            child: InkWell(
              onTap: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 1,
                      child: ImgCarouselWidget(),
                    );
                  },
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Посмотреть планировку объекта',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.black,
                        size: 24,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          FFButtonWidget(
            onPressed: () {
              print('Button pressed ...');
            },
            text: 'Позвонить',
            options: FFButtonOptions(
              width: 130,
              height: 60,
              color: FlutterFlowTheme.secondaryColor,
              textStyle: FlutterFlowTheme.subtitle2.override(
                fontFamily: 'Roboto',
                color: Colors.white,
                fontSize: 16,
              ),
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: 12,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 12),
            child: Text(
              'ОПИСАНИЕ',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.primaryColor,
                fontSize: 18,
              ),
            ),
          ),
          Text(
            widget.description,
            style: FlutterFlowTheme.bodyText1.override(
              fontFamily: 'Roboto',
              color: FlutterFlowTheme.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      school = 0;
                      hospital = 1;
                      shop_center = 1;
                      children_sad = 1;
                    });
                  },
                  child: Text(
                    'Школа',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Roboto',
                      color: school == 0
                          ? FlutterFlowTheme.secondaryColor
                          : FlutterFlowTheme.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      school = 1;
                      hospital = 0;
                      shop_center = 1;
                      children_sad = 1;
                    });
                  },
                  child: Text(
                    'Больница',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Roboto',
                      color: hospital == 0
                          ? FlutterFlowTheme.secondaryColor
                          : FlutterFlowTheme.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      school = 1;
                      hospital = 1;
                      shop_center = 1;
                      children_sad = 0;
                    });
                  },
                  child: Text(
                    'Детский сад',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Roboto',
                      color: children_sad == 0
                          ? FlutterFlowTheme.secondaryColor
                          : FlutterFlowTheme.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      school = 1;
                      hospital = 1;
                      shop_center = 0;
                      children_sad = 1;
                    });
                  },
                  child: Text(
                    'ТРЦ',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Roboto',
                      color: shop_center == 0
                          ? FlutterFlowTheme.secondaryColor
                          : FlutterFlowTheme.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NearObjectBoxWidget(
                  type: 'Школа',
                  name: 'Haileybury British school',
                  address: 'ул. Кошкарбаева, д. 20',
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 12),
            child: Text(
              'РЕЙТИНГ ЛОКАЛИЗАЦИИ',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.primaryColor,
                fontSize: 18,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Рейтинг района',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                '${widget.ratingDistrict.toString()}%',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
          Divider(
            color: Color(0xFFBABABA),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Рейтинг ЖК',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                '${widget.ratingHouse.toString()}%',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
