// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'settings_register_host_browser_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SettingsRegisterHostBrowserScreenStateTearOff {
  const _$SettingsRegisterHostBrowserScreenStateTearOff();

// ignore: unused_element
  _Create call({bool isLoading, String currentUrl}) {
    return _Create(
      isLoading: isLoading,
      currentUrl: currentUrl,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SettingsRegisterHostBrowserScreenState =
    _$SettingsRegisterHostBrowserScreenStateTearOff();

/// @nodoc
mixin _$SettingsRegisterHostBrowserScreenState {
  bool get isLoading;
  String get currentUrl;

  @JsonKey(ignore: true)
  $SettingsRegisterHostBrowserScreenStateCopyWith<
      SettingsRegisterHostBrowserScreenState> get copyWith;
}

/// @nodoc
abstract class $SettingsRegisterHostBrowserScreenStateCopyWith<$Res> {
  factory $SettingsRegisterHostBrowserScreenStateCopyWith(
          SettingsRegisterHostBrowserScreenState value,
          $Res Function(SettingsRegisterHostBrowserScreenState) then) =
      _$SettingsRegisterHostBrowserScreenStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, String currentUrl});
}

/// @nodoc
class _$SettingsRegisterHostBrowserScreenStateCopyWithImpl<$Res>
    implements $SettingsRegisterHostBrowserScreenStateCopyWith<$Res> {
  _$SettingsRegisterHostBrowserScreenStateCopyWithImpl(this._value, this._then);

  final SettingsRegisterHostBrowserScreenState _value;
  // ignore: unused_field
  final $Res Function(SettingsRegisterHostBrowserScreenState) _then;

  @override
  $Res call({
    Object isLoading = freezed,
    Object currentUrl = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      currentUrl:
          currentUrl == freezed ? _value.currentUrl : currentUrl as String,
    ));
  }
}

/// @nodoc
abstract class _$CreateCopyWith<$Res>
    implements $SettingsRegisterHostBrowserScreenStateCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) then) =
      __$CreateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, String currentUrl});
}

/// @nodoc
class __$CreateCopyWithImpl<$Res>
    extends _$SettingsRegisterHostBrowserScreenStateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(_Create _value, $Res Function(_Create) _then)
      : super(_value, (v) => _then(v as _Create));

  @override
  _Create get _value => super._value as _Create;

  @override
  $Res call({
    Object isLoading = freezed,
    Object currentUrl = freezed,
  }) {
    return _then(_Create(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      currentUrl:
          currentUrl == freezed ? _value.currentUrl : currentUrl as String,
    ));
  }
}

/// @nodoc
class _$_Create with DiagnosticableTreeMixin implements _Create {
  _$_Create({this.isLoading, this.currentUrl});

  @override
  final bool isLoading;
  @override
  final String currentUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SettingsRegisterHostBrowserScreenState(isLoading: $isLoading, currentUrl: $currentUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'SettingsRegisterHostBrowserScreenState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('currentUrl', currentUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Create &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.currentUrl, currentUrl) ||
                const DeepCollectionEquality()
                    .equals(other.currentUrl, currentUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(currentUrl);

  @JsonKey(ignore: true)
  @override
  _$CreateCopyWith<_Create> get copyWith =>
      __$CreateCopyWithImpl<_Create>(this, _$identity);
}

abstract class _Create implements SettingsRegisterHostBrowserScreenState {
  factory _Create({bool isLoading, String currentUrl}) = _$_Create;

  @override
  bool get isLoading;
  @override
  String get currentUrl;
  @override
  @JsonKey(ignore: true)
  _$CreateCopyWith<_Create> get copyWith;
}
