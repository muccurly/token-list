import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jurta/screens/advert_details.dart';
import 'package:jurta/screens/screens.dart';
import 'package:jurta/screens/search_result.dart';
import 'package:jurta/utils/custom_icons_icons.dart';
import 'package:jurta/utils/utils.dart';
import 'package:line_icons/line_icons.dart';

class ProfileAgentScreen extends StatefulWidget {
  @override
  _ProfileAgentScreenState createState() => _ProfileAgentScreenState();
}

class _ProfileAgentScreenState extends State<ProfileAgentScreen> {
  final PageController _pageController = PageController();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  bool _showAllAdverts = true;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// background image
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: Global.getSize(context).width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/profile_bg.png'),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: ListView(
              shrinkWrap: true,
              children: [
                /// avatar
                Stack(
                  children: [
                    Positioned(
                      top: Global.getSize(context).width / 5 + 58,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: Global.getSize(context).width / 5 + 24,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        height: Global.getSize(context).width / 2.5 + 8,
                        width: Global.getSize(context).width / 2.5 + 8,
                        margin: const EdgeInsets.only(top: 50),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://images.unsplash.com/photo-1527585743534-7113e3211270?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=100&q=80'),
                                radius: Global.getSize(context).width / 5,
                              ),
                            ),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 6),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                0, 202, 191, 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            'Сделки: 24',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                /// info
                Container(
                  padding: const EdgeInsets.only(top: 16),
                  color: Colors.white,
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      /// status
                      // Align(
                      //   alignment: Alignment.centerRight,
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       color: Style.blue2,
                      //       borderRadius: BorderRadius.circular(4),
                      //     ),
                      //     padding: const EdgeInsets.symmetric(
                      //         horizontal: 8, vertical: 4),
                      //     margin: EdgeInsets.only(
                      //         right: (Global.getSize(context).width -
                      //                 (Global.getSize(context).width / 2.5)) /
                      //             2,
                      //         bottom: 8),
                      //     child: Text(
                      //       'Эксперт',
                      //       style: TextStyle(
                      //         color: Colors.white,
                      //         fontSize: 11,
                      //         fontWeight: FontWeight.w500,
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      /// full name
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Замзагуль Дюсуп',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(51, 51, 51, 1.0),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text('1 год',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      /// main badge
                      MainBadge(),

                      /// rating
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text(
                      //       'Лидер месяца ',
                      //       style: TextStyle(
                      //         fontSize: 12,
                      //         color: Style.orange,
                      //       ),
                      //     ),
                      //     const SizedBox(width: 16),
                      //     Icon(
                      //       Icons.circle,
                      //       color: Style.orange2,
                      //       size: 5,
                      //     ),
                      //     const SizedBox(width: 16),
                      //     RatingBar(
                      //       initialRating: 5,
                      //       direction: Axis.horizontal,
                      //       allowHalfRating: false,
                      //       itemCount: 5,
                      //       ratingWidget: RatingWidget(
                      //         full: Icon(
                      //           LineIcons.starAlt,
                      //           color: Style.orange,
                      //         ),
                      //         half: Icon(
                      //           LineIcons.starAlt,
                      //           color: Style.orange,
                      //         ),
                      //         empty: Icon(LineIcons.star),
                      //       ),
                      //       onRatingUpdate: (rating) {},
                      //       itemSize: 16,
                      //       ignoreGestures: true,
                      //     ),
                      //     // Stack(
                      //     //   alignment: Alignment.center,
                      //     //   children: [
                      //     //     Align(
                      //     //       alignment: Alignment.center,
                      //     //       child: Image.asset(
                      //     //         'assets/images/bubble_rect.png',
                      //     //         height: 26,
                      //     //         // width: 36,
                      //     //       ),
                      //     //     ),
                      //     //     Align(
                      //     //       alignment: Alignment.center,
                      //     //       child: Padding(
                      //     //         padding: const EdgeInsets.only(bottom: 1),
                      //     //         child: Text(
                      //     //           '4.2',
                      //     //           style: TextStyle(
                      //     //             color: Style.orange,
                      //     //             fontSize: 12,
                      //     //             fontWeight: FontWeight.w700,
                      //     //           ),
                      //     //           textAlign: TextAlign.center,
                      //     //         ),
                      //     //       ),
                      //     //     ),
                      //     //   ],
                      //     // ),
                      //   ],
                      // ),

                      /// phone, location
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 0),
                        child: Row(
                          children: [
                            /// phone
                            Expanded(
                              child: GestureDetector(
                                onTap: () => launchUrl('tel:+77028884580'),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: Style.orange,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    '+7 702 888 45 80',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),

                            /// location
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'г. Нур-Султан',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// statistics
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //         child: Column(
                      //           children: [
                      //             Icon(
                      //               Icons.brightness_1,
                      //               size: 8,
                      //               color: Style.orange,
                      //             ),
                      //             Padding(
                      //               padding: const EdgeInsets.symmetric(
                      //                   vertical: 8.0),
                      //               child: FittedBox(
                      //                 child: Text(
                      //                   'Сделки в этом месяце',
                      //                   style: TextStyle(
                      //                     color: Colors.grey,
                      //                     fontSize: 12,
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //             Text(
                      //               '7',
                      //               style: TextStyle(
                      //                 color: Style.orange,
                      //                 fontSize: 16,
                      //                 fontWeight: FontWeight.w700,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       Container(
                      //         height: 50,
                      //         width: 1,
                      //         color: Colors.grey.shade200,
                      //       ),
                      //       Expanded(
                      //         child: Column(
                      //           children: [
                      //             Icon(
                      //               Icons.brightness_1,
                      //               size: 8,
                      //               color: Style.orange,
                      //             ),
                      //             Padding(
                      //               padding: const EdgeInsets.symmetric(
                      //                   vertical: 8.0),
                      //               child: FittedBox(
                      //                 child: Text(
                      //                   'Сделки за 2020 год',
                      //                   style: TextStyle(
                      //                     color: Colors.grey,
                      //                     fontSize: 12,
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //             Text(
                      //               '34',
                      //               style: TextStyle(
                      //                 color: Style.orange,
                      //                 fontSize: 16,
                      //                 fontWeight: FontWeight.w700,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      /// About me
                      DottedHeaderTextWidget(text: 'О СЕБЕ'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Более 5 лет опыта в сфере купли-продажи недвижимости по всему Казахстану, более 1000 благодарных клиентов и 200 постоянных клиентов. Специализируюсь на продажах многокомнатных квартир и домов элит класса',
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(height: 0),

                      /// Professionalism
                      DottedHeaderTextWidget(
                        text: 'ПРОФЕССИОНАЛИЗМ',
                        tailWidget: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            HeaderStars(rating: 5),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: CounterBadge(
                                  iconAssetPath:
                                      'assets/images/rate_agent_icon/day_deal.png',
                                  badgeName: 'Сделка\nза день',
                                  count: 12),
                            ),
                            Expanded(
                              child: CounterBadge(
                                  iconAssetPath:
                                      'assets/images/rate_agent_icon/communication_master.png',
                                  badgeName: 'Мастер\nпереговоров',
                                  count: 3),
                            ),
                            Expanded(
                              child: CounterBadge(
                                  iconAssetPath:
                                      'assets/images/rate_agent_icon/best_rookie.png',
                                  badgeName: 'Лучший\nновичок',
                                  count: 1),
                            ),
                            Expanded(
                              child: CounterBadge(
                                  iconAssetPath:
                                      'assets/images/rate_agent_icon/professional_costume.png',
                                  badgeName: 'Костюм\nпрофессионала',
                                  count: 9),
                            ),
                          ],
                        ),
                      ),

                      DottedHeaderTextWidget(
                        text: 'ОЦЕНКА КЛИЕНТОВ',
                        tailWidget: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            HeaderStars(rating: 5),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: CounterBadge(
                                  iconAssetPath:
                                      'assets/images/rate_agent_icon/polezn_podborki.png',
                                  badgeName: 'Полезные\nподборки',
                                  count: 32),
                            ),
                            Expanded(
                              child: CounterBadge(
                                  iconAssetPath:
                                      'assets/images/rate_agent_icon/vigod_prodazha.png',
                                  badgeName: 'Выгодная\nпродажа',
                                  count: 45),
                            ),
                            Expanded(
                              child: CounterBadge(
                                  iconAssetPath:
                                      'assets/images/rate_agent_icon/friendly_expert.png',
                                  badgeName: 'Дружелюбный\nэксперт',
                                  count: 52),
                            ),
                            Expanded(
                              child: CounterBadge(
                                  iconAssetPath:
                                      'assets/images/rate_agent_icon/ideal.png',
                                  badgeName: 'Идеальное\nсопровождение',
                                  count: 40),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(height: 0),

                      // /// birthday
                      // Container(
                      //   width: double.infinity,
                      //   decoration: BoxDecoration(
                      //     color: Colors.grey.shade100,
                      //     borderRadius: BorderRadius.circular(4),
                      //   ),
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 36, vertical: 16),
                      //   margin: const EdgeInsets.symmetric(horizontal: 16),
                      //   child: RichText(
                      //     text: TextSpan(
                      //       text: 'Дата рождения: ',
                      //       style: TextStyle(
                      //         color: Colors.black54,
                      //         fontFamily: 'HelveticaNeueCyr',
                      //         fontSize: 12,
                      //         fontWeight: FontWeight.w400,
                      //       ),
                      //       children: [
                      //         TextSpan(
                      //           text:
                      //               '${DateFormat('dd.MM.yyyy').format(DateTime(1994, 8, 6))}',
                      //           style: TextStyle(
                      //             color: Colors.black87,
                      //             fontWeight: FontWeight.w500,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),

                      // /// email
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
                      //   child: Container(
                      //     width: double.infinity,
                      //     decoration: BoxDecoration(
                      //       color: Colors.grey.shade100,
                      //       borderRadius: BorderRadius.circular(4),
                      //     ),
                      //     padding: const EdgeInsets.symmetric(
                      //         horizontal: 36, vertical: 16),
                      //     margin: const EdgeInsets.symmetric(horizontal: 16),
                      //     child: RichText(
                      //       text: TextSpan(
                      //         text: 'Email: ',
                      //         style: TextStyle(
                      //           color: Colors.black54,
                      //           fontFamily: 'HelveticaNeueCyr',
                      //           fontSize: 12,
                      //           fontWeight: FontWeight.w400,
                      //         ),
                      //         children: [
                      //           TextSpan(
                      //             text: 'zamzagul@gmail.com',
                      //             style: TextStyle(
                      //               color: Colors.black87,
                      //               fontWeight: FontWeight.w500,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      /// reviews
                      DottedHeaderTextWidget(
                        text: 'ОТЗЫВЫ',
                        tailWidget: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(196, 196, 196, 1.0),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text('${REVIEWS.length}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () => _pageController.previousPage(
                                  duration: _kDuration,
                                  curve: _kCurve,
                                ),
                                child: Icon(Icons.arrow_back_rounded, size: 20),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(
                                        247, 247, 247, 1.0),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: PageView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: REVIEWS.length,
                                    controller: _pageController,
                                    itemBuilder: (context, index) {
                                      return ListView(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        children: [
                                          Text(
                                            REVIEWS[index]['text'],
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            REVIEWS[index]['name'],
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () => _pageController.nextPage(
                                  duration: _kDuration,
                                  curve: _kCurve,
                                ),
                                child:
                                    Icon(Icons.arrow_forward_rounded, size: 20),
                              ),
                            ],
                          ),
                        ),
                      ),

                      /// adverts
                      DottedHeaderTextWidget(
                        text: 'МОИ ОБЪЕКТЫ',
                        tailWidget: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(196, 196, 196, 1.0),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text('${ADVERTS.length}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: _showAllAdverts,

                        /// show 2 adverts
                        child: Container(
                          height: 350.0,
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 5 / 9,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 0,
                            ),
                            itemBuilder: (context, index) {
                              final advert = ADVERTS[index];
                              return AdvertCardNew(
                                  advert: advert, index: index);
                              // return AdvertCard(advert: advert);
                            },
                            itemCount: 2,
                          ),
                        ),

                        /// show all adverts list
                        replacement: Expanded(
                          child: GridView.builder(
                            primary: false,
                            shrinkWrap: true,
                            // physics: const ClampingScrollPhysics(),
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 5 / 9,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 0,
                            ),
                            itemBuilder: (context, index) {
                              final advert = ADVERTS[index];
                              return AdvertCardNew(
                                  advert: advert, index: index);
                              // return AdvertCard(advert: advert);
                            },
                            itemCount: ADVERTS.length,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),

                      /// show all adverts toggle
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _showAllAdverts = !_showAllAdverts;
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Показать все заявки',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Icon(
                                  _showAllAdverts
                                      ? LineIcons.angleDown
                                      : LineIcons.angleUp,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      /// edit button
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(16, 16, 16, 56),
                      //   child: ElevatedButton(
                      //     onPressed: () {},
                      //     child: Text(
                      //       'Редактировать',
                      //       style: TextStyle(
                      //         color: Colors.white,
                      //         fontSize: 12,
                      //         fontWeight: FontWeight.w500,
                      //       ),
                      //     ),
                      //     style: ElevatedButton.styleFrom(
                      //       primary: Style.blue,
                      //       elevation: 0,
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(4),
                      //       ),
                      //       padding: const EdgeInsets.symmetric(horizontal: 50),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// back button
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: EdgeInsets.only(
                  top: Global.getViewPadding(context).top > 0
                      ? Global.getViewPadding(context).top
                      : 24),
              child: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CounterBadge extends StatelessWidget {
  final String iconAssetPath;
  final String badgeName;
  final int count;

  const CounterBadge({
    Key key,
    @required this.iconAssetPath,
    @required this.badgeName,
    @required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          iconAssetPath,
          width: 40,
          height: 40,
        ),
        const SizedBox(height: 8),
        Container(
          child: Text(
            badgeName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(238, 238, 238, 1.0),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text('$count',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color.fromRGBO(74, 80, 86, 1.0),
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    )),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MainBadge extends StatelessWidget {
  const MainBadge({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/rate_agent_icon/business_expert.png',
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 5),
          Text(
            'Знаток Business',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
          )
        ]);
  }
}

class HeaderStars extends StatelessWidget {
  final double rating;

  const HeaderStars({
    Key key,
    @required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      ignoreGestures: true,
      initialRating: rating,
      minRating: 1,
      unratedColor: Style.blue,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.fromLTRB(1, 0, 1, 3),
      itemSize: 16,
      itemBuilder: (context, _) => Icon(
        CustomIcons.star,
        color: Color(0xFFFF9929),
      ),
      onRatingUpdate: (rating) {},
    );
  }
}

class DottedHeaderTextWidget extends StatelessWidget {
  final String text;
  final Widget tailWidget;

  const DottedHeaderTextWidget({
    Key key,
    @required this.text,
    this.tailWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.brightness_1,
                size: 5,
                color: Style.orange,
              ),
            ],
          ),
          const SizedBox(width: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: const Color.fromRGBO(74, 80, 86, 1.0),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          if (tailWidget != null) ...[const SizedBox(width: 5), tailWidget],
        ],
      ),
    );
  }
}
