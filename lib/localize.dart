import 'package:flutter/cupertino.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ja'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async =>
      AppLocalizations(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

class AppLocalizations {
  final Messages messages;

  AppLocalizations(Locale locale) : this.messages = Messages.of(locale);

  static Messages of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)
        .messages;
  }
}

class Messages {
  final String cancel;
  final String confirm;
  final String error;
  final String register;
  final String unit;
  final String confirmDelete;
  final String confirmRegister;
  final String confirmRegister2;
  final String excludeHost;
  final String searchKeyword;
  final String settings;
  final String basicSetting;
  final String registeredWebsites;
  final String registrationMethod;
  final String registerWebsite;
  final String editWebsite;
  final String urlOrHostName;
  final String urlOrHostNameExample;
  final String websiteName;
  final String websiteNameExample;
  final String launchBrowser;
  final String enterManually;
  final String howToSearch;
  final String registerThisWebsite;
  final String searchMethod1;
  final String searchMethod2;
  final String searchEngine;
  final String searchEngineGoogle;
  final String searchEngineGoogleUrl;
  final String searchEngineBing;
  final String searchEngineBingUrl;
  final String searchEngineYahoo;
  final String searchEngineYahooUrl;
  final String letsSearch;
  final String startupCaption;
  final String startupIncludeCaption;
  final String startupIncludeCaption2;
  final String startupExcludeCaption;
  final String startupExcludeCaption2;
  final String startupNotFoundCaption;
  final String invalidUrl;
  final String failedLoadWeb;
  final String hintRegisterHost;
  final String invalidRegisterHost;

  Messages({
    @required this.cancel,
    @required this.confirm,
    @required this.error,
    @required this.register,
    @required this.unit,
    @required this.confirmDelete,
    @required this.confirmRegister,
    @required this.confirmRegister2,
    @required this.excludeHost,
    @required this.searchKeyword,
    @required this.settings,
    @required this.basicSetting,
    @required this.registeredWebsites,
    @required this.registerWebsite,
    @required this.editWebsite,
    @required this.urlOrHostName,
    @required this.urlOrHostNameExample,
    @required this.websiteName,
    @required this.websiteNameExample,
    @required this.registrationMethod,
    @required this.launchBrowser,
    @required this.enterManually,
    @required this.howToSearch,
    @required this.registerThisWebsite,
    @required this.searchMethod1,
    @required this.searchMethod2,
    @required this.searchEngine,
    @required this.searchEngineGoogle,
    @required this.searchEngineGoogleUrl,
    @required this.searchEngineBing,
    @required this.searchEngineBingUrl,
    @required this.searchEngineYahoo,
    @required this.searchEngineYahooUrl,
    @required this.letsSearch,
    @required this.startupCaption,
    @required this.startupIncludeCaption,
    @required this.startupIncludeCaption2,
    @required this.startupExcludeCaption,
    @required this.startupExcludeCaption2,
    @required this.startupNotFoundCaption,
    @required this.invalidUrl,
    @required this.failedLoadWeb,
    @required this.hintRegisterHost,
    @required this.invalidRegisterHost,
  });

  factory Messages.of(Locale locale) {
    switch (locale.languageCode) {
      case 'ja':
        return Messages.ja();
      case 'en':
        return Messages.en();
      default:
        return Messages.en();
    }
  }

  factory Messages.ja() => Messages(
        cancel: 'キャンセル',
        confirm: '確認',
        error: 'エラー',
        register: '登録',
        unit: "個",
        confirmDelete: '削除してもよろしいですか？',
        confirmRegister: 'このWebサイトを登録してもよろしいですか？',
        confirmRegister2: 'このWebサイトを登録しますか？',
        excludeHost: '検索結果から除外する',
        searchKeyword: '検索キーワードを入力',
        settings: '設定',
        basicSetting: '基本設定',
        registeredWebsites: '登録中のWebサイト',
        registrationMethod: '登録方法を選択してください',
        registerWebsite: 'Webサイトを登録',
        editWebsite: 'Webサイトを編集',
        urlOrHostName: 'WebサイトURLまたはホスト名（必須）',
        urlOrHostNameExample: '例）www.instagram.com や https://www.instagram.com',
        websiteName: 'Webサイト名（任意）',
        websiteNameExample: '例）インスタグラム',
        launchBrowser: 'ブラウザ起動',
        enterManually: '手動で入力',
        howToSearch: '検索方法',
        registerThisWebsite: 'このWebサイトを登録',
        searchMethod1: '設定したWebサイトから検索',
        searchMethod2: '設定したWebサイトを除外して検索',
        searchEngine: '検索エンジン',
        searchEngineGoogle: 'Google',
        searchEngineGoogleUrl: 'https://www.google.com/search?q=',
        searchEngineBing: 'Bing',
        searchEngineBingUrl: 'https://www.bing.com/search?q=',
        searchEngineYahoo: 'Yahoo',
        searchEngineYahooUrl: 'https://search.yahoo.co.jp/search?p=',
        letsSearch: "キーワードで検索しよう",
        startupCaption: "Webサイト内検索と検索結果から指定したWebサイトを簡単に除外するためのブラウザです",
        startupIncludeCaption: "現在、%s と他 から検索するように設定されています",
        startupIncludeCaption2: "現在、%s から検索するように設定されています",
        startupExcludeCaption: "現在、%s と他 を検索結果から除外するように設定されています",
        startupExcludeCaption2: "現在、%s を検索結果から除外するように設定されています",
        startupNotFoundCaption: "現在、何も設定されていません。設定画面より設定してください。",
        invalidUrl: "URLが正しくありません",
        failedLoadWeb: "ページの読み込みに失敗しました",
        hintRegisterHost: "サブドメインを含めない方が期待する検索結果となることがあります。\n"
            "例）www.youtube.com より youtube.com ",
        invalidRegisterHost: "このサイトは登録できません",
      );

  factory Messages.en() => Messages(
        cancel: 'Cancel',
        confirm: 'Confirm',
        error: 'Error',
        register: 'Register',
        unit: "",
        confirmDelete: 'Are you sure you want to delete this?',
        confirmRegister: 'May I register this Web site?',
        confirmRegister2: 'May I register this Web site?',
        excludeHost: 'Exclude from search results',
        searchKeyword: 'Search for keyword',
        settings: 'Settings',
        basicSetting: 'Basic Setting',
        registeredWebsites: 'Registered Websites',
        registrationMethod: 'Please select a registration method',
        editWebsite: 'Edit Website',
        registerWebsite: 'Register Website',
        urlOrHostName: 'Web site URL or host name (required)',
        urlOrHostNameExample:
            'Example: www.instagram.com or https://www.instagram.com',
        websiteName: 'Website name (optional)',
        websiteNameExample: 'Example: Instagram',
        launchBrowser: 'Launch browser',
        enterManually: 'Enter manually',
        howToSearch: 'How to search',
        registerThisWebsite: 'Register this website',
        searchMethod1: 'Search from a set websites.',
        searchMethod2: 'Exclude and search the websites you set.',
        searchEngine: 'Search Engine',
        searchEngineGoogle: 'Google',
        searchEngineGoogleUrl: 'https://www.google.com/search?q=',
        searchEngineBing: 'Bing',
        searchEngineBingUrl: 'https://www.bing.com/search?q=',
        searchEngineYahoo: 'Yahoo',
        searchEngineYahooUrl: 'https://search.yahoo.com/search?p=',
        letsSearch: "Let's search by keyword.",
        startupCaption:
            "A browser that allows you to search within a website and easily exclude specified websites from the search results",
        startupIncludeCaption:
            "It is currently set to search for %s and others.",
        startupIncludeCaption2: "It is currently set to search from %s",
        startupExcludeCaption:
            "It is currently set to exclude %s and others from the search results.",
        startupExcludeCaption2:
            "It is currently set to exclude %s from the search results.",
        startupNotFoundCaption:
            "There are currently no settings. Please set it from the setting screen.",
        invalidUrl: "The URL is incorrect.",
        failedLoadWeb: "Failed to load the web page.",
        hintRegisterHost:
            "Not including subdomains may result in the search results you expect.。\n"
            "Example: youtube.com from www.youtube.com ",
        invalidRegisterHost: "This site cannot be registered.",
      );
}
