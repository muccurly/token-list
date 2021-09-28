import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:jurta_app/src/business_logic/details/details.dart';
import 'package:jurta_app/src/data/entity/property.dart';
import 'package:jurta_app/src/ui/components/images_box_widget.dart';
import 'package:jurta_app/src/utils/extensions.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;

import '../components/show_more_box_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class MainObjectBoxWidget extends StatefulWidget {
  MainObjectBoxWidget({Key? key, required this.property}) : super(key: key);

  final Property property;

  @override
  _MainObjectBoxWidgetState createState() => _MainObjectBoxWidgetState();
}

class _MainObjectBoxWidgetState extends State<MainObjectBoxWidget> {
  bool isExpanded = false;
  bool isExpandedMore = false;
  Widget _buildTextWidget(String text, String val) {
    return RichText(
      text: TextSpan(
        text: text,
        style: FlutterFlowTheme.bodyTextGrey,
        children: <TextSpan>[
          TextSpan(
              text: val,
              style: FlutterFlowTheme.bodyTextGrey
                  .copyWith(fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String locale = AppLocalizations.of(context)!.localeName;
    var rooms = widget.property.numberOfRooms;
    var apartment = widget.property.objectTypeId == 1
        ? AppLocalizations.of(context)!.roomF
        : AppLocalizations.of(context)!.roomM;
    var floorLimit = widget.property.generalCharacteristicsXpm?.numberOfFloors;
    var fl = widget.property.floor;
    var floor =
        '${widget.property.floor} ${floorLimit != null ? '${AppLocalizations.of(context)!.ofFloors} $floorLimit' : ' ${AppLocalizations.of(context)!.floor}'}';
    var area = '${widget.property.totalArea} м²';
    var houseCond =
        widget.property.generalCharacteristicsXpm?.houseCondition?.nameRu;
    var ceilingHeight =
        widget.property.generalCharacteristicsXpm?.ceilingHeight;
    var bathroom = widget.property.separateBathroom;
    var parkingList =
        widget.property.generalCharacteristicsXpm?.parkingTypeList;
    var year = widget.property.generalCharacteristicsXpm?.yearOfConstruction;

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
                    widget.property.buildingDTOXpm?.complexName != null
                        ? Expanded(
                            flex: 2,
                            child: Text(
                              '${widget.property.buildingDTOXpm?.complexName}',
                              style: FlutterFlowTheme.titleTextWDark.copyWith(),
                            ),
                          )
                        : const SizedBox.shrink(),
                    Expanded(
                      child: Text(
                        '${widget.property.sellDataDTOXpm.objectPrice.toInt().toString().priceSpace()} \u{3012}',
                        style: FlutterFlowTheme.titleTextWDark
                            .copyWith(color: FlutterFlowTheme.primaryColor),
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  await Share.share(
                      'https://jurta.kz/object/${widget.property.sellDataDTOXpm.appId}');
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: FaIcon(
                    FontAwesomeIcons.solidShareSquare,
                    color: FlutterFlowTheme.grey,
                    size: 18,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Text(
              '$rooms-$apartment  ${'${fl != null ? '  •  $floor' : ''}'}  •  $area',
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
                    widget.property.addressMultiText?.nameRu.splitAddress() ??
                        '',
                    style: FlutterFlowTheme.subtitleTextDark.copyWith(),
                  ),
                ),
                Expanded(
                  child: Text(
                    '${widget.property.generalCharacteristicsXpm?.housingClass ?? ''}',
                    textAlign: TextAlign.end,
                    style: FlutterFlowTheme.subtitle2TextDark.copyWith(
                      color: FlutterFlowTheme.primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          widget.property.numberOfRooms != null
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: _buildTextWidget(
                      'Количество комнат ................................. ',
                      widget.property.numberOfRooms.toString()),
                )
              : SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
            child: _buildTextWidget(
                'Площадь .................................................. ',
                '${widget.property.totalArea} м²'),
          ),
          fl != null
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: _buildTextWidget(
                      'Этаж ......................................................... ',
                      '${'$fl ${floorLimit != null ? '${AppLocalizations.of(context)!.ofFloors} $floorLimit' : ''}'}'),
                )
              : const SizedBox.shrink(),
          houseCond != null
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: _buildTextWidget(
                      'Состояние ................................................ ',
                      houseCond),
                )
              : const SizedBox.shrink(),
          ceilingHeight != null
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: _buildTextWidget(
                      'Потолки ................................................... ',
                      ceilingHeight.toString()),
                )
              : const SizedBox.shrink(),
          bathroom != null
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: _buildTextWidget(
                      'Санузел ................................................... ',
                      bathroom ? 'Раздельний' : 'Не раздельный'),
                )
              : const SizedBox.shrink(),
          parkingList != null
              ? parkingList.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                      child: _buildTextWidget(
                          'Паркинг ................................................... ',
                          parkingList.first.nameRu.toLowerCase()
                            ..replaceAll('паркинг', '').capitalize()),
                    )
                  : const SizedBox.shrink()
              : const SizedBox.shrink(),
          year != null
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: _buildTextWidget(
                      'Год постройки .......................................... ',
                      year.toString()),
                )
              : const SizedBox.shrink(),

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: InkWell(
              onTap: () => setState(() => isExpandedMore = !isExpandedMore),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                        isExpandedMore
                            ? Icons.keyboard_arrow_up_outlined
                            : Icons.keyboard_arrow_down_outlined,
                        color: FlutterFlowTheme.dark,
                        size: 18,
                      ),
                    )
                  ],
                ),
              ),
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
                    color: const Color(0xFFDADADA),
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
                                list: widget.property.housingPlanImageIdList ??
                                    []),
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
                  buildWhen: (p, c) => p.callStatus != c.callStatus,
                  builder: (context, state) {
                    if (state.callStatus.isSubmissionInProgress)
                      return Center(child: CircularProgressIndicator());
                    return FFButtonWidget(
                      onPressed: () =>
                          context.read<DetailsBloc>().add(DetailsCall()),
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
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: AnimatedContainer(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 300),
              child: isExpandedMore
                  ? ShowMoreBoxWidget(property: widget.property)
                  : SizedBox.shrink(),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
          //   child: InkWell(
          //     borderRadius: BorderRadius.circular(12),
          //     onTap: () => setState(() {
          //       isExpandedMore = !isExpandedMore;
          //     }),
          //     child: Container(
          //       child: Theme(
          //         data: Theme.of(context)
          //             .copyWith(cardColor: Color(0xFFF3F4F6)),
          //         child: Card(
          //           clipBehavior: Clip.antiAliasWithSaveLayer,
          //           color: Colors.transparent,
          //           elevation: 0,
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(12),
          //           ),
          //           child: ExpansionPanelList(
          //             animationDuration: const Duration(milliseconds: 300),
          //             expansionCallback: (index, value) {
          //               print('$index : $value');
          //               setState(() {
          //                 isExpandedMore = !value;
          //               });
          //             },
          //             children: [
          //               ExpansionPanel(
          //                   headerBuilder: (context, isExpanded) {
          //                     return Padding(
          //                       padding: const EdgeInsets.symmetric(horizontal: 25),
          //                       child: Align(
          //                         alignment: Alignment.centerLeft,
          //                         child: Text(
          //                           'Показать больше',
          //                           style: FlutterFlowTheme.subtitleTextDark
          //                               .copyWith(),
          //                         ),
          //                       ),
          //                     );
          //                   },
          //                   body:ShowMoreBoxWidget(
          //                     property: widget.property,
          //                   ),
          //                   isExpanded: isExpandedMore)
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          //   // child: Row(
          //   //   mainAxisSize: MainAxisSize.max,
          //   //   children: [
          //   //     Text(
          //   //       'Показать больше',
          //   //       textAlign: TextAlign.start,
          //   //       style: FlutterFlowTheme.subtitleTextDark.copyWith(),
          //   //     ),
          //   //     Padding(
          //   //       padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          //   //       child: Icon(
          //   //         Icons.keyboard_arrow_down_outlined,
          //   //         color: FlutterFlowTheme.dark,
          //   //         size: 18,
          //   //       ),
          //   //     )
          //   //   ],
          //   // ),
          // ),
        ],
      ),
    );
  }
}
