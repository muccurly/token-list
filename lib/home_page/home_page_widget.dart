import '../components/main_obj_box_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final pageViewController = PageController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        child: PageView(
          controller: pageViewController,
          scrollDirection: Axis.vertical,
          children: [
            MainObjBoxWidget(
              price: 250000000,
              rooms: 4,
              floors: 2,
              sqMeters: 125,
              city: 'Нур-султан',
              district: 'Есильский район',
              street: 'Наурызбай Батыра',
              house: '86/5',
              agent:
                  'https://a1cf74336522e87f135f-2f21ace9a6cf0052456644b80fa06d4f.ssl.cf2.rackcdn.com/images/characters_opt/p-men-in-black-2-tommy-lee-jones.jpg',
              objectImg:
                  'https://torontolife.com/wp-content/uploads/2019/10/HZIsuuNp.jpg',
            ),
            MainObjBoxWidget(
              price: 250000000,
              rooms: 4,
              floors: 2,
              sqMeters: 125,
              city: 'Нур-султан',
              district: 'Есильский район',
              street: 'Наурызбай Батыра',
              house: '86/5',
              agent:
                  'https://a1cf74336522e87f135f-2f21ace9a6cf0052456644b80fa06d4f.ssl.cf2.rackcdn.com/images/characters_opt/p-men-in-black-2-tommy-lee-jones.jpg',
              objectImg:
                  'https://torontolife.com/wp-content/uploads/2019/10/HZIsuuNp.jpg',
            ),
            MainObjBoxWidget(
              price: 250000000,
              rooms: 4,
              floors: 2,
              sqMeters: 125,
              city: 'Нур-султан',
              district: 'Есильский район',
              street: 'Наурызбай Батыра',
              house: '86/5',
              agent:
                  'https://a1cf74336522e87f135f-2f21ace9a6cf0052456644b80fa06d4f.ssl.cf2.rackcdn.com/images/characters_opt/p-men-in-black-2-tommy-lee-jones.jpg',
              objectImg:
                  'https://torontolife.com/wp-content/uploads/2019/10/HZIsuuNp.jpg',
            )
          ],
        ),
      ),
    );
  }
}
