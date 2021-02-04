// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SettingsStateTearOff {
  const _$SettingsStateTearOff();

// ignore: unused_element
  _Create call({Setting setting, List<Host> hosts}) {
    return _Create(
      setting: setting,
      hosts: hosts,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SettingsState = _$SettingsStateTearOff();

/// @nodoc
mixin _$SettingsState {
  Setting get setting;
  List<Host> get hosts;

  @JsonKey(ignore: true)
  $SettingsStateCopyWith<SettingsState> get copyWith;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res>;
  $Res call({Setting setting, List<Host> hosts});
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  final SettingsState _value;
  // ignore: unused_field
  final $Res Function(SettingsState) _then;

  @override
  $Res call({
    Object setting = freezed,
    Object hosts = freezed,
  }) {
    return _then(_value.copyWith(
      setting: setting == freezed ? _value.setting : setting as Setting,
      hosts: hosts == freezed ? _value.hosts : hosts as List<Host>,
    ));
  }
}

/// @nodoc
abstract class _$CreateCopyWith<$Res> implements $SettingsStateCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) then) =
      __$CreateCopyWithImpl<$Res>;
  @override
  $Res call({Setting setting, List<Host> hosts});
}

/// @nodoc
class __$CreateCopyWithImpl<$Res> extends _$SettingsStateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(_Create _value, $Res Function(_Create) _then)
      : super(_value, (v) => _then(v as _Create));

  @override
  _Create get _value => super._value as _Create;

  @override
  $Res call({
    Object setting = freezed,
    Object hosts = freezed,
  }) {
    return _then(_Create(
      setting: setting == freezed ? _value.setting : setting as Setting,
      hosts: hosts == freezed ? _value.hosts : hosts as List<Host>,
    ));
  }
}

/// @nodoc
class _$_Create with DiagnosticableTreeMixin implements _Create {
  _$_Create({this.setting, this.hosts});

  @override
  final Setting setting;
  @override
  final List<Host> hosts;

  bool _didincludeHosts = false;
  List<Host> _includeHosts;

  @override
  List<Host> get includeHosts {
    if (_didincludeHosts == false) {
      _didincludeHosts = true;
      _includeHosts = hosts.where((x) => x.include).toList(growable: false);
    }
    return _includeHosts;
  }

  bool _didexcludeHosts = false;
  List<Host> _excludeHosts;

  @override
  List<Host> get excludeHosts {
    if (_didexcludeHosts == false) {
      _didexcludeHosts = true;
      _excludeHosts = hosts.where((x) => x.exclude).toList(growable: false);
    }
    return _excludeHosts;
  }

  bool _didincludeHostName = false;
  String _includeHostName;

  @override
  String get includeHostName {
    if (_didincludeHostName == false) {
      _didincludeHostName = true;
      _includeHostName = 3 <= includeHosts.length
          ? includeHosts.sublist(0, 3).map((x) => x.name).join(" ")
          : includeHosts.map((x) => x.name).join(" ");
    }
    return _includeHostName;
  }

  bool _didexcludeHostName = false;
  String _excludeHostName;

  @override
  String get excludeHostName {
    if (_didexcludeHostName == false) {
      _didexcludeHostName = true;
      _excludeHostName = 3 <= excludeHosts.length
          ? excludeHosts.sublist(0, 3).map((x) => x.name).join(" ")
          : excludeHosts.map((x) => x.name).join(" ");
    }
    return _excludeHostName;
  }

  bool _didisIncludeHostMore = false;
  bool _isIncludeHostMore;

  @override
  bool get isIncludeHostMore {
    if (_didisIncludeHostMore == false) {
      _didisIncludeHostMore = true;
      _isIncludeHostMore = 3 < includeHosts.length;
    }
    return _isIncludeHostMore;
  }

  bool _didisExcludeHostMore = false;
  bool _isExcludeHostMore;

  @override
  bool get isExcludeHostMore {
    if (_didisExcludeHostMore == false) {
      _didisExcludeHostMore = true;
      _isExcludeHostMore = 3 < excludeHosts.length;
    }
    return _isExcludeHostMore;
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SettingsState(setting: $setting, hosts: $hosts, includeHosts: $includeHosts, excludeHosts: $excludeHosts, includeHostName: $includeHostName, excludeHostName: $excludeHostName, isIncludeHostMore: $isIncludeHostMore, isExcludeHostMore: $isExcludeHostMore)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SettingsState'))
      ..add(DiagnosticsProperty('setting', setting))
      ..add(DiagnosticsProperty('hosts', hosts))
      ..add(DiagnosticsProperty('includeHosts', includeHosts))
      ..add(DiagnosticsProperty('excludeHosts', excludeHosts))
      ..add(DiagnosticsProperty('includeHostName', includeHostName))
      ..add(DiagnosticsProperty('excludeHostName', excludeHostName))
      ..add(DiagnosticsProperty('isIncludeHostMore', isIncludeHostMore))
      ..add(DiagnosticsProperty('isExcludeHostMore', isExcludeHostMore));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Create &&
            (identical(other.setting, setting) ||
                const DeepCollectionEquality()
                    .equals(other.setting, setting)) &&
            (identical(other.hosts, hosts) ||
                const DeepCollectionEquality().equals(other.hosts, hosts)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(setting) ^
      const DeepCollectionEquality().hash(hosts);

  @JsonKey(ignore: true)
  @override
  _$CreateCopyWith<_Create> get copyWith =>
      __$CreateCopyWithImpl<_Create>(this, _$identity);
}

abstract class _Create implements SettingsState {
  factory _Create({Setting setting, List<Host> hosts}) = _$_Create;

  @override
  Setting get setting;
  @override
  List<Host> get hosts;
  @override
  @JsonKey(ignore: true)
  _$CreateCopyWith<_Create> get copyWith;
}
