import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class SmallInfoBoxWidget extends StatefulWidget {
  SmallInfoBoxWidget({Key? key}) : super(key: key);

  @override
  _SmallInfoBoxWidgetState createState() => _SmallInfoBoxWidgetState();
}

class _SmallInfoBoxWidgetState extends State<SmallInfoBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
      child: Container(
        width: 170,
        height: 280,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://picsum.photos/seed/464/600',
                width: MediaQuery.of(context).size.width,
                height: 210,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Text(
                'ЖК Ботанический',
                style: FlutterFlowTheme.titleTextWDark.copyWith(),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
              child: Text(
                '3 комнатная  •  78 м',
                style: FlutterFlowTheme.bodyTextDark.copyWith(),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
              child: Text(
                '34 000 000 ₸',
                style: FlutterFlowTheme.subtitleTextDark.copyWith(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
