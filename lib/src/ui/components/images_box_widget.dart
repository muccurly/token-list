import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jurta_app/src/data/entity/real_property.dart';
import 'package:jurta_app/src/env_config.dart';
import 'package:jurta_app/src/utils/placeholders.dart' as placeholders;

class ImagesBoxWidget extends StatefulWidget {
  ImagesBoxWidget({
    Key? key,
    required this.realProperty,
  }) : super(key: key);

  final RealProperty realProperty;

  @override
  _ImagesBoxWidgetState createState() => _ImagesBoxWidgetState();
}

class _ImagesBoxWidgetState extends State<ImagesBoxWidget> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    _buildImage(String uuid) {
      return CachedNetworkImage(
        imageUrl: '${EnvironmentConfig.API_URL_FM}'
            '/${EnvironmentConfig.API_VERSION}/download'
            '/$uuid',
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => placeholders.shimmer,
        errorWidget: (context, url, error) => placeholders.errorPlaceholder,
      );
    }

    return Container(
      width: _size.width,
      height: 300,
      decoration: BoxDecoration(),
      child: widget.realProperty.photoIdList.isEmpty
          ? placeholders.noImagePlaceholder
          : Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                          child: widget.realProperty.photoIdList.isEmpty
                              ? placeholders.noImagePlaceholder
                              : _buildImage(
                                  widget.realProperty.photoIdList.first))
                    ],
                  ),
                ),
                widget.realProperty.photoIdList.length > 1
                    ? Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                                child:
                                    widget.realProperty.photoIdList.length > 1
                                        ? _buildImage(
                                            widget.realProperty.photoIdList[1])
                                        : placeholders.noImagePlaceholder),
                            widget.realProperty.photoIdList.length > 2
                                ? Expanded(
                                    child: widget.realProperty.photoIdList
                                                .length >
                                            2
                                        ? _buildImage(
                                            widget.realProperty.photoIdList[2])
                                        : placeholders.noImagePlaceholder)
                                : SizedBox.shrink(),
                          ],
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
    );
  }
}
