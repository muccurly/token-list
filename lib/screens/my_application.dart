import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jurta/utils/utils.dart';

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
                  TabBar(
                    controller: _tabController,
                    tabs: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'АКТИВНЫЕ',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'АРХИВНЫЕ',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                    indicatorColor: Style.orange,
                    labelColor: Style.orange,
                    unselectedLabelColor: Colors.grey,
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
                ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    final application = APPLICATIONS[index];
                    return ApplicationCard(
                      application: application,
                    );
                  },
                  itemCount: APPLICATIONS.length,
                ),

                /// archive
                Container(
                  child: Center(child: Text('archive')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ApplicationCard extends StatelessWidget {
  final Map<String, dynamic> application;

  const ApplicationCard({Key key, this.application}) : super(key: key);

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
                  'Заявка на ${application['type'] == 'buy' ? 'покупку' : 'продажу'}',
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
                        'ID - ${application['application_id']}',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${DateFormat('kk:mm, dd.MM.yyyy').format(application['datetime'])}',
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              'Краткое описание:',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(
              application['short_description'],
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Divider(height: 0),

          /// bottom section
          Container(
            alignment: Alignment.centerRight,
            height: 28,
            margin: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Подробнее',
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
