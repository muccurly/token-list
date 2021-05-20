import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jurta/utils/global.dart';
import 'package:jurta/widgets/info_page_btn.dart';

class AboutAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
                      'О ПРИЛОЖЕНИИ',
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
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: Global.getSize(context).width * 0.08,
              height: Global.getSize(context).height * 0.08,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '  «Jurta» приложение для удобного поиска и продажи недвижимости. Мы предлагаем безопасный и качественный сервис при поиске и продаже недвижимости. Наша обширная база позволит подобрать недживимость по Вашим индивидуальным предпочтениям.    Приложение «Jurta» разработано для оптимизации вашего времени и сил при покупке и продаже недвижимости. Мы реализовали для Вас следующие фишки в нашем приложении:',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            AboutAppText(
              imageUrl: "assets/images/about_app_icon/video.svg",
              title: 'ВИДЕООБЗОРЫ ОБЪЕКТОВ',
              subtitle:
                  'для удобного и быстрого просмотра объекта без выезда на объект. Все видеообзоры проверены нашими специалистами и являются достоверными.',
            ),
            SizedBox(
              height: 20,
            ),
            AboutAppText(
              imageUrl: "assets/images/about_app_icon/rating.svg",
              title: 'РЕЙТИНГ АГЕНТОВ',
              subtitle:
                  'покажется наиболее перспективного для вас агента, рейтинг ЖК позволит не ошибиться с выбором и подобрать оптимальную близость к школам, садикам, ТРЦ и тд.',
            ),
            SizedBox(
              height: 20,
            ),
            AboutAppText(
              imageUrl: "assets/images/about_app_icon/schedule.svg",
              title: 'ЗАБРОНИРОВАТЬ ПОКАЗ',
              subtitle:
                  'выбирайте подходящее время для осмотра и наши агенты организуют встречу.',
            ),
            SizedBox(
              height: 20,
            ),
            AboutAppText(
              imageUrl: "assets/images/about_app_icon/cashback.svg",
              title: 'ПОЛУЧИТЬ КЭШБЕК 10% ОТ ПРОДАЖИ?',
              subtitle:
                  'это реально! у вас есть знакомые, которые продают недвижимость? дайте нам их контакт и мы переведем вам 10% кэшбека',
            ),
            SizedBox(
              height: 20,
            ),
            AboutAppText(
              imageUrl: "assets/images/about_app_icon/sell.svg",
              title: 'ПРОДАТЬ НЕДВИЖИМОСТЬ БЕЗ РИЭЛТОРА? ЛЕГКО!',
              subtitle:
                  'Снимайте видеообзор своей квартиры, выставляйте в наше приложение и ждите заявок! Все уведомления приходят в режиме онлайн и вы не пропустите ничего!',
            ),
          ],
        ));
  }
}

class AboutAppText extends StatelessWidget {
  String imageUrl;
  String title;
  String subtitle;
  AboutAppText({this.imageUrl, this.title, this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            imageUrl ?? "assets/images/about_app_icon/video.svg",
            width: 32,
            height: 32,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? 'ВИДЕООБЗОРЫ ОБЪЕКТОВ',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                ),
                Text(
                  subtitle ??
                      'для удобного и быстрого просмотра объекта без выезда на объект. Все видеообзоры проверены нашими специалистами и являются достоверными.',
                  textAlign: TextAlign.left,
                  maxLines: 4,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
