import 'package:flutter/material.dart';
import 'package:jurta/screens/screens.dart';
import 'package:jurta/utils/utils.dart';

class AdvertCommentScreen extends StatefulWidget {
  static const String route = 'advert_comment_screen';

  @override
  _AdvertCommentScreenState createState() => _AdvertCommentScreenState();
}

class _AdvertCommentScreenState extends State<AdvertCommentScreen> {
  final TextEditingController _commentC = TextEditingController();

  @override
  void dispose() {
    _commentC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final advert =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    return Scaffold(
      /* appBar: AppBar(
        title: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(LineIcons.arrowLeft, size: 20),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0, left: 4.0),
                  child: Text(
                    'ОБЪЕКТ',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        titleSpacing: 0,
      ), */
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
                        'ОБЪЕКТ',
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
              preferredSize: const Size.fromHeight(310),
              child: Column(
                children: [
                  /// image carousel
                  ImageCarousel(
                      advert: advert,
                      height: Global.getSize(context).width / 1.8),

                  /// advert info
                  Container(
                    padding: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 0.05),
                          blurRadius: 1,
                        )
                      ],
                    ),
                    child: MainInfoWidget(advert: advert),
                  ),
                ],
              ),
            ),
          ),

          /// comments list
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (c, index) {
                final comment = COMMENTS[index];

                return CommentListTile(comment: comment, padding: true);
              },
              childCount: COMMENTS.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            height: 0,
            thickness: 1,
            color: Colors.grey.shade300,
          ),
          Container(
            color: Colors.white,
            padding:
                EdgeInsets.only(bottom: Global.getViewPadding(context).bottom),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _commentC,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      hintText: 'Добавить комментарий...',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 12,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.all(16),
                    ),
                  ),
                ),
                Material(
                  color: Colors.white,
                  child: IconButton(
                    onPressed: () => _sendComment(_commentC, setState, context),
                    icon: ImageIcon(
                      AssetImage('assets/images/send_plane.png'),
                      color: Style.blue,
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

void _sendComment(
  TextEditingController commentC,
  Function setState,
  BuildContext context,
) {
  if (commentC.text != null && commentC.text.isNotEmpty) {
    FocusScope.of(context).unfocus();
    final myComment = {
      'id': 10 + COMMENTS.length,
      'image':
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
      'name': 'Jane Doe',
      'comment': commentC.text,
      'replies': [],
    };
    COMMENTS.insert(0, myComment);
    commentC?.clear();
    setState(() {});
  }
}
