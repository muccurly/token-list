import 'package:flutter/material.dart';
import 'package:jurta/screens/screens.dart';
import 'package:jurta/utils/utils.dart';
import 'package:line_icons/line_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
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
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        title: const SizedBox.shrink(),
        leading: null,
        automaticallyImplyLeading: false,
        toolbarHeight: kToolbarHeight,
        backgroundColor: Colors.transparent,
        bottom: DecoratedTabBar(
          tabBar: TabBar(
            controller: _tabController,
            tabs: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'ОБЪЕКТЫ',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'СОХРАНЕННЫЕ ПОИСКИ',
                  style: TextStyle(
                    fontSize: 10,
                  ),
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
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          AdvertListWidget(),
          YandexMapWidget(),
        ],
      ),
    );
  }
}

class AdvertListWidget extends StatefulWidget {
  @override
  _AdvertListWidgetState createState() => _AdvertListWidgetState();
}

class _AdvertListWidgetState extends State<AdvertListWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 5 / 9,
        crossAxisSpacing: 8,
        mainAxisSpacing: 0,
      ),
      itemCount: ADVERTS.where((advert) => advert['is_fav']).toList().length,
      itemBuilder: (context, index) {
        final advert =
            ADVERTS.where((advert) => advert['is_fav']).toList()[index];
        return AdvertCardNew(
          advert: advert,
          index: index,
          favorite: true,
        );
        // return AdvertCard(advert: advert);
      },
    );
  }
}

class AdvertFavCard extends StatelessWidget {
  final Map<String, dynamic> advert;
  final Function setState;

  const AdvertFavCard({Key key, this.advert, this.setState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: Row(
        children: [
          /// image
          CircleAvatar(
            backgroundImage: NetworkImage(advert['images'][0]),
            radius: 40,
          ),
          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// title, price, like button
                Row(
                  children: [
                    /// title, price
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: '${advert['title']}, ',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'HelveticaNeueCyr',
                          ),
                          children: [
                            TextSpan(
                              text: '${advert['price']}',
                              style: TextStyle(
                                color: Style.orange,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),

                    /// like button
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          advert['is_fav'] = !advert['is_fav'];
                        });
                      },
                      child: Icon(
                        advert['is_fav'] ? LineIcons.heartAlt : LineIcons.heart,
                        color: advert['is_fav'] ? Colors.red : null,
                        size: 24,
                      ),
                      behavior: HitTestBehavior.opaque,
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                /// info
                Text(
                  '${advert['rooms']}-комнатная квартира • ${advert['flat']} • ${advert['area']} asdjasd fasd fasd fasd afdsa sd',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),

                Container(
                  height: 28,
                  child: ElevatedButton(
                    onPressed: () {
                      pushNewScreenWithRouteSettings(
                        context,
                        screen: AdvertDetailsScreen(),
                        settings: RouteSettings(
                          name: AdvertDetailsScreen.route,
                          arguments: advert,
                        ),
                        withNavBar: false,
                      );
                    },
                    child: Text(
                      'Подробнее',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding:
                          const EdgeInsets.only(left: 32, right: 32, top: 2),
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

class DecoratedTabBar extends StatelessWidget implements PreferredSizeWidget {
  DecoratedTabBar({@required this.tabBar, @required this.decoration});

  final TabBar tabBar;
  final BoxDecoration decoration;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Container(decoration: decoration)),
        tabBar,
      ],
    );
  }
}
