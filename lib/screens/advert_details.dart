import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:jurta/screens/screens.dart';
import 'package:jurta/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jurta/utils/utils.dart';
import 'package:line_icons/line_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:intl/date_symbol_data_local.dart';

class AdvertDetailsScreen extends StatefulWidget {
  static const String route = 'advert_details_screen';

  @override
  _AdvertDetailsScreenState createState() => _AdvertDetailsScreenState();
}

class _AdvertDetailsScreenState extends State<AdvertDetailsScreen> {
  final GlobalKey<ScaffoldState> _sKey = GlobalKey<ScaffoldState>();
  final TextEditingController _nameC = TextEditingController();
  final TextEditingController _phoneC = TextEditingController();

  @override
  void dispose() {
    _nameC.dispose();
    _phoneC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final advert =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: _sKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_back_rounded, size: 20),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0, left: 4.0),
                    child: Text(
                      'Назад',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          leading: null,
          titleSpacing: 0,
          centerTitle: false,
        ),
        body: ListView(
          children: [
            /// images carousel
            ImageCarousel(advert: advert),
            const SizedBox(height: 16),

            /// main info
            MainInfoWidget(advert: advert),

            const Divider(
              color: Colors.grey,
              indent: 16,
              endIndent: 16,
              thickness: 0.5,
            ),
            const SizedBox(height: 8),

            /// address and rating
            AddressRatingWidget(advert: advert),
            const SizedBox(height: 16),

            /// info table
            TableWidget(advert: advert),

            /// show more
            ShowMoreWidget(),

            /// watch video review
            // OptionListTile(
            //   text: 'Посмотреть видеообзор',
            //   color: Style.orange,
            //   button: true,
            // ),

            /// show on map
            // OptionListTile(text: 'Показать на карте', color: Colors.white),

            /// object plan
            OptionListTile(text: 'Посмотреть планировку объекта'),

            /// 3d tour
            // OptionListTile(text: 'Посмотреть 3D тур'),
            const SizedBox(height: 16),

            /// call buttons
            CallBookButtonsWidget(
                advert: advert,
                nameTextController: _nameC,
                phoneTextController: _phoneC),
            const SizedBox(height: 16),

            /// description
            HeaderTextWidget(text: 'ОПИСАНИЕ'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(advert['description']),
            ),
            const SizedBox(height: 16),

            /// tabs: school, hospital, kindergarten, mall
            ObjectsAroundTabsWidget(advert: advert),

            /// ratings
            HeaderTextWidget(text: 'РЕЙТИНГ ЛОКАЛИЗАЦИИ'),
            const SizedBox(height: 8),
            RatingsWidget(advert: advert),
            const SizedBox(height: 16),

            /// show comments button
            ShowCommentsButtonWidget(scaffoldKey: _sKey, advert: advert),
            const SizedBox(height: 16),

            /// credit calculator
            HeaderTextWidget(text: 'КРЕДИТНЫЙ КАЛЬКУЛЯТОР (ИПОТЕКА)'),
            const SizedBox(height: 8),
            CreditCalculatorWidget(),
            const SizedBox(height: 16),

            /// mortgage
            MortgageWidget(),

            /// trade
            // TradeWidget(),
            // Divider(height: 0, endIndent: 16, indent: 16),

            /// book
            BookWidget(advert: advert),

            /// related objects
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      'ПОХОЖИЕ ОБЪЕКТЫ',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Style.orange,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: const EdgeInsets.fromLTRB(12, 2, 6, 2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Text(
                              '${ADVERTS.length}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: 14,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            OptionalAdvertsListView(
                padding: const EdgeInsets.symmetric(horizontal: 12)),
            // HeaderTextWidget(text: 'ПОХОЖИЕ ОБЪЕКТЫ'),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   mainAxisSize: MainAxisSize.min,
            //   children: ADVERTS.getRange(0, 2).map((ad) {
            //     return AdvertCard(advert: ad, from: 'related');
            //   }).toList(),
            // ),

            const SizedBox(height: 56),
          ],
        ),

        /// back button
        /* floatingActionButton: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
            child: Icon(
              Icons.arrow_back_rounded,
              // color: Colors.white,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop, */
        // bottomSheet: BuyNowBottomSheet(),
        //bottomNavigationBar: BuyNowBottomSheet(),
      ),
    );
  }
}

class BuyNowBottomSheet extends StatelessWidget {
  const BuyNowBottomSheet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Style.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      width: Global.getSize(context).width,
      padding: EdgeInsets.fromLTRB(
          16,
          16,
          16,
          Global.getViewPadding(context).bottom > 0
              ? Global.getViewPadding(context).bottom
              : 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
            height: 3,
            width: 40,
          ),
          const SizedBox(height: 16),
          Text(
            'КУПИТЬ СЕЙЧАС',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class BookWidget extends StatelessWidget {
  final Map<String, dynamic> advert;

  const BookWidget({
    Key key,
    this.advert,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Забронировать объект',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ImageIcon(AssetImage('assets/images/calendar.png'), size: 24),
              const SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Text(
                    'Забронируйте эту квартиру прямо сейчас\nчтобы купить ее БЕЗ КОМИССИИ в 3 шага',
                    style: TextStyle(height: 1.5),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              final res = await showGeneralDialog(
                context: context,
                pageBuilder: (c, _, __) {
                  return LeaveContactsScreen(
                    isPage: 1,
                    advert: advert,
                  );
                },
              );

              if (res != null && res == true) {
                showRequestConfirmationDialog(context);
              }
              // pushNewScreen(context,
              //     screen: LeaveContactsScreen(isPage: 1), withNavBar: false);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(
                'ЗАБРОНИРОВАТЬ ОБЪЕКТ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Style.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }
}

void showRequestConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (c) {
      return AlertDialog(
        content: Container(
          width: Global.getSize(c).width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 250,
                  maxWidth: 250,
                ),
                child: Image.asset(
                  'assets/images/enthusiastic_pana.png',
                  height: Global.getSize(c).width / 2,
                  width: Global.getSize(c).width / 2,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Ваша заявка на бронирование объекта\nпринята. В ближайшее время наши\nменеджеры свяжутся с вами',
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                'Спасибо за обращение!',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Container(
                width: Global.getSize(c).width / 2,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(c),
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Style.orange,
                    elevation: 0,
                    padding: const EdgeInsets.only(top: 2.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        insetPadding: const EdgeInsets.all(16),
      );
    },
  );
}

class TradeWidget extends StatelessWidget {
  const TradeWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Новинка! Онлайн-торг',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageIcon(AssetImage('assets/images/trade.png'), size: 24),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                    'У вас есть возможность спустить цену этого объекта, попробуйте, возможно вам повезет!'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(
                'ПОТОРГОВАТЬСЯ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              side: BorderSide(color: Style.blue, width: 3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }
}

class MortgageWidget extends StatelessWidget {
  const MortgageWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 40, 16, 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Заполните ваши данные и запишитесь\nк нам на консультацию для подбора\nлучшей ипотечной программы',
            style: TextStyle(height: 1.5),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              final res = await showGeneralDialog(
                context: context,
                pageBuilder: (c, _, __) {
                  return MortgageFormScreen();
                },
              );

              if (res != null && res == true) {
                showFormConfirmationDialog(context);
              }
              //  pushNewScreen(context, screen: MortgageFormScreen());
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(
                'ИПОТЕКА ЗА 3 ДНЯ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Style.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }
}

void showFormConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (c) {
      return AlertDialog(
        content: Container(
          width: Global.getSize(c).width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 250,
                  maxWidth: 250,
                ),
                child: Image.asset(
                  'assets/images/trade_success.png',
                  height: Global.getSize(c).width / 2,
                  width: Global.getSize(c).width / 2,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Ваша анкета принята',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Ваш персональный менеджер\nскоро свяжется с вами',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Container(
                width: Global.getSize(c).width / 2,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(c),
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Style.orange,
                    elevation: 0,
                    padding: const EdgeInsets.only(top: 2.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        insetPadding: const EdgeInsets.all(16),
      );
    },
  );
}

class CreditCalculatorWidget extends StatefulWidget {
  @override
  _CreditCalculatorWidgetState createState() => _CreditCalculatorWidgetState();
}

class _CreditCalculatorWidgetState extends State<CreditCalculatorWidget> {
  final TextEditingController _initialFeeC = TextEditingController();
  final TextEditingController _loanTermC = TextEditingController();
  final TextEditingController _avgIncomeMosC = TextEditingController();
  final TextEditingController _rateRemunerationC = TextEditingController();
  final TextEditingController _monthlyPaymentC = TextEditingController();
  String _selectedProgram;

  @override
  void dispose() {
    _initialFeeC.dispose();
    _loanTermC.dispose();
    _avgIncomeMosC.dispose();
    _rateRemunerationC.dispose();
    _monthlyPaymentC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// loan terms
        CreditCalculatorProgram(
          text: 'Программа кредитования:',
          hint: 'Программа кредитования',
          selectedProgram: _selectedProgram,
          onChanged: (option) => setState(() => _selectedProgram = option),
        ),

        /// an initial fee
        CreditCalculatorTile(
          text: 'Первоначальный взнос (тг):',
          hint: '2000000',
          controller: _initialFeeC,
        ),

        /// loan terms
        CreditCalculatorTile(
          text: 'Срок кредитования (лет):',
          hint: '10',
          controller: _loanTermC,
        ),

        /// loan terms
        CreditCalculatorTile(
          text: 'Средний доход в месяц (тг):',
          hint: '450000',
          controller: _avgIncomeMosC,
        ),

        /// rate of remuneration
        CreditCalculatorTile(
          text: 'Ставка вознаграждения (%):',
          hint: '13',
          controller: _rateRemunerationC,
          color: Colors.lightBlueAccent,
        ),

        /// monthly payment
        CreditCalculatorTile(
          text: 'Ежемесячный платеж (тг):',
          hint: '223620',
          controller: _monthlyPaymentC,
          color: Colors.lightBlueAccent,
        ),
      ],
    );
  }
}

class CreditCalculatorProgram extends StatelessWidget {
  final String text;
  final String hint;
  final String selectedProgram;
  final Function(String option) onChanged;

  const CreditCalculatorProgram({
    Key key,
    @required this.text,
    @required this.hint,
    @required this.selectedProgram,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey.shade300),
      ),
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: TextStyle(fontSize: 12)),
          DropdownButton<String>(
            focusColor: Colors.white,
            value: selectedProgram,
            //elevation: 5,
            style: TextStyle(color: Style.orange),
            isDense: true,
            isExpanded: true,
            underline: SizedBox.shrink(),
            iconEnabledColor: Colors.black,
            icon: Icon(LineIcons.angleDown, size: 12, color: Colors.black),
            items:
                CREDIT_PROGRAMS.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value,
                    style: TextStyle(color: Style.orange, fontSize: 14)),
              );
            }).toList(),
            hint: Text(hint,
                style: TextStyle(color: Colors.grey.shade400, fontSize: 14)),
            onChanged: (String value) => onChanged(value),
          ),
        ],
      ),
    );
  }
}

class CreditCalculatorTile extends StatelessWidget {
  final String text;
  final String hint;
  final TextEditingController controller;
  final Color color;

  const CreditCalculatorTile({
    Key key,
    @required this.text,
    @required this.hint,
    @required this.controller,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey.shade300),
      ),
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: TextStyle(fontSize: 12)),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              isDense: true,
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
              contentPadding: EdgeInsets.only(top: 8),
            ),
            style: TextStyle(
                color: color ?? Style.orange,
                fontSize: 14,
                fontWeight: FontWeight.w500),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}

class ShowCommentsButtonWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Map<String, dynamic> advert;

  const ShowCommentsButtonWidget({
    Key key,
    this.advert,
    this.scaffoldKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          // pushNewScreenWithRouteSettings(
          //   context,
          //   screen: AdvertCommentScreen(),
          //   settings: RouteSettings(
          //     name: AdvertCommentScreen.route,
          //     arguments: advert,
          //   ),
          // );
          showCommentsBottomSheet(scaffoldKey, context);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/comments.png',
                width: 23,
                height: 19,
              ),
              Text('  ${COMMENTS.length}',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              Text(
                ' • ',
                style: TextStyle(fontSize: 12),
              ),
              Text('Показать комментарии', style: TextStyle(fontSize: 13)),
            ],
          ),
        ),
      ),
    );
  }
}

class RatingsWidget extends StatelessWidget {
  final Map<String, dynamic> advert;

  const RatingsWidget({Key key, this.advert}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(children: [
        ...advert['ratings'].map((rating) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      rating['name'],
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Text(
                    '${rating['percent']}\%',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Divider(),
            ],
          );
        }).toList(),
      ]),
    );
  }
}

class ObjectsAroundTabsWidget extends StatefulWidget {
  final Map<String, dynamic> advert;

  const ObjectsAroundTabsWidget({Key key, @required this.advert})
      : super(key: key);

  @override
  _ObjectsAroundTabsWidgetState createState() =>
      _ObjectsAroundTabsWidgetState();
}

class _ObjectsAroundTabsWidgetState extends State<ObjectsAroundTabsWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Container(
        height: Global.getSize(context).width / 3,
        // color: Colors.pink,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TabBar(
                tabs: OBJECTS_AROUND_TAB_TITLES.map((title) {
                  return FittedBox(
                      child: Text(title,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500)));
                }).toList(),
                indicatorColor: Style.orange,
                labelColor: Style.orange,
                labelPadding: const EdgeInsets.all(8),
                unselectedLabelColor: Colors.grey.shade700,
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ObjectAroundListView(list: widget.advert['schools']),
                  ObjectAroundListView(list: widget.advert['hospitals']),
                  ObjectAroundListView(list: widget.advert['kindergartens']),
                  ObjectAroundListView(list: widget.advert['malls']),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ObjectAroundListView extends StatelessWidget {
  const ObjectAroundListView({
    Key key,
    @required this.list,
  }) : super(key: key);

  final List<dynamic> list;

  @override
  Widget build(BuildContext context) {
    return list == null || list.isEmpty
        ? Center(
            child: Text('Ничего не найдено'),
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            itemCount: list.length,
            itemBuilder: (c, i) {
              final object = list[i];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            object['name'],
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Text(
                          'рейтинг ${object['rating']} баллов',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            object['address'],
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Text(
                          object['distance'],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
  }
}

class HeaderTextWidget extends StatelessWidget {
  final String text;

  const HeaderTextWidget({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class OptionListTile extends StatelessWidget {
  final String text;
  final Color color;
  final bool button;
  final Function onTap;

  const OptionListTile({
    Key key,
    @required this.text,
    this.color,
    this.button = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: color ?? Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ListTile(
        onTap: onTap,
        title: FittedBox(
          child: Text(
            text,
            style: TextStyle(
              color: button ? Colors.white : null,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          fit: BoxFit.scaleDown,
          alignment: button ? Alignment.center : Alignment.centerLeft,
        ),
        trailing: button
            ? null
            : Icon(
                LineIcons.angleDown,
                size: 14,
                color: Colors.black,
              ),
        dense: true,
      ),
    );
  }
}

class ShowMoreWidget extends StatefulWidget {
  @override
  _ShowMoreWidgetState createState() => _ShowMoreWidgetState();
}

class _ShowMoreWidgetState extends State<ShowMoreWidget> {
  bool _showMore = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _showMore = !_showMore;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Container(
          width: double.infinity,
          child: Row(
            children: [
              Text(
                'Показать больше',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                _showMore ? LineIcons.angleUp : LineIcons.angleDown,
                size: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TableWidget extends StatelessWidget {
  const TableWidget({
    Key key,
    @required this.advert,
  }) : super(key: key);

  final Map<String, dynamic> advert;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
      ),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(children: [
            TableFirstColumnWidget(
                text: 'Количество комнат ..........................'),
            TableSecondColumnWidget(text: advert['rooms']),
          ]),
          TableRow(children: [
            TableFirstColumnWidget(
              text: 'Площадь ..........................................',
            ),
            TableSecondColumnWidget(text: advert['area']),
          ]),
          TableRow(children: [
            TableFirstColumnWidget(
              text: 'Этаж .................................................',
            ),
            TableSecondColumnWidget(text: advert['flat']),
          ]),
          TableRow(children: [
            TableFirstColumnWidget(
              text: 'Состояние ........................................',
            ),
            TableSecondColumnWidget(text: advert['state']),
          ]),
          TableRow(children: [
            TableFirstColumnWidget(
              text: 'Потолки ............................................',
            ),
            TableSecondColumnWidget(text: advert['ceiling']),
          ]),
          TableRow(children: [
            TableFirstColumnWidget(
              text: 'Санузел ............................................',
            ),
            TableSecondColumnWidget(text: advert['bathroom']),
          ]),
          TableRow(children: [
            TableFirstColumnWidget(
              text: 'Паркинг ............................................',
            ),
            TableSecondColumnWidget(text: advert['parking']),
          ]),
          TableRow(children: [
            TableFirstColumnWidget(
              text: 'Год постройки ..................................',
            ),
            TableSecondColumnWidget(text: advert['year']),
          ]),
        ],
        columnWidths: {
          0: FractionColumnWidth(0.65),
          1: FractionColumnWidth(0.35)
        },
      ),
    );
  }
}

class TableSecondColumnWidget extends StatelessWidget {
  const TableSecondColumnWidget({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class TableFirstColumnWidget extends StatelessWidget {
  final String text;

  const TableFirstColumnWidget({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}

class CallBookButtonsWidget extends StatelessWidget {
  final TextEditingController nameTextController;
  final TextEditingController phoneTextController;
  final Map<String, dynamic> advert;

  const CallBookButtonsWidget({
    Key key,
    @required this.advert,
    @required this.nameTextController,
    @required this.phoneTextController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          /// call
          Expanded(
            child: Container(
              height: 35,
              child: ElevatedButton(
                onPressed: () => launchUrl('tel:${advert['phone']}'),
                child: FittedBox(
                  child: Text(
                    'Позвонить',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Style.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  elevation: 0,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),

          /// book
          Expanded(
            child: Container(
              height: 35,
              child: ElevatedButton(
                onPressed: () {
                  showBookDialog(
                      context, nameTextController, phoneTextController);
                  // pushNewScreenWithRouteSettings(
                  //   context,
                  //   screen: BookScreen(),
                  //   settings: RouteSettings(
                  //     name: BookScreen.route,
                  //     arguments: advert,
                  //   ),
                  //   withNavBar: false,
                  // );
                },
                child: FittedBox(
                  child: Text(
                    'Записаться на показ',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Style.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  elevation: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddressRatingWidget extends StatelessWidget {
  const AddressRatingWidget({
    Key key,
    @required this.advert,
  }) : super(key: key);

  final Map<String, dynamic> advert;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 5,
            child: Text(
              advert['address'],
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Flexible(
              flex: 1,
              child: SizedBox(
                width: 10,
              )),
          Flexible(
            flex: 3,
            child: Text(
              advert['adverts_type'],
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Style.orange,
              ),
            ),
          ),

          // RatingBar(
          //   initialRating: advert['rating'].toDouble(),
          //   direction: Axis.horizontal,
          //   allowHalfRating: false,
          //   itemCount: 5,
          //   ratingWidget: RatingWidget(
          //     full: Icon(
          //       LineIcons.starAlt,
          //       color: Style.orange,
          //     ),
          //     half: Icon(
          //       LineIcons.starAlt,
          //       color: Style.orange,
          //     ),
          //     empty: Icon(LineIcons.star),
          //   ),
          //   onRatingUpdate: (rating) {
          //     log(rating);
          //   },
          //   itemSize: 16,
          //   ignoreGestures: true,
          // ),
        ],
      ),
    );
  }
}

class MainInfoWidget extends StatefulWidget {
  final Map<String, dynamic> advert;

  const MainInfoWidget({Key key, this.advert}) : super(key: key);

  @override
  _MainInfoWidgetState createState() => _MainInfoWidgetState();
}

class _MainInfoWidgetState extends State<MainInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// info
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    text: '${widget.advert['title']}, ',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: 'HelveticaNeueCyr',
                    ),
                    children: [
                      TextSpan(
                        text: '${widget.advert['price']}',
                        style: TextStyle(
                          color: Style.orange,
                        ),
                      ),
                      TextSpan(
                        text: ' ₸',
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Montserrat'),
                      ),
                    ],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  '${widget.advert['rooms']}-комнатная квартира‧${widget.advert['flat']}‧${widget.advert['area']}',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),

        /// like and share
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// like
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.advert['is_fav'] = !widget.advert['is_fav'];

                        // TODO: check on backend for the previous like status
                        if (widget.advert['is_fav'])
                          widget.advert['like_count']++;
                      });
                    },
                    child: widget.advert['is_fav']
                        ? ImageIcon(AssetImage('assets/images/like_red.png'),
                            size: 21, color: Color.fromRGBO(220, 79, 94, 1.0))
                        : ImageIcon(
                            AssetImage('assets/images/like_bl.png'),
                            size: 21,
                          )),
                const SizedBox(height: 5),
                Text('${widget.advert['like_count']}'),
              ],
            ),

            const SizedBox(width: 4),

            /// share
            Container(
              padding: const EdgeInsets.only(right: 16, left: 4),
              child: GestureDetector(
                onTap: () => share("Check it out!", subject: "Jurta"),
                child: ImageIcon(
                  AssetImage('assets/images/share.png'),
                  size: 20,
                ),
                behavior: HitTestBehavior.opaque,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({
    Key key,
    @required this.advert,
    this.height,
  }) : super(key: key);

  final Map<String, dynamic> advert;
  final double height;

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final controller = PageController(viewportFraction: 1);
  int _currentIndex = 1;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? Global.getSize(context).width / 1.5,
      width: double.infinity,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: ListView(
              controller: controller,
              children: [
                ...widget.advert['images'].map(
                  (String imageUrl) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 2),
                      height:
                          widget.height ?? Global.getSize(context).width / 3,
                      child: GestureDetector(
                        onTap: () => viewImage(
                          context,
                          widget.advert['images'].indexOf(imageUrl),
                          widget.advert['images'],
                        ),
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ).toList(),
              ],
            ),
          ),
          SizedBox(
            width: 2,
          ),
          Flexible(
            flex: 1,
            child: PageView(
              controller: controller,
              onPageChanged: (i) {
                setState(() {
                  _currentIndex = i + 1;
                });
              },
              children: [
                ...widget.advert['images'].map(
                  (String imageUrl) {
                    return GestureDetector(
                      onTap: () => viewImage(
                        context,
                        widget.advert['images'].indexOf(imageUrl),
                        widget.advert['images'],
                      ),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ).toList(),
              ],
            ),
          ),
          // /// SMOOTH PAGE INDICATOR
          // Positioned(
          //   bottom: 8,
          //   left: 0,
          //   right: 0,
          //   child: Center(
          //     child: SmoothPageIndicator(
          //       controller: controller,
          //       count: widget.advert['images'].length,
          //       effect: WormEffect(
          //         radius: 7,
          //         spacing: 5,
          //         dotColor: Colors.grey.shade300.withOpacity(0.7),
          //         dotHeight: 7,
          //         dotWidth: 7,
          //         strokeWidth: 1,
          //         activeDotColor: Colors.white,
          //       ),
          //     ),
          //   ),
          // ),

          /// page count
          // Positioned(
          //   bottom: 8,
          //   right: 16,
          //   child: Container(
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(4),
          //       color: Style.blue.withOpacity(0.4),
          //     ),
          //     padding: const EdgeInsets.symmetric(
          //       horizontal: 10,
          //       vertical: 4,
          //     ),
          //     child: Padding(
          //       padding: const EdgeInsets.only(top: 2.0),
          //       child: Text(
          //         '$_currentIndex/${widget.advert['images'].length}',
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontSize: 11,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

void viewImage(BuildContext context, int index, List<String> media) {
  // final items = media.map((e) {
  //   if (e != null && e.isNotEmpty) return e;
  // }).toList();
  pushNewScreen(
    context,
    screen: GalleryPhotoViewWrapper(
      galleryItems: media,
      backgroundDecoration: const BoxDecoration(
        color: Colors.black,
      ),
      initialIndex: index,
      scrollDirection: Axis.horizontal,
    ),
    withNavBar: false,
    pageTransitionAnimation: PageTransitionAnimation.fade,
  );
}

class GalleryPhotoViewWrapper extends StatefulWidget {
  GalleryPhotoViewWrapper({
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialIndex,
    @required this.galleryItems,
    this.scrollDirection = Axis.horizontal,
  }) : pageController = PageController(initialPage: initialIndex);

  final LoadingBuilder loadingBuilder;
  final Decoration backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final PageController pageController;
  final List<String> galleryItems;
  final Axis scrollDirection;

  @override
  State<StatefulWidget> createState() {
    return _GalleryPhotoViewWrapperState();
  }
}

class _GalleryPhotoViewWrapperState extends State<GalleryPhotoViewWrapper> {
  int currentIndex;

  @override
  void initState() {
    currentIndex = widget.initialIndex;
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            decoration: widget.backgroundDecoration,
            constraints: BoxConstraints.expand(
              height: MediaQuery.of(context).size.height,
            ),
            child: PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: _buildItem,
              itemCount: widget.galleryItems.length,
              loadingBuilder: widget.loadingBuilder,
              backgroundDecoration: widget.backgroundDecoration,
              pageController: widget.pageController,
              onPageChanged: onPageChanged,
              scrollDirection: widget.scrollDirection,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: Global.getViewPadding(context).bottom > 0
                    ? Global.getViewPadding(context).bottom
                    : 24),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final String item = widget.galleryItems[index];
    return PhotoViewGalleryPageOptions(
      imageProvider: NetworkImage(item),
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained * 0.5,
      maxScale: PhotoViewComputedScale.covered * 3,
      heroAttributes: PhotoViewHeroAttributes(tag: item),
    );
  }
}

Future<void> showBookDialog(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController phoneController) async {
  final res = await showGeneralDialog(
    context: context,
    pageBuilder: (c, _, __) {
      return BookDateTimeSelectWidget();
    },
    barrierColor: Colors.grey.shade100.withOpacity(0.75),
  );

  if (res != null && res is DateTime) {
    /// leave contacts
    await showUploadConfirmNameDialog(context, nameController, phoneController,
        redirectRieltor: false);

    /// show confirmation dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (c) {
        return AlertDialog(
          content: Container(
            width: Global.getSize(c).width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 250,
                    maxWidth: 250,
                  ),
                  child: Image.asset(
                    'assets/images/enthusiastic_pana.png',
                    height: Global.getSize(c).width / 2,
                    width: Global.getSize(c).width / 2,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Для подтверждения времени показа\nв ближайшее время наши менеджеры\nсвяжутся с Вами',
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Text(
                  'Спасибо за обращение!',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Container(
                  width: Global.getSize(c).width / 2,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(c),
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Style.orange,
                      elevation: 0,
                      padding: const EdgeInsets.only(top: 4.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          insetPadding: const EdgeInsets.all(16),
        );
      },
    );

    context.read(hideBottomTabProvider).state = false;
  }
}

class BookDateTimeSelectWidget extends StatefulWidget {
  @override
  _BookDateTimeSelectWidgetState createState() =>
      _BookDateTimeSelectWidgetState();
}

class _BookDateTimeSelectWidgetState extends State<BookDateTimeSelectWidget> {
  DateFormat dateFormat;
  DateFormat timeFormat;

  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  DateTime _selectedDate = DateTime.now();
  DateTime _selectedTime;
  DateTime _startTime = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 9, 0);
  DateTime _endTime = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 20, 30);

  @override
  Widget build(BuildContext context) {
    final diff = _endTime.difference(_startTime);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            behavior: HitTestBehavior.opaque,
            child: Container(
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.all(16),
              // height: Global.getSize(context).width * 1.2,
              constraints: BoxConstraints(
                  maxHeight: Global.getSize(context).width * 1.5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 32, bottom: 16),
                children: [
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        color: Color(0xFF00CABF),
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: DateFormat('d MMMM, yyyy', 'RU')
                              .format(_selectedDate),
                        ),
                        TextSpan(
                          text: '   ∙   ',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Montserrat'),
                        ),
                        TextSpan(
                          text: toBeginningOfSentenceCase(
                              DateFormat('EEEE', 'RU').format(_selectedDate)),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 28),

                  /// next 7 days
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      7,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedDate =
                                DateTime.now().add(Duration(days: index));
                          });
                        },
                        child: Container(
                          decoration: _selectedDate.day ==
                                  DateTime.now().add(Duration(days: index)).day
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Color(0xFF00CABF),
                                )
                              : null,
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              FittedBox(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    DateFormat('dd', 'RU').format(DateTime.now()
                                        .add(Duration(days: index))),
                                    style: TextStyle(
                                      color: _selectedDate.day ==
                                              DateTime.now()
                                                  .add(Duration(days: index))
                                                  .day
                                          ? Colors.white
                                          : null,
                                      fontSize: 14,
                                      fontWeight: _selectedDate.day ==
                                              DateTime.now()
                                                  .add(Duration(days: index))
                                                  .day
                                          ? FontWeight.w700
                                          : FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              FittedBox(
                                child: Text(
                                  DateFormat('EE', 'RU')
                                      .format(DateTime.now()
                                          .add(Duration(days: index)))
                                      .toUpperCase(),
                                  style: TextStyle(
                                    color: _selectedDate.day ==
                                            DateTime.now()
                                                .add(Duration(days: index))
                                                .day
                                        ? Colors.white
                                        : null,
                                    fontSize: 12,
                                    fontWeight: _selectedDate.day ==
                                            DateTime.now()
                                                .add(Duration(days: index))
                                                .day
                                        ? FontWeight.w700
                                        : FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  /// times
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8,
                    children: List.generate(
                      (diff.inMinutes / 30 + 1).toInt(),
                      (index) => GestureDetector(
                        onTap: () => setState(() => _selectedTime = DateTime(
                              _selectedDate.year,
                              _selectedDate.month,
                              _selectedDate.day,
                              _startTime
                                  .add(Duration(minutes: index * 30))
                                  .hour,
                              _startTime
                                  .add(Duration(minutes: index * 30))
                                  .minute,
                            )),
                        child: Container(
                          width: Global.getSize(context).width / 7,
                          decoration: _selectedTime ==
                                  DateTime(
                                    _selectedDate.year,
                                    _selectedDate.month,
                                    _selectedDate.day,
                                    _startTime
                                        .add(Duration(minutes: index * 30))
                                        .hour,
                                    _startTime
                                        .add(Duration(minutes: index * 30))
                                        .minute,
                                  )
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Style.orange,
                                )
                              : null,
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                          margin: const EdgeInsets.all(8),
                          child: FittedBox(
                            child: Text(
                              DateFormat('kk:mm').format(_startTime
                                  .add(Duration(minutes: index * 30))),
                              style: TextStyle(
                                color: _selectedTime ==
                                        DateTime(
                                          _selectedDate.year,
                                          _selectedDate.month,
                                          _selectedDate.day,
                                          _startTime
                                              .add(
                                                  Duration(minutes: index * 30))
                                              .hour,
                                          _startTime
                                              .add(
                                                  Duration(minutes: index * 30))
                                              .minute,
                                        )
                                    ? Colors.white
                                    : null,
                                fontSize: 12,
                                fontWeight: _selectedTime ==
                                        DateTime(
                                          _selectedDate.year,
                                          _selectedDate.month,
                                          _selectedDate.day,
                                          _startTime
                                              .add(
                                                  Duration(minutes: index * 30))
                                              .hour,
                                          _startTime
                                              .add(
                                                  Duration(minutes: index * 30))
                                              .minute,
                                        )
                                    ? FontWeight.w700
                                    : FontWeight.w400,
                              ),
                            ),
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// book button
                  Container(
                    height: 46,
                    width: double.infinity,
                    margin: const EdgeInsets.all(16),
                    child: ElevatedButton(
                      onPressed: _selectedDate == null || _selectedTime == null
                          ? null
                          : () {
                              Navigator.pop(context, _selectedTime);
                            },
                      child: Text(
                        'ЗАБРОНИРОВАТЬ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Style.orange,
                        elevation: 0,
                        padding: const EdgeInsets.only(top: 12, bottom: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showBookConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (c) {
      return AlertDialog(
        content: Container(
          width: Global.getSize(c).width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 250,
                  maxWidth: 250,
                ),
                child: Image.asset(
                  'assets/images/enthusiastic_pana.png',
                  height: Global.getSize(c).width / 2,
                  width: Global.getSize(c).width / 2,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Поздравляем, Вы забронировали объект\nВ ближайшее время наши менеджеры свяжутся с вами\nСпасибо за обращение',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Container(
                width: Global.getSize(c).width / 2,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(c),
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Style.orange,
                    elevation: 0,
                    padding: const EdgeInsets.only(top: 2.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        insetPadding: const EdgeInsets.all(16),
      );
    },
  );
}
