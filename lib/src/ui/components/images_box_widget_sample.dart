import 'package:flutter/material.dart';

class ImagesBoxWidgetSample extends StatefulWidget {
  ImagesBoxWidgetSample({
    Key? key,
  }) : super(key: key);

  @override
  _ImagesBoxWidgetSampleState createState() => _ImagesBoxWidgetSampleState();
}

class _ImagesBoxWidgetSampleState extends State<ImagesBoxWidgetSample> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      width: _size.width,
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
                    width: _size.width,
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
                    width: _size.width,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Image.network(
                    'https://picsum.photos/seed/308/600',
                    width: _size.width,
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
