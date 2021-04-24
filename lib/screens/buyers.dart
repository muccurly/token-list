import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jurta/utils/global.dart';
import 'package:jurta/utils/style.dart';
import 'package:jurta/utils/utils.dart';

class Buyers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final application = BUYERS[index];
              return BuyersCard(
                buyers: application,
              );
            },
            itemCount: BUYERS.length,
          ),
        ),
      ),
    );
  }
}

// child: ListView(
//             padding: const EdgeInsets.all(16),
//             children: [
//               const SizedBox(height: 12),
//               Text(
//                 'Покупатели',
//                 style: TextStyle(
//                   color: Style.blue,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 16,
//                 ),
//               ),

//               /// продам сам кнопка
//               Container(
//                 height: 55,
//                 width: Global.getSize(context).width,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   child: Text(
//                     'ПРОДАМ САМ',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     primary: Style.orange,
//                     elevation: 0,
//                     padding: const EdgeInsets.only(top: 2.0),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(7),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 12),

//               /// продайте мне кнопка
//               Container(
//                 height: 55,
//                 width: Global.getSize(context).width,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   child: Text(
//                     'ПРОДАЙТЕ МНЕ',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w700,
//                       fontSize: 16,
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     primary: Style.blue,
//                     elevation: 0,
//                     padding: const EdgeInsets.only(top: 2.0),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(7),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),

///Buyers Card
class BuyersCard extends StatelessWidget {
  final Map<String, dynamic> buyers;

  const BuyersCard({Key key, this.buyers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black26, width: 0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(32, 19, 18, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// top section
            Text(
              'Заявка на ${buyers['name']}',
              style: TextStyle(
                color: Style.orange,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),

            /// middle section
            Text(
              buyers['address'],
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w300,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Бюджет: ${buyers['price']}',
                  style: TextStyle(
                    color: Style.orange,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${DateFormat('kk:mm, dd.MM.yyyy').format(buyers['date'])}',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),

            /// bottom section
          ],
        ),
      ),
    );
  }
}
