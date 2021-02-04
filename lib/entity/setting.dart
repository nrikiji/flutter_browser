class Setting {
  final SettingSearchEngineKind searchEngine;
  final SettingSearchTypeKind searchType;
  final DateTime createdAt;

  Setting({
    this.searchEngine,
    this.searchType,
    this.createdAt,
  });

  factory Setting.fromMap(Map<String, dynamic> map) {
    return Setting(
      searchEngine: SettingSearchEngineKindEx.fromMap(map["search_engine"]),
      searchType: SettingSearchTypeKindEx.fromMap(map["search_type"]),
      createdAt: DateTime.parse(map["created_at"]).toLocal(),
    );
  }
}

enum SettingSearchEngineKind {
  Google,
  Bing,
  Yahoo,
}

extension SettingSearchEngineKindEx on SettingSearchEngineKind {
  int get value {
    switch (this) {
      case SettingSearchEngineKind.Google:
        return 1;
      case SettingSearchEngineKind.Bing:
        return 2;
      case SettingSearchEngineKind.Yahoo:
        return 3;
      default:
        throw Exception();
    }
  }

  static SettingSearchEngineKind fromMap(dynamic value) {
    return SettingSearchEngineKind.values
        .firstWhere((x) => x.value == value, orElse: () => null);
  }
}

enum SettingSearchTypeKind {
  Include,
  Exclude,
}

extension SettingSearchTypeKindEx on SettingSearchTypeKind {
  int get value {
    switch (this) {
      case SettingSearchTypeKind.Include:
        return 1;
      case SettingSearchTypeKind.Exclude:
        return 2;
      default:
        throw Exception();
    }
  }

  static SettingSearchTypeKind fromMap(dynamic value) {
    return SettingSearchTypeKind.values
        .firstWhere((x) => x.value == value, orElse: () => null);
  }
}
