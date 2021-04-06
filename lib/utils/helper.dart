import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrl(String url) async {
  try {
    if (await canLaunch(url)) await launch(url);
  } catch (e) {
    print(e);
  }
}
