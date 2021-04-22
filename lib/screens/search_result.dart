import 'package:flutter/material.dart';
import 'package:jurta/screens/screens.dart';
import 'package:jurta/utils/utils.dart';
import 'package:line_icons/line_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class SearchResultScreen extends StatefulWidget {
  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  String _selectedSort;

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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                      Icon(LineIcons.arrowLeft, size: 20),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0, left: 4.0),
                        child: Text(
                          'РЕЗУЛЬТАТ ПОИСКА',
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
              actions: [
                SortAction(
                  selectedSort: _selectedSort,
                  setSelectedSort: (text) =>
                      setState(() => _selectedSort = text),
                ),
              ],
              snap: true,
              floating: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(74),
                child: Column(
                  children: [
                    /// search field
                    Container(
                      height: kToolbarHeight / 1.7,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.center,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                          ),
                          hintText: 'Поиск',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 14,
                          ),
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: ImageIcon(
                                    AssetImage('assets/images/search.png'),
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    /// tab
                    TabBar(
                      controller: _tabController,
                      tabs: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'СПИСОК',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'КАРТА',
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
                  /// list
                  GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 5 / 9,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 0,
                    ),
                    itemBuilder: (context, index) {
                      final advert = ADVERTS[index];
                      return AdvertCardNew(advert: advert, index: index);
                      // return AdvertCard(advert: advert);
                    },
                    itemCount: ADVERTS.length,
                  ),

                  /// map
                  YandexMapWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class YandexMapWidget extends StatefulWidget {
  @override
  _YandexMapWidgetState createState() => _YandexMapWidgetState();
}

class _YandexMapWidgetState extends State<YandexMapWidget> {
  YandexMapController _mapController;

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: YandexMap(
            onMapCreated: (controller) {
              _mapController = controller;
              controller.move(
                point: Point(latitude: 51.128507, longitude: 71.434613),
                zoom: 15,
              );
            },
          ),
        ),

        /// buttons on the right
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// pen
                Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400, width: 1),
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    child: Icon(Icons.edit_outlined)),
                const SizedBox(height: 16),

                /// my location
                Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400, width: 1),
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    child: Icon(Icons.near_me_sharp)),
                const SizedBox(height: 16),

                /// zoom in
                InkWell(
                  onTap: () {
                    _mapController?.zoomIn();
                  },
                  child: Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.grey.shade400, width: 1),
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.white,
                      ),
                      alignment: Alignment.center,
                      child: Icon(Icons.add)),
                ),

                /// zoom out
                InkWell(
                  onTap: () {
                    _mapController?.zoomOut();
                  },
                  child: Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.5),
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.white,
                      ),
                      alignment: Alignment.center,
                      child: Icon(Icons.horizontal_rule)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AdvertCard extends StatefulWidget {
  final Map<String, dynamic> advert;
  final String from;

  const AdvertCard({Key key, this.advert, this.from = 'default'})
      : super(key: key);

  @override
  _AdvertCardState createState() => _AdvertCardState();
}

class _AdvertCardState extends State<AdvertCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushNewScreenWithRouteSettings(
          context,
          screen: AdvertDetailsScreen(),
          settings: RouteSettings(
            name: AdvertDetailsScreen.route,
            arguments: widget.advert,
          ),
          withNavBar: false,
        );
      },
      child: Card(
        elevation: widget.from == 'related' ? 0 : 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        margin: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: widget.from == 'related' ? 16 : 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// images
            Container(
              height: Global.getSize(context).width / 2,
              child: widget.from == 'related'
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Image.network(
                        widget.advert['images'][0],
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 2.0),
                            child: Image.network(
                              widget.advert['images'][0],
                              height: double.infinity,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 1.0),
                                  child: Image.network(
                                    widget.advert['images'][1],
                                    height: double.infinity,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 1.0),
                                  child: Image.network(
                                    widget.advert['images'][2],
                                    height: double.infinity,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),

            /// detail info
            Row(
              children: [
                /// info
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: '${widget.advert['title']}, ',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: 'HelveticaNeueCyr',
                            ),
                            children: [
                              TextSpan(
                                text: '${widget.advert['price']}',
                                style: TextStyle(
                                  color: Style.orange,
                                ),
                              ),
                            ],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${widget.advert['rooms']}-комнатная квартира • ${widget.advert['flat']} • ${widget.advert['area']}',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),

                /// like and share
                Row(
                  children: [
                    /// like
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.advert['is_fav'] = !widget.advert['is_fav'];
                        });
                      },
                      child: Icon(
                        widget.advert['is_fav']
                            ? LineIcons.heartAlt
                            : LineIcons.heart,
                        color: widget.advert['is_fav'] ? Colors.red : null,
                      ),
                      behavior: HitTestBehavior.opaque,
                    ),
                    const SizedBox(width: 4),

                    /// share
                    Container(
                      padding: const EdgeInsets.only(right: 16, left: 4),
                      child: GestureDetector(
                        onTap: () => share("Check it out!", subject: "Jurta"),
                        child: ImageIcon(
                          AssetImage('assets/images/share.png'),
                          size: 20,
                        ),
                        behavior: HitTestBehavior.opaque,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AdvertCardNew extends StatelessWidget {
  final Map<String, dynamic> advert;
  final int index;
  final bool favorite;

  const AdvertCardNew({
    Key key,
    this.advert,
    this.index,
    this.favorite = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: (Global.getSize(context).width / 2 - 20) / 3 * 4,
              width: Global.getSize(context).width / 2 - 20,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      advert['images'][index % 3],
                      height: (Global.getSize(context).width / 2 - 20) / 3 * 4,
                      width: Global.getSize(context).width / 2 - 20,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (favorite)
                    Align(
                      // right: 8,
                      // bottom: 8,
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/like_filled.png',
                          height: 18,
                          width: 18,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            advert['title'],
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            '${advert['rooms']} ком • ${advert['flat']} • ${advert['area']}',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            advert['price'],
            style: TextStyle(
              color: Style.orange,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class SortAction extends StatelessWidget {
  final String selectedSort;
  final Function(String text) setSelectedSort;

  const SortAction({
    Key key,
    this.selectedSort,
    this.setSelectedSort,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showSortDialog(
          context,
          selectedSort,
          setSelectedSort,
        );
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text(
                  'СОРТИРОВКА',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              ImageIcon(
                AssetImage('assets/images/sort.png'),
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showSortDialog(
  BuildContext context,
  String selectedSort,
  Function(String text) setSelectedSort,
) {
  showGeneralDialog(
    context: context,
    pageBuilder: (c, _, __) {
      return SortWidget(
        selectedSort: selectedSort,
        setSelectedSort: setSelectedSort,
      );
    },
    barrierColor: Colors.grey.shade100.withOpacity(0.75),
  );
}

class SortWidget extends StatelessWidget {
  final String selectedSort;
  final Function(String text) setSelectedSort;

  const SortWidget({this.selectedSort, this.setSelectedSort});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            behavior: HitTestBehavior.opaque,
            child: Container(
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.all(16),
              // height: Global.getSize(context).width * 1.2,
              constraints: BoxConstraints(
                  maxHeight: Global.getSize(context).width * 1.2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  /// close button
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ImageIcon(
                          AssetImage('assets/images/close.png'),
                          size: 16,
                        ),
                      ),
                    ),
                  ),

                  /// title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 46.0),
                    child: Text(
                      'Сортировать по',
                      style: TextStyle(
                        color: Style.orange,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 24),

                  ...SORT_BY
                      .map(
                        (text) => GestureDetector(
                          onTap: () {
                            setSelectedSort(text);
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: selectedSort == text ? Style.orange : null,
                              borderRadius:
                                  SORT_BY.indexOf(text) == SORT_BY.length - 1
                                      ? BorderRadius.only(
                                          bottomLeft: Radius.circular(16),
                                          bottomRight: Radius.circular(16))
                                      : null,
                            ),
                            padding: const EdgeInsets.fromLTRB(32, 12, 16, 12),
                            child: Row(
                              children: [
                                Icon(Icons.brightness_1,
                                    size: 8,
                                    color: selectedSort == text
                                        ? Colors.white
                                        : Colors.transparent),
                                const SizedBox(width: 8),
                                Text(
                                  text,
                                  style: TextStyle(
                                    color: selectedSort == text
                                        ? Colors.white
                                        : null,
                                    fontWeight: selectedSort == text
                                        ? FontWeight.w700
                                        : FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
