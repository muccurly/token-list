import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jurta/screens/screens.dart';
import 'package:jurta/utils/utils.dart';
import 'package:line_icons/line_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class OurSpeicalistsScreen extends StatefulWidget {
  static const String route = 'our_specialists';
  @override
  _OurSpeicalistsScreenState createState() => _OurSpeicalistsScreenState();
}

class _OurSpeicalistsScreenState extends State<OurSpeicalistsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF0F0F0),
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
                    'НАШИ СПЕЦИАЛИСТЫ',
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
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFF0F0F0),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              //text
              Column(
                children: [
                  Text(
                    'Выберите вашего риэлтора либо оставьте заявку',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'мы подберем походящего риэлтора ',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              SizedBox(
                height: 28,
              ),

              /// оставить заявку кнопка
              Container(
                height: 35,
                child: ElevatedButton(
                  onPressed: () {
                    pushNewScreen(context,
                        screen: LeaveContactsScreen(
                          isPage: 2,
                        ),
                        withNavBar: true);
                  },
                  child: Text(
                    'Оставить заявку',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              /// search field
              Container(
                height: kToolbarHeight / 1.7,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.center,
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Color(0xFFDBDBDB).withOpacity(0.5),
                        width: 0.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Color(0xFFDBDBDB).withOpacity(0.5),
                        width: 0.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Color(0xFFDBDBDB).withOpacity(0.5),
                        width: 0.5,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Color(0xFFDBDBDB).withOpacity(0.5),
                        width: 0.5,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Color(0xFFDBDBDB).withOpacity(0.5),
                        width: 0.5,
                      ),
                    ),
                    hintText: 'Поиск',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 14,
                    ),
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: ImageIcon(
                              AssetImage('assets/images/search.png'),
                              size: 20,
                              color: Color(0xFFADADAD).withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 380,
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    ...SPECIALISTS
                        .map(
                          (specialist) => SpecialistsTile(
                            imagePath: specialist['imagePath'],
                            imageUrl: specialist['imageUrl'],
                            name: specialist['name'],
                            position: specialist['position'],
                            rating: specialist['rating'],
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
              SizedBox(
                height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SpecialistsTile extends StatelessWidget {
  final String imagePath;
  final String imageUrl;
  final String name;
  final String position;
  //final int rating_star;
  final double rating;

  const SpecialistsTile(
      {Key key,
      this.imagePath,
      this.imageUrl,
      this.name,
      this.position,
      //this.rating_star,
      this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 15, 8, 12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.transparent, width: 0.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: imageUrl != null
                ? NetworkImage(imageUrl)
                : AssetImage(imagePath),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),

                /// name
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text(
                    name ?? '--',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                /// Rating
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ///Rating Star
                    Flexible(
                      flex: 3,
                      child: RatingBar(
                        initialRating: rating,
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
                    ),
                    const SizedBox(width: 4),

                    ///Rating numbers
                    Flexible(
                      flex: 1,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/images/bubble_rect.png',
                              height: 26,
                              // width: 36,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 1),
                              child: Text(
                                rating.toString(),
                                style: TextStyle(
                                  color: Style.orange,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),

                    ///Dot styled
                    Icon(
                      Icons.circle,
                      color: Style.orange2,
                      size: 5,
                    ),
                    const SizedBox(width: 5),

                    Flexible(
                      flex: 4,
                      child: Text(
                        position,
                        style: TextStyle(
                          fontSize: 12,
                          color: Style.orange,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {
                      pushNewScreen(context,
                          screen: LeaveContactsScreen(
                            isPage: 2,
                          ),
                          withNavBar: true);
                    },
                    child: FittedBox(
                      child: Text(
                        '    Выбрать    ',
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
