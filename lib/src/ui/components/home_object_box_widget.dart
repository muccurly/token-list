import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../object_info_page/object_info_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';

class HomeObjectBoxWidget extends StatefulWidget {
  HomeObjectBoxWidget({Key? key}) : super(key: key);

  @override
  _HomeObjectBoxWidgetState createState() => _HomeObjectBoxWidgetState();
}

class _HomeObjectBoxWidgetState extends State<HomeObjectBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/seed/589/600',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 8, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                                child: Text(
                                  'BI Village Deluxe,  290 500 000 ₸',
                                  style: FlutterFlowTheme.titleText.copyWith(),
                                ),
                              ),
                              Text(
                                '4-комнатный дом    •    2 этажа    •   148 м²',
                                style: FlutterFlowTheme.subtitleText.copyWith(),
                              ),
                              Text(
                                'Нур-Султан, Есильский район,  Кошкарбаева 18/2',
                                style:
                                    FlutterFlowTheme.subtitle2Text.copyWith(),
                              )
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 16, 0, 12),
                            child: Icon(
                              Icons.phone_rounded,
                              color: FlutterFlowTheme.white,
                              size: 28,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await Share.share('https://www.jurta.kz/');
                            },
                            child: FaIcon(
                              FontAwesomeIcons.shareSquare,
                              color: FlutterFlowTheme.white,
                              size: 28,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 12, 8, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
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
                        text: 'Подробнее',
                        options: FFButtonOptions(
                          width: 130,
                          height: 30,
                          color: FlutterFlowTheme.primaryColor,
                          textStyle: FlutterFlowTheme.btnTextWhite.copyWith(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 16,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
