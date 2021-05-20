import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jurta/screens/screens.dart';
import 'package:jurta/utils/utils.dart';
import 'package:jurta/widgets/custom_tabbar.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MyApplicationScreen extends StatefulWidget {
  @override
  _MyApplicationScreenState createState() => _MyApplicationScreenState();
}

class _MyApplicationScreenState extends State<MyApplicationScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            backgroundColor: Colors.white,
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
                        'МОИ ЗАЯВКИ',
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
            snap: true,
            floating: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(30),
              child: Column(
                children: [
                  /// tab
                  DecoratedTabBar(
                    tabBar: TabBar(
                      controller: _tabController,
                      tabs: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'АКТИВНЫЕ',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: _tabController.index == 0
                                    ? FontWeight.w900
                                    : FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'АРХИВНЫЕ',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: _tabController.index == 1
                                    ? FontWeight.w900
                                    : FontWeight.w400),
                          ),
                        ),
                      ],
                      indicatorColor: Style.orange,
                      labelColor: Style.orange,
                      unselectedLabelColor: Style.blue,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Style.blue,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// list of adverts
          SliverFillRemaining(
            hasScrollBody: true,
            fillOverscroll: true,
            child: TabBarView(
              controller: _tabController,
              children: [
                /// active
                ApplicationsListBuilder(),

                /// archive
                ApplicationsListBuilder(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ApplicationsListBuilder extends StatelessWidget {
  const ApplicationsListBuilder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final application = APPLICATIONS[index];
        final specialist = SPECIALISTS[index];
        final applicationType = APPLICATIONS[index]['type'] == 'buy'
            ? ApplicationType.buy
            : ApplicationType.sell;
        return ApplicationCard(
          application: application,
          specialist: specialist,
          applicationType: applicationType,
        );
      },
      itemCount: APPLICATIONS.length,
    );
  }
}

class ApplicationCard extends StatefulWidget {
  final Map<String, dynamic> application;
  final Map<String, dynamic> specialist;
  final ApplicationType applicationType;

  const ApplicationCard(
      {Key key, this.application, this.specialist, this.applicationType})
      : super(key: key);

  @override
  _ApplicationCardState createState() => _ApplicationCardState();
}

class _ApplicationCardState extends State<ApplicationCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black26, width: 0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// top section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  AssetImage('assets/images/bookmark_star.png'),
                  color: Style.orange,
                  size: 47,
                ),
                const SizedBox(width: 8),
                Text(
                  'Заявка на ${widget.applicationType == ApplicationType.buy ? 'покупку' : 'продажу'}',
                  style: TextStyle(
                    color: Style.orange,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'ID - ${widget.application['application_id']}',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${DateFormat('kk:mm, dd.MM.yyyy').format(widget.application['datetime'])}',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 16),

          /// middle section
          Visibility(
            visible: !isExpanded,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Text(
                'Краткое описание:',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          Visibility(
            visible: !isExpanded,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                widget.application['short_description'],
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),

          /// extended middle section
          Visibility(
            visible: isExpanded,
            child: const SizedBox(height: 8),
          ),

          ExtendedApplicationDescription(
              fieldName: 'Цена',
              fieldValue: widget.applicationType == ApplicationType.buy
                  ? 'от ${widget.application['purchase_info']['price']['from']} до ${widget.application['purchase_info']['price']['to']} тг'
                  : '${widget.application['advert']['price']} тг',
              isExpanded: isExpanded,
              widget: widget),
          ExtendedApplicationDescription(
              fieldName: 'Город',
              fieldValue: widget.applicationType == ApplicationType.buy
                  ? '${CITIES[widget.application['purchase_info']['city_id']]}'
                  : '${widget.application['advert']['address_city']}',
              isExpanded: isExpanded,
              widget: widget),
          ExtendedApplicationDescription(
              fieldName: 'Район',
              fieldValue: widget.applicationType == ApplicationType.buy
                  ? '${widget.application['purchase_info']['districts'].join(", ")}'
                  : '${widget.application['advert']['address_district']}',
              isExpanded: isExpanded,
              widget: widget),

          if (widget.applicationType == ApplicationType.sell) ...[
            ExtendedApplicationDescription(
                fieldName: 'Улица',
                fieldValue: '${widget.application['advert']['address_street']}',
                isExpanded: isExpanded,
                widget: widget),
            ExtendedApplicationDescription(
                fieldName: 'Дом',
                fieldValue: '${widget.application['advert']['address_house']}',
                isExpanded: isExpanded,
                widget: widget),
            ExtendedApplicationDescription(
                fieldName: 'ЖК',
                fieldValue: '${widget.application['advert']['title']}',
                isExpanded: isExpanded,
                widget: widget),
          ],
          ExtendedApplicationDescription(
              fieldName: 'Количество комнат',
              fieldValue: widget.applicationType == ApplicationType.buy
                  ? 'от ${widget.application['purchase_info']['rooms']['from']} до ${widget.application['purchase_info']['rooms']['to']}'
                  : '${widget.application['advert']['rooms']}',
              isExpanded: isExpanded,
              widget: widget),
          ExtendedApplicationDescription(
              fieldName: 'Площадь',
              fieldValue: widget.applicationType == ApplicationType.buy
                  ? 'от ${widget.application['purchase_info']['area']['from']} до ${widget.application['purchase_info']['area']['to']} м\u00B2'
                  : '${widget.application['advert']['area']}',
              isExpanded: isExpanded,
              widget: widget),
          ExtendedApplicationDescription(
              fieldName: 'Комментарий',
              fieldValue: '${widget.application['comment']}',
              isExpanded: isExpanded,
              widget: widget),

          /// specialist
          Visibility(
            visible: isExpanded,
            child: PhoneSpecialistTile(
              imagePath: widget.specialist['imagePath'],
              imageUrl: widget.specialist['imageUrl'],
              name: widget.specialist['name'],
              phone: widget.specialist['phone'],
            ),
            replacement: const Divider(height: 0),
          ),

          /// bottom section
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: widget.applicationType == ApplicationType.sell
                      ? GestureDetector(
                          onTap: () {
                            pushNewScreenWithRouteSettings(
                              context,
                              screen: AdvertDetailsScreen(),
                              settings: RouteSettings(
                                name: AdvertDetailsScreen.route,
                                arguments: widget.application['advert'],
                              ),
                            );
                          },
                          child: Container(
                              height: 28,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Style.blue,
                              ),
                              child: Center(
                                child: Text(
                                  'Перейти к объекту',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              )))
                      : Container(height: 28),
                ),
                const SizedBox(width: 5),
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: Container(
                            height: 28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Style.orange,
                            ),
                            child: Center(
                              child: Text(
                                isExpanded ? 'Свернуть' : 'Подробнее',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            )))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExtendedApplicationDescription extends StatelessWidget {
  final String fieldName;
  final String fieldValue;
  final bool isExpanded;
  final ApplicationCard widget;

  const ExtendedApplicationDescription({
    Key key,
    @required this.fieldName,
    @required this.fieldValue,
    @required this.isExpanded,
    @required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isExpanded,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        child: Text.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: '$fieldName: ',
                  style: TextStyle(
                    color: Style.blue,
                    fontWeight: FontWeight.w700,
                    fontSize: 13.0,
                  )),
              TextSpan(
                text: fieldValue,
                style: TextStyle(
                  color: Style.blue,
                  fontWeight: FontWeight.w400,
                  fontSize: 13.0,
                ),
              ),
            ],
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class PhoneSpecialistTile extends StatelessWidget {
  final String imagePath;
  final String imageUrl;
  final String phone;
  final String name;

  const PhoneSpecialistTile({
    Key key,
    this.imagePath,
    this.imageUrl,
    this.phone,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String formattedPhoneNumber = phone.substring(0, 2) +
        " " +
        phone.substring(2, 5) +
        " " +
        phone.substring(5, 8) +
        " " +
        phone.substring(8, 10) +
        " " +
        phone.substring(10, phone.length);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsets.only(right: 12, left: 12),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(247, 247, 247, 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: imageUrl != null
                ? NetworkImage(imageUrl)
                : AssetImage(imagePath),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// name
                Text(
                  name ?? '--',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5.0),

                /// Rating
                GestureDetector(
                  onTap: () => launchUrl('tel:$phone'),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// phone itself
                      Container(
                        alignment: Alignment.center,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Style.blue,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(width: 2),

                            /// phone button
                            ImageIcon(
                              AssetImage('assets/images/phone_round.png'),
                              size: 17,
                              color: Colors.white,
                            ),

                            const SizedBox(width: 8),

                            Text(
                              '$formattedPhoneNumber',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),

                            const SizedBox(width: 8),
                          ],
                        ),
                      ),
                    ],
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
