import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:jurta/screens/advert_details.dart';
import 'package:jurta/screens/search_result.dart';
import 'package:jurta/utils/utils.dart';
import 'package:line_icons/line_icons.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _showAllAdverts = true;

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
                            //Add Avatar
                            // Positioned(
                            //   right: 16,
                            //   bottom: 0,
                            //   child: Image.asset(
                            //     'assets/images/plus_round.png',
                            //     height: 30,
                            //     width: 30,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                /// info
                Container(
                  padding: const EdgeInsets.only(top: 12),
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        /// status
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Style.blue2,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            margin: EdgeInsets.only(
                                right: (Global.getSize(context).width -
                                        (Global.getSize(context).width / 2.5)) /
                                    2,
                                bottom: 8),
                            child: Text(
                              'Эксперт',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),

                        /// full name
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Замзагуль Дюсуп',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        /// rating
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Лидер месяца ',
                              style: TextStyle(
                                fontSize: 12,
                                color: Style.orange,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Icon(
                              Icons.circle,
                              color: Style.orange2,
                              size: 5,
                            ),
                            const SizedBox(width: 16),
                            RatingBar(
                              initialRating: 5,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              itemCount: 5,
                              ratingWidget: RatingWidget(
                                full: Icon(
                                  LineIcons.starAlt,
                                  color: Style.orange,
                                ),
                                half: Icon(
                                  LineIcons.starAlt,
                                  color: Style.orange,
                                ),
                                empty: Icon(LineIcons.star),
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                              itemSize: 16,
                              ignoreGestures: true,
                            ),
                            // Stack(
                            //   alignment: Alignment.center,
                            //   children: [
                            //     Align(
                            //       alignment: Alignment.center,
                            //       child: Image.asset(
                            //         'assets/images/bubble_rect.png',
                            //         height: 26,
                            //         // width: 36,
                            //       ),
                            //     ),
                            //     Align(
                            //       alignment: Alignment.center,
                            //       child: Padding(
                            //         padding: const EdgeInsets.only(bottom: 1),
                            //         child: Text(
                            //           '4.2',
                            //           style: TextStyle(
                            //             color: Style.orange,
                            //             fontSize: 12,
                            //             fontWeight: FontWeight.w700,
                            //           ),
                            //           textAlign: TextAlign.center,
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),

                        /// phone, location
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
                          child: Row(
                            children: [
                              /// phone
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Style.orange,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Text(
                                    '+7 702 888 45 80',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),

                              /// location
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Text(
                                    'г. Нур-Султан',
                                    style: TextStyle(
                                      fontSize: 12,
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.brightness_1,
                                      size: 8,
                                      color: Style.orange,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: FittedBox(
                                        child: Text(
                                          'Сделки в этом месяце',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '7',
                                      style: TextStyle(
                                        color: Style.orange,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 1,
                                color: Colors.grey.shade200,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.brightness_1,
                                      size: 8,
                                      color: Style.orange,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: FittedBox(
                                        child: Text(
                                          'Сделки за 2020 год',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '34',
                                      style: TextStyle(
                                        color: Style.orange,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// About me
                        Align(
                          child: HeaderTextWidget(text: 'О СЕБЕ'),
                          alignment: Alignment.topLeft,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                              "Более 5 лет опыта в сфере купли-продажи недвижимости по всему Казахстану, более 1000 благодарных клиентов и 200 постоянных клиентов. Специализируюсь на продажах многокомнатных квартир и домов элит класса"),
                        ),
                        const SizedBox(height: 20),

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
                          replacement: Container(
                            height: 450.0,
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
