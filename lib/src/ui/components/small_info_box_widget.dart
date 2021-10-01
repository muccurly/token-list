import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jurta_app/src/data/entity/property.dart';
import 'package:jurta_app/src/env_config.dart';
import 'package:jurta_app/src/utils/extensions.dart';
import 'package:jurta_app/src/utils/placeholders.dart' as plc;

import '../flutter_flow/flutter_flow_theme.dart';

class SmallInfoBoxWidget extends StatelessWidget {
  SmallInfoBoxWidget({Key? key, required this.property}) : super(key: key);

  final Property property;

  _buildImages(String item) {
    return CachedNetworkImage(
      imageUrl:
          '${EnvironmentConfig.API_URL_FM}/${EnvironmentConfig.API_VERSION}'
          '/download/$item',
      imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover))),
      placeholder: (context, url) => plc.shimmer,
      errorWidget: (context, url, error) => plc.errorPlaceholder,
    );
  }

  @override
  Widget build(BuildContext context) {
    var complex = property.buildingDTOXpm?.complexName;
    if (complex != null) print(complex);
    var address = property.addressMultiText?.nameRu.splitStreet();
    var st = property.buildingDTOXpm?.streetD?.name.nameRu;
    var hn = property.buildingDTOXpm?.houseNumber;
    // var n = property.buildingDTOXpm?.complex?.name;

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
      child: Container(
        width: 170,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                    width: double.infinity,
                    height: 210,
                    child: property.photoIdList != null
                        ? property.photoIdList!.isNotEmpty
                            ? _buildImages(property.photoIdList!.first)
                            : property.housingPlanImageIdList != null
                                ? property.housingPlanImageIdList!.isNotEmpty
                                    ? _buildImages(
                                        property.housingPlanImageIdList!.first)
                                    : plc.noImagePlc
                                : plc.noImagePlc
                        : plc.noImagePlc)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top:5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    // complex ?? address,
                    complex != null
                        ? complex
                        : address != null
                            ? address
                            : '$st, $hn',
                    maxLines: 2, overflow: TextOverflow.ellipsis,
                    style: FlutterFlowTheme.subtitleTextDark.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
              child: Text(
                '${property.numberOfRooms}-${AppLocalizations.of(context)!.roomI}'
                '   •   ${property.totalArea.toInt()} м²',
                style: FlutterFlowTheme.bodyTextDark.copyWith(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
              child: Text(
                '${property.sellDataDTOXpm.objectPrice.toInt().toString().priceSpace()} \u{3012}',
                style: FlutterFlowTheme.subtitleTextDark.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
