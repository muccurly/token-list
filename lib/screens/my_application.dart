import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jurta/utils/utils.dart';
import 'package:jurta/widgets/custom_tabbar.dart';

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
              fieldValue: '${widget.application['advert']['price']} тг',
              isExpanded: isExpanded,
              widget: widget),
          ExtendedApplicationDescription(
              fieldName: 'Город',
              fieldValue: '${widget.application['advert']['address_city']}',
              isExpanded: isExpanded,
              widget: widget),
          ExtendedApplicationDescription(
              fieldName: 'Район',
              fieldValue: '${widget.application['advert']['address_district']}',
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
              fieldValue: '${widget.application['advert']['rooms']}',
              isExpanded: isExpanded,
              widget: widget),
          ExtendedApplicationDescription(
              fieldName: 'Площадь',
              fieldValue: '${widget.application['advert']['area']}',
              isExpanded: isExpanded,
              widget: widget),
          ExtendedApplicationDescription(
              fieldName: 'Комментарий',
              fieldValue: '${widget.application['comment']}',
              isExpanded: isExpanded,
              widget: widget),
          const Divider(height: 0),

          /// specialist
          Visibility(
            visible: isExpanded,
            child: PhoneSpecialistTile(
              imagePath: widget.specialist['imagePath'],
              imageUrl: widget.specialist['imageUrl'],
              name: widget.specialist['name'],
              phone: widget.specialist['phone'],
            ),
          ),

          /// bottom section
          Container(
            alignment: Alignment.centerRight,
            height: 28,
            margin: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Text(
                isExpanded ? 'Свернуть' : 'Подробнее',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Style.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                elevation: 0,
                padding: EdgeInsets.symmetric(horizontal: 36),
              ),
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
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: RichText(
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
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
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300, width: 0.5),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// name
                Text(
                  name ?? '--',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 5.0),

                /// Rating
                GestureDetector(
                  onTap: () => launchUrl('tel:$phone'),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      /// phone button
                      ImageIcon(
                        AssetImage('assets/images/phone_round.png'),
                        size: 30,
                        color: Style.blue,
                      ),

                      const SizedBox(width: 8),

                      /// phone itself
                      Container(
                        alignment: Alignment.centerRight,
                        height: 28,
                        decoration: BoxDecoration(
                          color: Style.blue,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: ElevatedButton(
                          onPressed: null,
                          child: Text(
                            '$formattedPhoneNumber',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Style.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            elevation: 0,
                            // padding: EdgeInsets.symmetric(horizontal: 16),
                          ),
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
