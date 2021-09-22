import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jurta_app/src/business_logic/home/home.dart';
import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';
import 'package:jurta_app/src/data/entity/real_property.dart';
import 'package:jurta_app/src/env_config.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_theme.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_util.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_widgets.dart';
import 'package:jurta_app/src/ui/object_info_page/object_info_page_widget.dart';
import 'package:jurta_app/src/utils/my_logger.dart';
import 'package:jurta_app/src/utils/placeholders.dart' as placeholders;
import 'package:share_plus/share_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jurta_app/src/utils/extensions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:formz/formz.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;

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
<<<<<<< HEAD
  final _noImagePlaceholder = Container(
    width: double.infinity,
    height: double.infinity,
    child: Image.asset(
      'assets/images/no_image.png',
      fit: BoxFit.cover,
      colorBlendMode: BlendMode.multiply,
      color: placeholders.placeholderColor,
    ),
  );
=======
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      height: _size.height,
      child: Stack(
        children: [
          if (widget.realProperty.photoIdList.isNotEmpty)
            CarouselSlider(
              options: CarouselOptions(
                  height: _size.height,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: false,
                  viewportFraction: 1.0),
              items: widget.realProperty.photoIdList.map((e) {
                return Builder(
                  builder: (context) {
                    return Container(
                      width: _size.width,
                      height: _size.height,
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
            )
          else
<<<<<<< HEAD
            _noImagePlaceholder,
=======
            placeholders.noImagePlc,
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
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
                              PropertyDetailsWidget(
                                  property: widget.realProperty),
                              Text(
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
                              child: CallButton()),
                          ShareButton(),
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

  final RealProperty realProperty;

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
              realProperty: realProperty,
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
  const ShareButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: AppLocalizations.of(context)!.share.capitalize(),
      child: InkWell(
        onTap: () async {
          await Share.share('https://www.jurta.kz/');
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

class PropertyDetailsWidget extends StatelessWidget {
  const PropertyDetailsWidget({
    Key? key,
    required this.property,
  }) : super(key: key);

  final RealProperty property;

  String _getRoom(BuildContext context, HomeState state) {
    final locale = AppLocalizations.of(context)!.localeName;
    String? name;
    if (state.objectTypes != null) {
      for (DictionaryMultiLangItem item in state.objectTypes!) {
        if (item.id == property.objectTypeId) {
          name = locale == 'ru'
              ? item.name.nameRu.toLowerCase()
              : locale == 'kk'
                  ? item.name.nameKz.toLowerCase()
                  : item.name.nameEn.toLowerCase();
          break;
        }
      }
    }
    switch (locale) {
      case 'ru':
        {
          if (name != null) {
            if (name.endsWith('м'))
              return '${AppLocalizations.of(context)!.roomM.toLowerCase()} дом';
            else if (name.endsWith('е'))
              return '${AppLocalizations.of(context)!.roomI.toLowerCase()} $name';
            else
              return '${AppLocalizations.of(context)!.roomF.toLowerCase()} $name';
          }
          return '${AppLocalizations.of(context)!.roomM.toLowerCase()} $name';
        }
      case 'kk':
        return '${AppLocalizations.of(context)!.roomM.toLowerCase()} $name';
      default:
        return '${AppLocalizations.of(context)!.roomM.toLowerCase()} $name';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            previous.objectTypes != current.objectTypes,
        builder: (context, state) {
          return Text(
            '${property.numberOfRooms}-'
            '${_getRoom(context, state)}  '
            '${property.floor != null ? '•  ${property.floor} этаж  ' : ''}'
            '•  ${property.totalArea} м²',
            style: FlutterFlowTheme.subtitleText.copyWith(),
          );
        });
  }
}
