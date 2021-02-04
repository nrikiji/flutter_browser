part of 'register_host_browser_screen.dart';

class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.fromLTRB(4, 8, 4, 8),
                child: InkWell(
                  child: Icon(Icons.keyboard_arrow_left, size: 28),
                  excludeFromSemantics: true,
                  onTap: context.read(_screenController).goBack,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.fromLTRB(4, 8, 4, 8),
                child: InkWell(
                  child: Icon(Icons.keyboard_arrow_right, size: 28),
                  excludeFromSemantics: true,
                  onTap: context.read(_screenController).goForward,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: RaisedButton(
                child: Text(
                  AppLocalizations.of(context).registerThisWebsite,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  showAlertDialog(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) async {
    final url = context.read(_screenController.state).currentUrl;
    final host = UtilHelper.url2host(url);

    if (HostRepository.searchEngineHosts.contains(host)) {
      await UtilHelper.showSimpleDialog(
        context,
        host,
        AppLocalizations.of(context).invalidRegisterHost,
      );
      return;
    }

    AlertDialog alert = AlertDialog(
      title: Text(host),
      content: Text(AppLocalizations.of(context).confirmRegister),
      actions: [
        FlatButton(
          child: Text(AppLocalizations.of(context).cancel),
          onPressed: Navigator.of(context).pop,
        ),
        FlatButton(
          child: Text(
            "OK",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () async {
            final url = context.read(_screenController.state).currentUrl;
            final host = UtilHelper.url2host(url);
            final name = host;

            await context.read(settingsController).registerHost(host, name);

            Analytics.analyticsLogEvent(AnalyticsEventType.registerHostBrowser);

            UtilHelper.navigatorPopCount(context, 2);
          },
        ),
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
