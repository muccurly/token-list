import 'package:flutter/material.dart';
import 'package:jurta/screens/screens.dart';
import 'package:jurta/utils/utils.dart';
import 'package:jurta/widgets/custom_tabbar.dart';
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
                    fontSize: 12,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'СОХРАНЕННЫЕ ПОИСКИ',
                  style: TextStyle(
                    fontSize: 12,
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
          SavedSearch(),
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
                            TextSpan(
                              text: ' ₸',
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Montserrat'),
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
                          advert['is_fav'] = advert['is_fav'];
                        });
                      },
                      child: ImageIcon(
                        AssetImage('assets/images/like_filled.png'),
                        size: 30,
                        color: advert['is_fav']
                            ? Color.fromRGBO(220, 79, 94, 1.0)
                            : Colors.white,
                      ),
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

//Empty Saved Search Page
class EmptySavedSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('У Вас нет сохраненных поисков,'),
          Text('Выберите параметры для сохранения'),
          SizedBox(height: 20),
          Container(
            width: Global.getSize(context).width / 2.7,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'ПОИСК',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
              style: ElevatedButton.styleFrom(
                primary: Style.orange,
                elevation: 0,
                padding: const EdgeInsets.only(top: 2.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///SavedSearchPage
class SavedSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return EmptySavedSearch();
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final application = SAVED_SEARCH[index];
          return SavedSearchCard(
            savedSearch: application,
          );
        },
        itemCount: APPLICATIONS.length);
  }
}

///Saved Search Card
class SavedSearchCard extends StatelessWidget {
  final Map<String, dynamic> savedSearch;

  const SavedSearchCard({Key key, this.savedSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                color: Style.orange,
              ),
              width: 4,
              height: 110),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// top section
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${savedSearch['name']}',
                        style: TextStyle(
                          color: Style.orange,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showDeleteSavedSearchDialog(context);
                        },
                        child: Icon(
                          LineIcons.heartAlt,
                          color: Colors.red,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                  child: const MySeparator(),
                ),

                /// middle section
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        savedSearch['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        savedSearch['flat'],
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            savedSearch['area'],
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),

                          ///Button
                          Container(
                            alignment: Alignment.centerRight,
                            height: 24,
                            margin: const EdgeInsets.only(right: 16),
                            child: ElevatedButton(
                              onPressed: () {
                                //SearchResultScreen

                                pushNewScreen(context,
                                    screen: SearchResultScreen());
                              },
                              child: Text(
                                'Выбрать',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Style.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                elevation: 0,
                                padding: EdgeInsets.symmetric(horizontal: 28),
                              ),
                            ),
                          ),
                        ],
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

///Separator Design
class MySeparator extends StatelessWidget {
  final double height;
  final Color color;

  const MySeparator({
    this.height = 1,
    this.color = Colors.black26,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 2.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}

///Delete Saved Search Dialog
void showDeleteSavedSearchDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (c) {
      return AlertDialog(
        content: Container(
          width: Global.getSize(c).width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 24),
              Text(
                'Удалить Ваш сохраненный поиск?',
                style: TextStyle(
                    fontSize: 14,
                    color: Style.blue,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 36),

              /// delete button
              Container(
                width: Global.getSize(c).width / 1.5,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(c),
                  child: Text(
                    'УДАЛИТЬ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Style.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                ),
              ),

              ///Otmena Button
              Container(
                width: Global.getSize(c).width / 1.5,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(c),
                  child: FittedBox(
                    child: Text(
                      'ОТМЕНА',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).canvasColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Style.blue,
                        width: 1,
                      ),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
        insetPadding: const EdgeInsets.all(16),
      );
    },
  );
}
