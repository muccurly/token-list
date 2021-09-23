import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jurta_app/src/business_logic/details/details.dart';
import 'package:jurta_app/src/data/entity/application_client_view.dart';
import 'package:jurta_app/src/data/entity/real_property.dart';
import 'package:jurta_app/src/env_config.dart';
import 'package:jurta_app/src/ui/components/images_box_widget.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../components/show_more_box_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:formz/formz.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;

class MainObjectBoxWidget extends StatefulWidget {
  MainObjectBoxWidget({Key? key, required this.apv}) : super(key: key);

  final ApplicationClientView apv;

  @override
  _MainObjectBoxWidgetState createState() => _MainObjectBoxWidgetState();
}

class _MainObjectBoxWidgetState extends State<MainObjectBoxWidget> {
  bool isExpanded = false;

  String adress = "";
  String adress_main = "";
  String price = "";
  int count = 0;
  int count2 = 0;
  String part1 = '';
  String part2 = "";
  bool used = false;
  bool used2 = false;

  // noState() {
  //   if (used == false) {
  //     for (int i = 0; i < widget.apv.realPropertyDTO.buildingDto.addressStreet.address.addressObject.name.nameRu;.address.nameRu.length; i++) {
  //       if (widget.realProperty.address.nameRu[i] == ",") {
  //         count++;
  //       }
  //
  //       if (count != 2 && count <= 3) {
  //         adress = adress + widget.realProperty.address.nameRu[i];
  //       }
  //     }
  //     if (count == 2) {
  //       adress = widget.realProperty.address.nameRu;
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
  //     adress_main = part1 + ", Район" + part2;
  //     used2 = true;
  //   }
  // }
  //
  // int counter = 0;
  // bool used3 = false;
  //
  // void Space() {
  //   String v = widget.realProperty.objectPrice.toString();
  //   String number = "";
  //   if (used3 == false) {
  //     for (int i = 0;
  //     i < widget.realProperty.objectPrice.toString().length;
  //     i++) {
  //       counter++;
  //       if (counter == 3) {
  //         counter = 0;
  //         price = price + v[v.length - 1 - i] + " ";
  //       } else {
  //         price = price + v[v.length - 1 - i];
  //       }
  //     }
  //     for (int i = 0; i < price.length; i++) {
  //       number = number + price[price.length - 1 - i];
  //     }
  //     price = number;
  //     used3 = true;
  //   }
  // }

  _buildAddress() {
    String locale = AppLocalizations.of(context)!.localeName;
    var city = locale == 'ru'
        ? widget.apv.realPropertyDTO.buildingDto.city?.addressObject.name.nameRu
        : locale == 'kk'
            ? widget
                .apv.realPropertyDTO.buildingDto.city?.addressObject.name.nameKz
            : widget.apv.realPropertyDTO.buildingDto.city?.addressObject.name
                .nameEn;
    var district = locale == 'ru'
        ? widget
            .apv.realPropertyDTO.buildingDto.district?.addressObject.name.nameRu
        : locale == 'kk'
            ? widget.apv.realPropertyDTO.buildingDto.district?.addressObject
                .name.nameKz
            : widget.apv.realPropertyDTO.buildingDto.district?.addressObject
                .name.nameEn;
    var street = locale == 'ru'
        ? widget.apv.realPropertyDTO.buildingDto.addressStreet?.address
            .addressObject.name.nameRu
        : locale == 'kk'
            ? widget.apv.realPropertyDTO.buildingDto.addressStreet?.address
                .addressObject.name.nameKz
            : widget.apv.realPropertyDTO.buildingDto.addressStreet?.address
                .addressObject.name.nameEn;
    var number = widget.apv.realPropertyDTO.buildingDto.houseNumber;

    return '${city != null ? '$city, ' : ''}${district != null ? '$district, ' : ''}'
        '${street != null ? '$street, ' : ''}${number != null ? '$number' : ''}';
  }

  @override
  Widget build(BuildContext context) {
    var rooms = widget.apv.realPropertyDTO.numberOfRooms;
    var apartment = widget.apv.objectTypeId == 1
        ? AppLocalizations.of(context)!.roomF
        : AppLocalizations.of(context)!.roomM;
    var floorLimit =widget.apv.realPropertyDTO.generalCharacteristicsDto.numberOfFloors;
    var fl = widget.apv.realPropertyDTO.floor;
    var floor =
        '${widget.apv.realPropertyDTO.floor} ${floorLimit!=null
        ?'${AppLocalizations.of(context)!.ofFloors} $floorLimit':' ${AppLocalizations.of(context)!.floor}'}';
    var area = '${widget.apv.realPropertyDTO.totalArea} м²';
    var houseCond = widget.apv.realPropertyDTO.generalCharacteristicsDto
        .houseCondition?.name.nameRu;
    var ceilingHeight =
        widget.apv.realPropertyDTO.generalCharacteristicsDto.ceilingHeight;
    var bathroom = widget.apv.realPropertyDTO.separateBathroom;
    var parkingList =
        widget.apv.realPropertyDTO.generalCharacteristicsDto.parkingTypeList;
    var year =
        widget.apv.realPropertyDTO.generalCharacteristicsDto.yearOfConstruction;

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        '${widget.apv.realPropertyDTO.buildingDto.addressStreet?.parent?.addressObject.name.nameRu ?? ''}',
                        style: FlutterFlowTheme.titleTextWDark.copyWith(),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${widget.apv.sellDataDto.objectPrice.toInt()} \u{3012}',
                        style: FlutterFlowTheme.titleTextWDark
                            .copyWith(color: FlutterFlowTheme.primaryColor),
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  await Share.share('https://jurta.kz/object/${widget.apv.sellDataDto.applicationId}');
                },
                child: FaIcon(
                  FontAwesomeIcons.solidShareSquare,
                  color: FlutterFlowTheme.grey,
                  size: 18,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Text(
              '$rooms-$apartment  ${'${fl!=null?'  •  $floor':''}'}  •  $area',
              style: FlutterFlowTheme.subtitle2TextDark.copyWith(),
            ),
          ),
          Divider(
            height: 30,
            thickness: 2,
            color: Color(0xFFCBCBCB),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    _buildAddress(),
                    style: FlutterFlowTheme.subtitleTextDark.copyWith(),
                  ),
                ),
                Expanded(
                  child: Text(
                    '${widget.apv.realPropertyDTO.generalCharacteristicsDto.housingClass ?? ''}',
                    textAlign: TextAlign.end,
                    style: FlutterFlowTheme.subtitle2TextDark.copyWith(
                      color: FlutterFlowTheme.primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
            child: Text(
              'Количество комнат .................................${widget.apv.realPropertyDTO.numberOfRooms}',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.bodyTextGrey.copyWith(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
            child: Text(
              'Площадь  .................................................${widget.apv.realPropertyDTO.totalArea} м²',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.bodyTextGrey.copyWith(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
            child: Text(
              'Этаж ........................................................ $floor',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.bodyTextGrey.copyWith(),
            ),
          ),
          houseCond != null
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: Text(
                    'Состояние ................................................$houseCond',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.bodyTextGrey.copyWith(),
                  ),
                )
              : const SizedBox.shrink(),
          ceilingHeight != null
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: Text(
                    'Потолки ...................................................$ceilingHeight',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.bodyTextGrey.copyWith(),
                  ),
                )
              : const SizedBox.shrink(),
          bathroom != null
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: Text(
                    'Санузел ...................................................${bathroom ? 'Раздельний' : 'Не раздельный'}',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.bodyTextGrey.copyWith(),
                  ),
                )
              : const SizedBox.shrink(),
          parkingList != null
              ? parkingList.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                      child: Text(
                        'Паркинг ...................................................${parkingList.first.nameRu}',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.bodyTextGrey.copyWith(),
                      ),
                    )
                  : const SizedBox.shrink()
              : const SizedBox.shrink(),
          year!=null
              ? Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
            child: Text(
              'Год постройки ......................................... $year',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.bodyTextGrey.copyWith(),
            ),
          ) : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Показать больше',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.subtitleTextDark.copyWith(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: FlutterFlowTheme.dark,
                    size: 18,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () => setState(() {
                isExpanded = !isExpanded;
              }),
              child: Container(
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(cardColor: const Color(0xFFF3F4F6)),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Color(0xFFDADADA),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ExpansionPanelList(
                      animationDuration: const Duration(milliseconds: 300),
                      expansionCallback: (index, value) {
                        print('$index : $value');
                        setState(() {
                          isExpanded = !value;
                        });
                      },
                      children: [
                        ExpansionPanel(
                            headerBuilder: (context, isExpanded) {
                              return Center(
                                child: Text(
                                  'Посмотреть планировку объекта',
                                  style: FlutterFlowTheme.subtitleTextDark
                                      .copyWith(),
                                ),
                              );
                            },
                            body: ImagesBoxWidget(
                              list: widget.apv.realPropertyDTO
                                      .housingPlanImageIdList ??
                                  [],
                              id: widget.apv.realPropertyDTO.id,
                            ),
                            isExpanded: isExpanded)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(3, 12, 3, 0),
            child: BlocListener<DetailsBloc, DetailsState>(
              listenWhen: (previous, current) =>
              previous.callStatus != current.callStatus &&
                  current.callStatus.isSubmissionSuccess,
              listener: (context, state) {
                if (state.callStatus.isSubmissionSuccess)
                  urlLauncher.launch("tel:${state.phoneNumber}");
              },
              child: BlocBuilder<DetailsBloc, DetailsState>(
                buildWhen: (p,c)=> p.callStatus!=c.callStatus,
                builder: (context, state) {
                  if(state.callStatus.isSubmissionInProgress)
                    return Center(child: CircularProgressIndicator());
                  return FFButtonWidget(
                    onPressed: () => context.read<DetailsBloc>().add(DetailsCall()),
                    text: 'Позвонить',
                    options: FFButtonOptions(
                      width: 130,
                      height: 35,
                      color: FlutterFlowTheme.primaryColor,
                      textStyle: FlutterFlowTheme.btnTextWhite.copyWith(),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 16,
                    ),
                  );
                }
              ),
            ),
          ),
          ShowMoreBoxWidget(apv: widget.apv,)
        ],
      ),
    );
  }
}
