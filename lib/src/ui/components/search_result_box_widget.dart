import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jurta_app/src/data/entity/real_property.dart';
import 'package:jurta_app/src/env_config.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import 'package:jurta_app/src/utils/placeholders.dart' as placeholders;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchResultBoxWidget extends StatefulWidget {
  SearchResultBoxWidget({
    Key? key,
    required this.property,
  }) : super(key: key);

  final RealProperty property;

  @override
  _SearchResultBoxWidgetState createState() => _SearchResultBoxWidgetState();
}

class _SearchResultBoxWidgetState extends State<SearchResultBoxWidget> {
  @override
  Widget build(BuildContext context) {
    var name = widget.property.address.nameRu;
    name = name
        .substring(name.indexOf(',') + 2)
        .replaceAll(', astanaError 502', '');

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Container(
        width: 170,
        height: 300,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: widget.property.photoIdList.isNotEmpty
                  ? Container(
                      width: 170,
                      height: 214,
                      child: CarouselSlider(
                        options: CarouselOptions(
                            height: double.infinity,
                            initialPage: 0,
                            enableInfiniteScroll: false,
                            enlargeCenterPage: false,
                            viewportFraction: 1.0),
                        items: widget.property.photoIdList.map((e) {
                          return Builder(
                            builder: (context) {
                              return Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      '${EnvironmentConfig.API_URL_FM}/${EnvironmentConfig.API_VERSION}'
                                      '/download/$e/preview',
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      placeholders.shimmer,
                                  errorWidget: (context, url, error) =>
                                      placeholders.errorPlaceholder,
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    )
                  : Image.network(
                      'https://picsum.photos/seed/464/600',
                      width: MediaQuery.of(context).size.width,
                      height: 210,
                      fit: BoxFit.cover,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
              child: Text(
                name,
                style: FlutterFlowTheme.subtitleTextDark.copyWith(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
              child: Text(
                '${widget.property.numberOfRooms} ${widget.property.realPropertyId == 1 ? AppLocalizations.of(context)!.roomM : AppLocalizations.of(context)!.roomF}'
                ' • ${widget.property.totalArea.toInt()} м²',
                style: FlutterFlowTheme.subtitle2TextDark.copyWith(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
              child: Text(
                '${widget.property.objectPrice} \u{3012}',
                style: FlutterFlowTheme.subtitleTextDark.copyWith(
                  color: FlutterFlowTheme.primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
