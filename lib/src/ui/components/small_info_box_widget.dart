import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jurta_app/src/data/entity/real_property.dart';
import 'package:jurta_app/src/env_config.dart';
import 'package:jurta_app/src/utils/placeholders.dart' as plc;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../flutter_flow/flutter_flow_theme.dart';

class SmallInfoBoxWidget extends StatelessWidget {
  SmallInfoBoxWidget({Key? key, required this.property}) : super(key: key);

  final RealProperty property;

  String adress = "";
  String adress_main = "";
  String price = "";
  int count = 0;
  int count2 = 0;
  String part1 = '';
  String part2 = "";
  bool used = false;
  bool used2 = false;

  noState() {
    if (used == false && property.address!=null) {
      for (int i = 0; i < property.address!.nameRu.length; i++) {
        if (property.address!.nameRu[i] == ",") {
          count++;
        }

        if (count != 2 && count <= 3) {
          adress = adress + property.address!.nameRu[i];
        }
      }
      if (count == 2) {
        adress = property.address!.nameRu;
      }
      used = true;
    }
  }

  void addRegion() {
    if (used2 == false) {
      for (int i = 0; i < adress.length; i++) {
        if (adress[i] != "," && count2 == 0) {
          part1 = part1 + adress[i];
        }
        if (count2 == 1) {
          part2 = part2 + adress[i];
        }
        if (adress[i] == "," && count2 == 0) {
          count2++;
        }
      }
      adress_main = part1 + ", Район" + part2;
      used2 = true;
    }
  }

  int counter = 0;
  bool used3 = false;

  void Space() {
    String v = property.objectPrice.toString();
    String number = "";
    if (used3 == false) {
      for (int i = 0;
      i < property.objectPrice.toString().length;
      i++) {
        counter++;
        if (counter == 3) {
          counter = 0;
          price = price + v[v.length - 1 - i] + " ";
        } else {
          price = price + v[v.length - 1 - i];
        }
      }
      for (int i = 0; i < price.length; i++) {
        number = number + price[price.length - 1 - i];
      }
      price = number;
      used3 = true;
    }
  }

  @override
  Widget build(BuildContext context) {

    noState();
    addRegion();
    Space();

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
      child: Container(
        width: 170,
        height: 280,
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
                    child: property.photoIdList.isNotEmpty
                        ? CachedNetworkImage(
                            imageUrl:
                                '${EnvironmentConfig.API_URL_FM}/${EnvironmentConfig.API_VERSION}'
                                '/download/${property.photoIdList.first}',
                            imageBuilder: (context, imageProvider) => Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover))),
                            placeholder: (context, url) => plc.shimmer,
                            errorWidget: (context, url, error) =>
                                plc.errorPlaceholder,
                          )
                        : plc.noImagePlc)),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Text(
                property.residentialComplex ?? '',
                style: FlutterFlowTheme.titleTextWDark.copyWith(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
              child: Text(
                '${property.numberOfRooms} ${property.objectTypeId == 1 ? AppLocalizations.of(context)!.roomF : AppLocalizations.of(context)!.roomM}'
                    ' • ${property.totalArea.toInt()} м²',
                style: FlutterFlowTheme.bodyTextDark.copyWith(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
              child: Text(
                '${property.objectPrice} \u{3012}',
                style: FlutterFlowTheme.subtitleTextDark.copyWith(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
