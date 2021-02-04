// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AppStateTearOff {
  const _$AppStateTearOff();

// ignore: unused_element
  _Create call({bool initialized, String lastKeyword}) {
    return _Create(
      initialized: initialized,
      lastKeyword: lastKeyword,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AppState = _$AppStateTearOff();

/// @nodoc
mixin _$AppState {
  bool get initialized;
  String get lastKeyword;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res>;
  $Res call({bool initialized, String lastKeyword});
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;

  @override
  $Res call({
    Object initialized = freezed,
    Object lastKeyword = freezed,
  }) {
    return _then(_value.copyWith(
      initialized:
          initialized == freezed ? _value.initialized : initialized as bool,
      lastKeyword:
          lastKeyword == freezed ? _value.lastKeyword : lastKeyword as String,
    ));
  }
}

/// @nodoc
abstract class _$CreateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) then) =
      __$CreateCopyWithImpl<$Res>;
  @override
  $Res call({bool initialized, String lastKeyword});
}

/// @nodoc
class __$CreateCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(_Create _value, $Res Function(_Create) _then)
      : super(_value, (v) => _then(v as _Create));

  @override
  _Create get _value => super._value as _Create;

  @override
  $Res call({
    Object initialized = freezed,
    Object lastKeyword = freezed,
  }) {
    return _then(_Create(
      initialized:
          initialized == freezed ? _value.initialized : initialized as bool,
      lastKeyword:
          lastKeyword == freezed ? _value.lastKeyword : lastKeyword as String,
    ));
  }
}

/// @nodoc
class _$_Create with DiagnosticableTreeMixin implements _Create {
  _$_Create({this.initialized, this.lastKeyword});

  @override
  final bool initialized;
  @override
  final String lastKeyword;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppState(initialized: $initialized, lastKeyword: $lastKeyword)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppState'))
      ..add(DiagnosticsProperty('initialized', initialized))
      ..add(DiagnosticsProperty('lastKeyword', lastKeyword));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Create &&
            (identical(other.initialized, initialized) ||
                const DeepCollectionEquality()
                    .equals(other.initialized, initialized)) &&
            (identical(other.lastKeyword, lastKeyword) ||
                const DeepCollectionEquality()
                    .equals(other.lastKeyword, lastKeyword)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(initialized) ^
      const DeepCollectionEquality().hash(lastKeyword);

  @JsonKey(ignore: true)
  @override
  _$CreateCopyWith<_Create> get copyWith =>
      __$CreateCopyWithImpl<_Create>(this, _$identity);
}

abstract class _Create implements AppState {
  factory _Create({bool initialized, String lastKeyword}) = _$_Create;

  @override
  bool get initialized;
  @override
  String get lastKeyword;
  @override
  @JsonKey(ignore: true)
  _$CreateCopyWith<_Create> get copyWith;
}
