import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ImgCarouselWidget extends StatefulWidget {
  ImgCarouselWidget({Key key}) : super(key: key);

  @override
  _ImgCarouselWidgetState createState() => _ImgCarouselWidgetState();
}

class _ImgCarouselWidgetState extends State<ImgCarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: Color(0xCD000000),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  child: Stack(
                    alignment: Alignment(0, 0),
                    children: [
                      Align(
                        alignment: Alignment(0, 0),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: 'https://picsum.photos/seed/382/600',
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.4,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              color: FlutterFlowTheme.white,
                              size: 32,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: FlutterFlowTheme.white,
                              size: 32,
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment(0, 0.4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                              child: FaIcon(
                                FontAwesomeIcons.solidCircle,
                                color: FlutterFlowTheme.white,
                                size: 8,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                              child: FaIcon(
                                FontAwesomeIcons.solidCircle,
                                color: Color(0xFFBABABA),
                                size: 8,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                              child: FaIcon(
                                FontAwesomeIcons.solidCircle,
                                color: Color(0xFFBABABA),
                                size: 8,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                              child: FaIcon(
                                FontAwesomeIcons.solidCircle,
                                color: Color(0xFFBABABA),
                                size: 8,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                              child: FaIcon(
                                FontAwesomeIcons.solidCircle,
                                color: Color(0xFFBABABA),
                                size: 8,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                              child: FaIcon(
                                FontAwesomeIcons.solidCircle,
                                color: Color(0xFFBABABA),
                                size: 8,
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
          )
        ],
      ),
    );
  }
}
