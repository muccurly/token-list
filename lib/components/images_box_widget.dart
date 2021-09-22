import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImagesBoxWidget extends StatefulWidget {
  ImagesBoxWidget({Key key}) : super(key: key);

  @override
  _ImagesBoxWidgetState createState() => _ImagesBoxWidgetState();
}

class _ImagesBoxWidgetState extends State<ImagesBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Image.network(
                    'https://picsum.photos/seed/308/600',
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Image.network(
                    'https://picsum.photos/seed/308/600',
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Image.network(
                    'https://picsum.photos/seed/308/600',
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
