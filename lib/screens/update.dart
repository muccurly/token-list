import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jurta/utils/global.dart';
import 'package:jurta/utils/utils.dart';
import 'package:package_info_plus/package_info_plus.dart';

class UpdateScreen extends StatefulWidget {
  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  Future<PackageInfo> packageInfo;

  @override
  void initState() {
    packageInfo = PackageInfo.fromPlatform();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      'ОБНОВЛЕНИЯ ПРИЛОЖЕНИЯ',
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
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: Global.getSize(context).width * 0.333,
                  alignment: Alignment.centerLeft,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FutureBuilder<PackageInfo>(
                  future: packageInfo,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return InfoCard(
                        iconPath: 'assets/images/settings_small.svg',
                        fieldText: 'Версия приложения:',
                        fieldTextColor: const Color.fromRGBO(35, 35, 35, 1.0),
                        descriptionText: '${snapshot.data.version}',
                        descriptionTextColor: Style.orange,
                      );
                    }

                    return Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 24,
                          width: 24,
                          child: const CircularProgressIndicator()),
                    ));
                  }),
              FutureBuilder<PackageInfo>(
                  future: packageInfo,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return InfoCard(
                        iconPath: 'assets/images/calendar_small.svg',
                        fieldText: 'Дата обновления:',
                        fieldTextColor: const Color.fromRGBO(35, 35, 35, 1.0),
                        // TODO: use compile time variable
                        descriptionText: '$BUILD_DATE',
                        descriptionTextColor: Style.orange,
                      );
                    }

                    return Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 24,
                          width: 24,
                          child: const CircularProgressIndicator()),
                    ));
                  }),
            ],
          ),
        ));
  }
}

class InfoCard extends StatelessWidget {
  final String iconPath;
  final Widget iconSpacer;
  final String fieldText;
  final String descriptionText;
  final Function onTap;
  final Color backgroundColor;
  final Color fieldTextColor;
  final Color descriptionTextColor;

  const InfoCard({
    Key key,
    @required this.descriptionText,
    @required this.fieldText,
    @required this.iconPath,
    @required this.fieldTextColor,
    @required this.descriptionTextColor,
    this.backgroundColor = Colors.white,
    this.onTap,
    this.iconSpacer,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      highlightColor: Colors.white,
      onTap: onTap ?? () {},
      child: Container(
        height: 48,
        width: double.infinity,
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 0.66,
            color: Colors.grey.shade300,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 15,
              height: 15,
            ),
            if (iconSpacer != null)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: iconSpacer,
              ),
            const SizedBox(width: 8),
            Text(
              fieldText,
              style: TextStyle(
                color: fieldTextColor,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              descriptionText,
              style: TextStyle(
                color: descriptionTextColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
