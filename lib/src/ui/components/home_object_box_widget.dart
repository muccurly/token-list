import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jurta_app/src/data/entity/real_property.dart';
import 'package:jurta_app/src/env_config.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_theme.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_util.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_widgets.dart';
import 'package:jurta_app/src/ui/object_info_page/object_info_page_widget.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

class HomeObjectBoxWidget extends StatefulWidget {
  HomeObjectBoxWidget({
    Key? key,
    required this.realProperty,
  }) : super(key: key);

  final RealProperty realProperty;

  @override
  _HomeObjectBoxWidgetState createState() => _HomeObjectBoxWidgetState();
}

class _HomeObjectBoxWidgetState extends State<HomeObjectBoxWidget> {
  //TODO: change colors
  static final _placeholderColor = Colors.blue[300]!;
  final _shimmer = Shimmer.fromColors(
    baseColor: _placeholderColor,
    highlightColor: Colors.blue[100]!,
    child: Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
    ),
  );

  final _errorPlaceholder = Container(
    width: double.infinity,
    height: double.infinity,
    child: Image.asset(
      'assets/images/404.png',
      fit: BoxFit.cover,
      colorBlendMode: BlendMode.multiply,
      color: _placeholderColor,
    ),
  );

  final _noImagePlaceholder = Container(
    width: double.infinity,
    height: double.infinity,
    child: Image.asset(
      'assets/images/no_image.png',
      fit: BoxFit.cover,
      colorBlendMode: BlendMode.multiply,
      color: _placeholderColor,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      width: _size.width,
      height: _size.height,
      child: Stack(
        children: [
          if (widget.realProperty.photoIdList.isNotEmpty)
            CachedNetworkImage(
              imageUrl:
                  '${EnvironmentConfig.API_URL_FM}/${EnvironmentConfig.API_VERSION}/download/${widget.realProperty.photoIdList.first}',
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => _shimmer,
              errorWidget: (context, url, error) => _errorPlaceholder,
            )
          else
            _noImagePlaceholder,
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                                child: Text(
                                  '${widget.realProperty.residentialComplex != null ? '${widget.realProperty.residentialComplex}  ' : ''}'
                                  '${widget.realProperty.objectPrice} \u{3012}',
                                  style: FlutterFlowTheme.titleText.copyWith(),
                                ),
                              ),
                              Text(
                                '${widget.realProperty.numberOfRooms}-комнатный дом    '
                                '${widget.realProperty.floor != null ? '•    ${widget.realProperty.floor} этажа' : ''}'
                                '•   ${widget.realProperty.totalArea} м²',
                                style: FlutterFlowTheme.subtitleText.copyWith(),
                              ),
                              Text(
                                // 'Нур-Султан, Есильский район,  Кошкарбаева 18/2',
                                widget.realProperty.address.nameRu,
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
                            padding: const EdgeInsets.fromLTRB(0, 16, 0, 12),
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
                  padding: const EdgeInsets.fromLTRB(0, 12, 8, 0),
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
                              child: ObjectInfoPageWidget(
                                realProperty: widget.realProperty,
                              ),
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
