import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchResultBoxWidget extends StatefulWidget {
  SearchResultBoxWidget({Key key}) : super(key: key);

  @override
  _SearchResultBoxWidgetState createState() => _SearchResultBoxWidgetState();
}

class _SearchResultBoxWidgetState extends State<SearchResultBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
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
            Text(
              'ЖК Ботанический',
              style: GoogleFonts.getFont(
                'Roboto',
                color: FlutterFlowTheme.dark,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
              child: Text(
                '3 комнатная  •  78 м',
                style: GoogleFonts.getFont(
                  'Roboto',
                  color: FlutterFlowTheme.dark,
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
              child: Text(
                '34 000 000 ₸',
                style: GoogleFonts.getFont(
                  'Roboto',
                  color: FlutterFlowTheme.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
