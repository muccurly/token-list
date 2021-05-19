import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:jurta/utils/utils.dart';

class RulesText extends StatelessWidget {
  final String text;

  const RulesText({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = ScrollController();
    return Center(
      child: Container(
        // adding padding
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),

        // height should be fixed for vertical scrolling
        height: Global.getSize(context).height / 1.6,
        decoration: BoxDecoration(
          // adding borders around the widget
          border: Border.all(
            color: Color(0xFFEEEEEE),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        // SingleChildScrollView should be
        // wrapped in an Expanded Widget
        child: Column(
          children: [
            Expanded(
              // SingleChildScrollView contains a
              // single child which is scrollable
              child: SingleChildScrollView(
                // for Vertical scrolling
                controller: _controller,
                scrollDirection: Axis.vertical,
                child: text ??
                    Text(
                      "Мы, Ф.И.О, 17 ноября 1966 года рождения, ИИН6611174003548, уроженка Восточно-Казахстанской области, проживающая по адресу: ВКО, город Семей, ул.Городская, дом 1, именуемая в дальнейшем «ПРОДАВЕЦ» и Ф.И.О, 30 апреля 1960 года рождения, ИИН 600430307868, уроженец Восточно-Казахстанской области, проживающий по адресу: ВКО, Бородулихинский район, п.Жезкент, улица Дружбы, дом 7, квартира 1, действующий с согласия супруги Ф.И.О, именуемый в дальнейшем «ПОКУПАТЕЛЬ», заключили настоящий договор о нижеследующем:"
                      "\n1. ПРОДАВЕЦ продал, а ПОКУПАТЕЛЬ купил жилую квартиру, расположенную по адресу: ВКО, город Семей,проспект Шакарима, дом 113 (сто тринадцать), квартира 14 (четырнадцать), состоящую из двух жилых комнат, кухни и служебных помещений, общей  общей площадью – 41,1 кв.м., в том числе жилой площадью – 26,4 кв.м. "
                      "\n2. Указанная квартира принадлежит ПРОДАВЦУ на основании Договора купли-продажи квартиры № 13",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.justify,
                    ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                final screenHeight = Global.getSize(context).height / 1.6;

                // If you don't want any animation, use this:
                _controller.jumpTo(screenHeight);

                // Otherwise use this:
                _controller.animateTo(screenHeight,
                    curve: Curves.linear, duration: Duration(seconds: 1));
              },
              child: SvgPicture.asset(
                'assets/images/arrow_down.svg',
                width: 15,
                height: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
