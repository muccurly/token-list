import '../components/footer_info_box_widget.dart';
import '../components/main_info_box_widget.dart';
import '../components/more_info_box_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ObjectPageWidget extends StatefulWidget {
  ObjectPageWidget({Key key}) : super(key: key);

  @override
  _ObjectPageWidgetState createState() => _ObjectPageWidgetState();
}

class _ObjectPageWidgetState extends State<ObjectPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: FlutterFlowTheme.dark),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: FlutterFlowTheme.dark,
            size: 24,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MainInfoBoxWidget(
              objectImg1: 'https://collage.studio/img/24092020/11.jpg',
              objectImg2: 'https://87.img.avito.st/640x480/9983340887.jpg',
              objectImg3:
                  'https://fainaidea.com/wp-content/uploads/2018/10/main3.jpg',
              houseName: 'ЖК Комфорт',
              rooms: 4,
              floorAt: 5,
              floorTotal: 6,
              sqMeters: 120,
              price: 200000000,
              city: 'Нур-султан',
              district: 'Есильский р-н',
              street: 'Ахметова Гагарина',
              house: '23',
              agent: 'Алиеков Алибек',
              classType: 'Бизнес',
              quality: 'Евроремонт',
              ceiling: 3,
              washroom: 'Раздельно',
              parking: 'Имеется',
              yearBuilt: 2021,
            ),
            MoreInfoBoxWidget(
              description:
                  'Расположен ЖК в престижном развивающемся районе. Рядом находится прекрасное место для отдыха и прогулок — Президентский парк, набережная реки Есиль. В шаговой доступности школа Haileybury Astana. В 10 минутах пешком Национальный музей, Дворец мира и согласия (Пирамида), Дворец независимости, казахский национальный университет',
              ratingDistrict: 98,
              ratingHouse: 81,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 50),
              child: FooterInfoBoxWidget(
                totalComments: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
