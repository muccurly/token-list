<<<<<<< HEAD
import 'package:flutter/material.dart';

import '../flutter_flow/flutter_flow_theme.dart';

class SmallInfoBoxWidget extends StatefulWidget {
  SmallInfoBoxWidget({Key? key}) : super(key: key);

  @override
  _SmallInfoBoxWidgetState createState() => _SmallInfoBoxWidgetState();
}

class _SmallInfoBoxWidgetState extends State<SmallInfoBoxWidget> {
  @override
  Widget build(BuildContext context) {
=======
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

  @override
  Widget build(BuildContext context) {

    var name = property.address.nameRu;
    name = name
        .substring(name.indexOf(',') + 2)
        .replaceAll(', astanaError 502', '');

>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
      child: Container(
        width: 170,
<<<<<<< HEAD
        height: 280,
=======
        height: 380,
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
<<<<<<< HEAD
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://picsum.photos/seed/464/600',
                width: MediaQuery.of(context).size.width,
                height: 210,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Text(
                'ЖК Ботанический',
=======
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                name,
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
                style: FlutterFlowTheme.titleTextWDark.copyWith(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
              child: Text(
<<<<<<< HEAD
                '3 комнатная  •  78 м',
=======
                '${property.numberOfRooms} ${property.realPropertyId == 1 ? AppLocalizations.of(context)!.roomM : AppLocalizations.of(context)!.roomF}'
                    ' • ${property.totalArea.toInt()} м²',
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
                style: FlutterFlowTheme.bodyTextDark.copyWith(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
              child: Text(
<<<<<<< HEAD
                '34 000 000 ₸',
=======
                '${property.objectPrice} \u{3012}',
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
                style: FlutterFlowTheme.subtitleTextDark.copyWith(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
