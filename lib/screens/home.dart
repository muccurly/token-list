import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jurta/providers/providers.dart';
import 'package:jurta/utils/utils.dart';
import 'package:jurta/widgets/widgets.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // String _headerSelected = _headerTexts[0];

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _sKey = GlobalKey<ScaffoldState>();
    final notch = MediaQuery.of(context).viewPadding.top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        key: _sKey,
        endDrawer: DrawerWrapper(type: DrawerType.filter),
        body: Stack(
          children: [
            /// background image
            Positioned.fill(
              child: Image.asset(
                'assets/images/bg.png',
                fit: BoxFit.cover,
              ),
            ),

            /// header fade
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.black.withOpacity(0)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),

            /// bottom fade
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.black.withOpacity(0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),

            /// header
            Positioned(
              top: notch + 16,
              left: 0,
              right: 16,
              child: Row(
                children: [
                  /// jurta image
                  Container(
                    height: 34,
                    // width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      color: Style.blue,
                    ),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                    child: Image.asset(
                      'assets/images/logo.png',
                      color: Colors.white,
                      height: 26,
                    ),
                  ),
                  Spacer(),

                  /// filter old
                  /* Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      height: 30,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: _headerTexts.map(
                          (text) {
                            return Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _headerSelected = text;
                                    });
                                  },
                                  child: Text(
                                    text,
                                    style: TextStyle(
                                      color: _headerSelected == text
                                          ? Colors.white
                                          : Colors.grey.shade300,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                if (text != _headerTexts[2])
                                  Container(
                                    width: 1,
                                    height: 20,
                                    color: Colors.white,
                                    margin:
                                        const EdgeInsets.symmetric(horizontal: 8),
                                  ),
                              ],
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ), */

                  /// filter new
                  GestureDetector(
                    onTap: () {
                      _sKey.currentState.openEndDrawer();
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Фильтр',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 4),
                        ImageIcon(
                          AssetImage('assets/images/sort.png'),
                          color: Colors.white,
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// bottom
            Positioned(
              left: 16,
              right: 16,
              bottom: 32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      child: Text(
                        'Записаться на показ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'ЖК Bi City Seoul, 29 500 000 T',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '4-комнатная квартира • 4 из 9 • 127 м',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Нур-Султан, Есильский район\nул. Сауран, 18',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            /// right
            Positioned(
              right: 16,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      /// avatar
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1527585743534-7113e3211270?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=100&q=80',
                            height: 36,
                            width: 36,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      /// call
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.call,
                          color: Colors.white,
                        ),
                        // ImageIcon(
                        //   AssetImage('assets/images/like_filled.png'),
                        //   size: 30,
                        //   color: Colors.white,
                        // ),
                      ),
                      const SizedBox(height: 12),

                      /// like
                      GestureDetector(
                        onTap: () {},
                        child: ImageIcon(
                          AssetImage('assets/images/like_filled.png'),
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),

                      /// comments
                      GestureDetector(
                        onTap: () {
                          _showCommentsBottomSheet(_sKey, context);
                        },
                        child: ImageIcon(
                          AssetImage('assets/images/comment.png'),
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),

                      /// share
                      GestureDetector(
                        onTap: () {},
                        child: ImageIcon(
                          AssetImage('assets/images/share.png'),
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 36),
                    ],
                  ),
                  Container(
                    height: 28,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Подробнее',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Positioned(top: 0, bottom: 0, right: 0, child: MenuDrawer()),
          ],
        ),
      ),
    );
  }
}

Future<void> _showCommentsBottomSheet(
  GlobalKey<ScaffoldState> gKey,
  BuildContext context,
) async {
  /// hide navbar when comment bottom sheet is shown
  Provider.of<TabProvider>(context, listen: false).hideNavBar = true;

  await showModalBottomSheet(
    context: context,
    builder: (c) {
      return CommentBottomSheet(c: c);
    },
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    elevation: 20,
    backgroundColor: Theme.of(context).canvasColor,
    isDismissible: false,
    enableDrag: false,
  );

  /// show navbar again
  Provider.of<TabProvider>(context, listen: false).hideNavBar = false;
}

class CommentBottomSheet extends StatefulWidget {
  final BuildContext c;

  const CommentBottomSheet({
    Key key,
    this.c,
  }) : super(key: key);

  @override
  _CommentBottomSheetState createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  final TextEditingController _commentC = TextEditingController();

  @override
  void dispose() {
    _commentC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        height: Global.getSize(context).height * 0.75,
        // color: Theme.of(c).canvasColor,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  child: Icon(
                    LineIcons.circle,
                    color: Colors.transparent,
                  ),
                ),
                Text(
                  '${COMMENTS.length} комментариев',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(widget.c),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12.0),
                    child: ImageIcon(
                      AssetImage('assets/images/close.png'),
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),

            /// list of comments
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                itemCount: COMMENTS.length,
                itemBuilder: (c, i) {
                  final comment = COMMENTS[i];
                  return CommentListTile(comment: comment);
                },
              ),
            ),

            /// add comment form field
            Divider(
              height: 0,
              thickness: 1,
              color: Colors.grey.shade300,
            ),
            Row(
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
                      // suffixIcon: InkWell(
                      //   onTap: () => _sendComment(commentC, setState, context),
                      //   child: Icon(
                      //     LineIcons.paperPlaneAlt,
                      //     color: Style.blue,
                      //   ),
                      // ),
                      // suffix: SizedBox(width: 32),
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
          ],
        ),
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

class CommentListTile extends StatelessWidget {
  final Map<String, dynamic> comment;
  final bool reply;
  final bool padding;

  const CommentListTile({
    Key key,
    this.comment,
    this.reply = false,
    this.padding = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ? 8.0 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            margin: EdgeInsets.only(left: reply ? 16 : 0, top: 4, bottom: 4),
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(comment['image']),
                  radius: 16,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        comment['name'],
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(comment['comment']),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (comment['replies'] != null || comment['replies'].isNotEmpty)
            ...comment['replies']
                .map((reply) => CommentListTile(comment: reply, reply: true))
                .toList()
        ],
      ),
    );
  }
}

const List<String> _headerTexts = <String>['Горящие', 'Без комиссии', 'Новые'];