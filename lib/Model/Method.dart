import 'package:mySite/staticData.dart';
import 'package:url_launcher/url_launcher.dart';

class Method {
  static launchURL(String link) async {
    var url = link;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static launchCaller() async {
    const url = "tel:" + Strings.telephone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static launchEmail() async {
    if (await canLaunch("mailto:" + Strings.emailId)) {
      await launch("mailto:" + Strings.emailId);
    } else {
      throw 'Could not launch';
    }
  }
}
