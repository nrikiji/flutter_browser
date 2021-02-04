import 'package:flutter_riverpod/all.dart';
import 'package:flutter_browser/controller/app/app_state.dart';
import 'package:flutter_browser/helper/database_helper.dart';

class AppController extends StateNotifier<AppState> with LocatorMixin {
  AppController() : super(AppState(initialized: false)) {
    DataBaseHelper.initialize().then((_) {
      state = state.copyWith.call(initialized: true);
    });
  }

  void setLastKeyword(String value) {
    state = state.copyWith.call(lastKeyword: value);
  }
}
