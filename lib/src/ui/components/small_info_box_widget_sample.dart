import 'package:flutter/material.dart';

import '../flutter_flow/flutter_flow_theme.dart';

class SmallInfoBoxWidgetSample extends StatefulWidget {
  SmallInfoBoxWidgetSample({Key? key}) : super(key: key);

  @override
  _SmallInfoBoxWidgetSampleState createState() => _SmallInfoBoxWidgetSampleState();
}

class _SmallInfoBoxWidgetSampleState extends State<SmallInfoBoxWidgetSample> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
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
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Text(
                'ЖК Ботанический',
                style: FlutterFlowTheme.titleTextWDark.copyWith(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
              child: Text(
                '3 комнатная  •  78 м',
                style: FlutterFlowTheme.bodyTextDark.copyWith(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
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