// TODO(nrikiji): とりあえずのものおきば
import 'package:flutter/material.dart';
import 'package:flutter_browser/screen/startup_screen.dart';
import 'package:page_transition/page_transition.dart';

class UtilHelper {
  // URLからホスト名を返す
  static String url2host(String value) {
    String host = value.replaceAll("http://", "");
    host = host.replaceAll("https://", "");

    String host2 = Uri.parse("https://$host").host;
    host2 = Uri.decodeComponent(host2);

    var urlPattern =
        r"https://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";
    var result =
        RegExp(urlPattern, caseSensitive: false).firstMatch("https://$host2");

    if (host2.isEmpty || result == null) {
      return null;
    }
    return host2;
  }

  static navigatorPopCount(context, count) {
    int i = 0;
    Navigator.popUntil(context, (route) => i++ == count);
  }

  static showSimpleDialog(
      BuildContext context, String title, String message) async {
    final alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        FlatButton(
          child: Text("OK"),
          onPressed: Navigator.of(context).pop,
        ),
      ],
    );

    await showDialog(
      context: context,
      builder: (BuildContext context) => alert,
    );
  }

  static showStartupScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(
      PageTransition(
        child: StartupScreen(),
        type: PageTransitionType.fade,
      ),
    );
  }
}
