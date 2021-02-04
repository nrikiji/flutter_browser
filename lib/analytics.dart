import 'package:firebase_analytics/firebase_analytics.dart';

class Analytics {
  static String _isEventType;
  static final FirebaseAnalytics analytics = FirebaseAnalytics();

  static Future analyticsLogEvent(AnalyticsEventType eventType) async {
    _isEventType = await _enumToString(eventType);
    await analytics.logEvent(name: _isEventType);
  }

  static Future _enumToString(eventType) async {
    return eventType.toString().split('.')[1];
  }
}

enum AnalyticsEventType {
  search,
  registerHost,
  registerHostBrowser,
  registerHostSearchBrowser,
  editHost,
  deleteHost,
  selectIncludeHost,
  selectExcludeHost,
  selectSearchEngine,
  selectSearchTypeInclude,
  selectSearchTypeExclude,
}
