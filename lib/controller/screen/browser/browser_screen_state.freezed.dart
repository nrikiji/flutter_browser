// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'browser_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$BrowserScreenStateTearOff {
  const _$BrowserScreenStateTearOff();

// ignore: unused_element
  _Create call({bool isLoading, bool checked, String currentUrl}) {
    return _Create(
      isLoading: isLoading,
      checked: checked,
      currentUrl: currentUrl,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $BrowserScreenState = _$BrowserScreenStateTearOff();

/// @nodoc
mixin _$BrowserScreenState {
  bool get isLoading;
  bool get checked;
  String get currentUrl;

  @JsonKey(ignore: true)
  $BrowserScreenStateCopyWith<BrowserScreenState> get copyWith;
}

/// @nodoc
abstract class $BrowserScreenStateCopyWith<$Res> {
  factory $BrowserScreenStateCopyWith(
          BrowserScreenState value, $Res Function(BrowserScreenState) then) =
      _$BrowserScreenStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, bool checked, String currentUrl});
}

/// @nodoc
class _$BrowserScreenStateCopyWithImpl<$Res>
    implements $BrowserScreenStateCopyWith<$Res> {
  _$BrowserScreenStateCopyWithImpl(this._value, this._then);

  final BrowserScreenState _value;
  // ignore: unused_field
  final $Res Function(BrowserScreenState) _then;

  @override
  $Res call({
    Object isLoading = freezed,
    Object checked = freezed,
    Object currentUrl = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      checked: checked == freezed ? _value.checked : checked as bool,
      currentUrl:
          currentUrl == freezed ? _value.currentUrl : currentUrl as String,
    ));
  }
}

/// @nodoc
abstract class _$CreateCopyWith<$Res>
    implements $BrowserScreenStateCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) then) =
      __$CreateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, bool checked, String currentUrl});
}

/// @nodoc
class __$CreateCopyWithImpl<$Res> extends _$BrowserScreenStateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(_Create _value, $Res Function(_Create) _then)
      : super(_value, (v) => _then(v as _Create));

  @override
  _Create get _value => super._value as _Create;

  @override
  $Res call({
    Object isLoading = freezed,
    Object checked = freezed,
    Object currentUrl = freezed,
  }) {
    return _then(_Create(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      checked: checked == freezed ? _value.checked : checked as bool,
      currentUrl:
          currentUrl == freezed ? _value.currentUrl : currentUrl as String,
    ));
  }
}

/// @nodoc
class _$_Create with DiagnosticableTreeMixin implements _Create {
  _$_Create({this.isLoading, this.checked, this.currentUrl});

  @override
  final bool isLoading;
  @override
  final bool checked;
  @override
  final String currentUrl;

  bool _didcurrentHostName = false;
  String _currentHostName;

  @override
  String get currentHostName {
    if (_didcurrentHostName == false) {
      _didcurrentHostName = true;
      _currentHostName = currentUrl == null ? "" : Uri.parse(currentUrl).host;
    }
    return _currentHostName;
  }

  bool _didisSearchEngine = false;
  bool _isSearchEngine;

  @override
  bool get isSearchEngine {
    if (_didisSearchEngine == false) {
      _didisSearchEngine = true;
      _isSearchEngine =
          HostRepository.searchEngineHosts.contains(currentHostName);
    }
    return _isSearchEngine;
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BrowserScreenState(isLoading: $isLoading, checked: $checked, currentUrl: $currentUrl, currentHostName: $currentHostName, isSearchEngine: $isSearchEngine)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BrowserScreenState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('checked', checked))
      ..add(DiagnosticsProperty('currentUrl', currentUrl))
      ..add(DiagnosticsProperty('currentHostName', currentHostName))
      ..add(DiagnosticsProperty('isSearchEngine', isSearchEngine));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Create &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.checked, checked) ||
                const DeepCollectionEquality()
                    .equals(other.checked, checked)) &&
            (identical(other.currentUrl, currentUrl) ||
                const DeepCollectionEquality()
                    .equals(other.currentUrl, currentUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(checked) ^
      const DeepCollectionEquality().hash(currentUrl);

  @JsonKey(ignore: true)
  @override
  _$CreateCopyWith<_Create> get copyWith =>
      __$CreateCopyWithImpl<_Create>(this, _$identity);
}

abstract class _Create implements BrowserScreenState {
  factory _Create({bool isLoading, bool checked, String currentUrl}) =
      _$_Create;

  @override
  bool get isLoading;
  @override
  bool get checked;
  @override
  String get currentUrl;
  @override
  @JsonKey(ignore: true)
  _$CreateCopyWith<_Create> get copyWith;
}
