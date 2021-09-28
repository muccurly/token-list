import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:jurta_app/src/business_logic/home/home.dart';
import 'package:jurta_app/src/data/entity/property.dart';
import 'package:jurta_app/src/env_config.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_theme.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_util.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_widgets.dart';
import 'package:jurta_app/src/ui/object_info_page/object_info_page_widget.dart';
import 'package:jurta_app/src/utils/extensions.dart';
import 'package:jurta_app/src/utils/my_logger.dart';
import 'package:jurta_app/src/utils/placeholders.dart' as placeholders;
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;

class HomeObjectBoxWidget extends StatefulWidget {
  HomeObjectBoxWidget({
    Key? key,
    required this.realProperty,
  }) : super(key: key);

  final Property realProperty;

  @override
  _HomeObjectBoxWidgetState createState() => _HomeObjectBoxWidgetState();
}

class _HomeObjectBoxWidgetState extends State<HomeObjectBoxWidget> {

  // int count = 0;
  // int count2 = 0;
  // String part1 = '';
  // String part2 = "";
  // bool used = false;
  // bool used2 = false;
  //
  // noState() {
  //   if (used == false && widget.realProperty.address!=null) {
  //     for (int i = 0; i < widget.realProperty.address!.nameRu.length; i++) {
  //       if (widget.realProperty.address!.nameRu[i] == ",") {
  //         count++;
  //       }
  //
  //       if (count != 2 && count <= 3) {
  //         adress = adress + widget.realProperty.address!.nameRu[i];
  //       }
  //     }
  //     if (count == 2) {
  //       adress = widget.realProperty.address!.nameRu;
  //     }
  //     used = true;
  //   }
  // }
  //
  // void addRegion() {
  //   if (used2 == false) {
  //     for (int i = 0; i < adress.length; i++) {
  //       if (adress[i] != "," && count2 == 0) {
  //         part1 = part1 + adress[i];
  //       }
  //       if (count2 == 1) {
  //         part2 = part2 + adress[i];
  //       }
  //       if (adress[i] == "," && count2 == 0) {
  //         count2++;
  //       }
  //     }
  //     adress_main = "Район" + part2;
  //     used2 = true;
  //   }
  // }
  //

  // String space(String p) {
  //   String number = "";
  //   String price = "";
  //   int counter = 0;
  //   bool used3 = false;
  //   if (used3 == false) {
  //     for (int i = 0; i < p.length; i++) {
  //       counter++;
  //       if (counter == 3) {
  //         counter = 0;
  //         price = price + p[p.length - 1 - i] + " ";
  //       } else {
  //         price = price + p[p.length - 1 - i];
  //       }
  //     }
  //     for (int i = 0; i < price.length; i++) {
  //       number = number + price[price.length - 1 - i];
  //     }
  //     price = number;
  //     used3 = true;
  //   }
  //   return price;
  // }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      height: _size.height,
      child: Stack(
        children: [
          widget.realProperty.photoIdList != null
              ? widget.realProperty.photoIdList!.isNotEmpty
                  ? CarouselSlider(
                      options: CarouselOptions(
                          height: _size.height,
                          initialPage: 0,
                          enableInfiniteScroll: false,
                          enlargeCenterPage: false,
                          viewportFraction: 1.0),
                      items: widget.realProperty.photoIdList!.map((e) {
                        return Builder(
                          builder: (context) {
                            return Container(
                              width: _size.width,
                              height: _size.height,
                              child: CachedNetworkImage(
                                imageUrl:
                                    '${EnvironmentConfig.API_URL_FM}/${EnvironmentConfig.API_VERSION}'
                                    '/download/$e',
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
                    )
                  : placeholders.noImagePlc
              : placeholders.noImagePlc,
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
                              Text(
                                '${widget.realProperty.buildingDTOXpm?.complexName ?? ''}',
                                style: FlutterFlowTheme.titleText.copyWith(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Text(
                                  '${widget.realProperty.sellDataDTOXpm.objectPrice.toInt().toString().priceSpace()} \u{3012}',
                                  style: FlutterFlowTheme.titleText.copyWith(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Text(
                                  '${widget.realProperty.numberOfRooms}-'
                                      '${widget.realProperty.objectTypeId == 1 ? AppLocalizations.of(context)!.roomF : AppLocalizations.of(context)!.roomM} '
                                      '${widget.realProperty.floor != null ? '• ${widget.realProperty.floor} этаж ' : ''}'
                                      '• ${widget.realProperty.totalArea.toInt()}м²',
                                  style: FlutterFlowTheme.subtitleText.copyWith(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Text(
                                  widget.realProperty.addressMultiText?.nameRu.splitAddress() ?? '',
                                  style:
                                      FlutterFlowTheme.subtitle2Text.copyWith(),
                                ),
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
                              child: CallButton()),
                          ShareButton(property: widget.realProperty),
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
                      SeeMoreButton(realProperty: widget.realProperty)
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

class SeeMoreButton extends StatelessWidget {
  const SeeMoreButton({
    Key? key,
    required this.realProperty,
  }) : super(key: key);

  final Property realProperty;

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () async {
        await Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 300),
            reverseDuration: Duration(milliseconds: 300),
            child: ObjectInfoPageWidget(
              property: realProperty,
            ),
          ),
        );
      },
      text: AppLocalizations.of(context)!.seeMore.capitalize(),
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
    );
  }
}

class CallButton extends StatelessWidget {
  const CallButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (previous, current) =>
          previous.callStatus != current.callStatus &&
          current.callStatus.isSubmissionSuccess,
      listener: (context, state) {
        MyLogger.instance.log.d('call ${state.phoneNumber}');
        if (state.callStatus.isSubmissionSuccess)
          urlLauncher.launch("tel:${state.phoneNumber}");
      },
      child: Tooltip(
        message: AppLocalizations.of(context)!.call.capitalize(),
        child: BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) =>
              previous.callStatus != current.callStatus,
          builder: (context, state) => IconButton(
            onPressed: () => context.read<HomeBloc>().add(CallPressed()),
            icon: state.callStatus.isSubmissionInProgress
                ? CircularProgressIndicator()
                : Icon(
                    Icons.phone_rounded,
                    color: FlutterFlowTheme.white,
                    size: 28,
                  ),
          ),
        ),
      ),
    );
  }
}

class ShareButton extends StatelessWidget {
  const ShareButton({Key? key, required this.property}) : super(key: key);

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: AppLocalizations.of(context)!.share.capitalize(),
      child: InkWell(
        onTap: () async {
          await Share.share(
              'https://jurta.kz/object/${property.sellDataDTOXpm.appId}');
        },
        child: FaIcon(
          FontAwesomeIcons.shareSquare,
          color: FlutterFlowTheme.white,
          size: 28,
        ),
      ),
    );
  }
}
