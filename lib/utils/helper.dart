import 'package:jurta/utils/log.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'package:flutter/services.dart';

Future<void> launchUrl(String url) async {
  try {
    if (await canLaunch(url)) await launch(url);
  } catch (e) {
    log(e);
  }
}

void share(String text, {String subject = "Jurta"}) {
  try {
    Share.share(text, subject: subject);
  } on PlatformException {
    log('share Exception occured: PlatformException');
  } on FormatException {
    log('share Exception occured: FormatException');
  } catch (error, stacktrace) {
    log('share Exception occured: $error stackTrace: $stacktrace');
  }
}
