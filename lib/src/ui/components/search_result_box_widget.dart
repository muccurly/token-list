import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jurta_app/src/data/entity/property.dart';
import 'package:jurta_app/src/env_config.dart';
import 'package:jurta_app/src/utils/extensions.dart';
import 'package:jurta_app/src/utils/placeholders.dart' as placeholders;

import '../flutter_flow/flutter_flow_theme.dart';

class SearchResultBoxWidget extends StatefulWidget {
  SearchResultBoxWidget({
    Key? key,
    required this.property,
  }) : super(key: key);

  final Property property;

  @override
  _SearchResultBoxWidgetState createState() => _SearchResultBoxWidgetState();
}

class _SearchResultBoxWidgetState extends State<SearchResultBoxWidget> {
  _buildImages(List<String> items) {
    return Container(
      width: 170,
      height: 214,
      child: CarouselSlider(
        options: CarouselOptions(
            height: double.infinity,
            initialPage: 0,
            enableInfiniteScroll: false,
            enlargeCenterPage: false,
            viewportFraction: 1.0),
        items: items.map((e) {
          return Builder(
            builder: (context) {
              return Container(
                width: double.infinity,
                height: double.infinity,
                child: CachedNetworkImage(
                  imageUrl:
                      '${EnvironmentConfig.API_URL_FM}/${EnvironmentConfig.API_VERSION}'
                      '/download/$e',
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => placeholders.shimmer,
                  errorWidget: (context, url, error) =>
                      placeholders.errorPlaceholder,
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  final _noImg = Container(
    height: 210,
    width: double.infinity,
    child: placeholders.noImagePlaceholder,
  );

  @override
  Widget build(BuildContext context) {
    var floor = widget.property.floor;
    var fLimit = widget.property.buildingDTOXpm?.complex?.numberOfFloors;

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Container(
        width: 170,
        height: 280,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: widget.property.photoIdList != null
                  ? widget.property.photoIdList!.isNotEmpty
                      ? _buildImages(widget.property.photoIdList!)
                      : widget.property.housingPlanImageIdList != null
                          ? widget.property.housingPlanImageIdList!.isNotEmpty
                              ? _buildImages(
                                  widget.property.housingPlanImageIdList!)
                              : _noImg
                          : _noImg
                  : _noImg,
            ),
            Padding(
              padding: const EdgeInsets.only(top:4),
              child: Text(
                widget.property.addressMultiText?.nameRu
                        .splitComplexOrStreet() ??
                    '',
                  maxLines: 2, overflow: TextOverflow.ellipsis,
                style: FlutterFlowTheme.subtitleTextDark
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top:1),
              child: Text(
                '${widget.property.numberOfRooms}-${AppLocalizations.of(context)!.roomI} • '
                '${floor != null ? '$floor ${fLimit != null ? '${AppLocalizations.of(context)!.ofFloors} $fLimit' : '${AppLocalizations.of(context)!.floor} • '}' : ''}'
                '${widget.property.totalArea.toInt()} м²',
                style: FlutterFlowTheme.subtitle2TextDark.copyWith(
                  fontSize: 14
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top:1),
              child: Text(
                '${widget.property.sellDataDTOXpm.objectPrice.toInt().toString().priceSpace()} \u{3012}',
                style: FlutterFlowTheme.subtitleTextDark.copyWith(
                    color: FlutterFlowTheme.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
