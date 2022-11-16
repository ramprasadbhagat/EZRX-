// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bundle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Bundle {
  String get bundleName => throw _privateConstructorUsedError;
  String get bundleCode => throw _privateConstructorUsedError;
  List<BundleInfo> get bundleInformation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BundleCopyWith<Bundle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BundleCopyWith<$Res> {
  factory $BundleCopyWith(Bundle value, $Res Function(Bundle) then) =
      _$BundleCopyWithImpl<$Res>;
  $Res call(
      {String bundleName,
      String bundleCode,
      List<BundleInfo> bundleInformation});
}

/// @nodoc
class _$BundleCopyWithImpl<$Res> implements $BundleCopyWith<$Res> {
  _$BundleCopyWithImpl(this._value, this._then);

  final Bundle _value;
  // ignore: unused_field
  final $Res Function(Bundle) _then;

  @override
  $Res call({
    Object? bundleName = freezed,
    Object? bundleCode = freezed,
    Object? bundleInformation = freezed,
  }) {
    return _then(_value.copyWith(
      bundleName: bundleName == freezed
          ? _value.bundleName
          : bundleName // ignore: cast_nullable_to_non_nullable
              as String,
      bundleCode: bundleCode == freezed
          ? _value.bundleCode
          : bundleCode // ignore: cast_nullable_to_non_nullable
              as String,
      bundleInformation: bundleInformation == freezed
          ? _value.bundleInformation
          : bundleInformation // ignore: cast_nullable_to_non_nullable
              as List<BundleInfo>,
    ));
  }
}

/// @nodoc
abstract class _$$_BundleCopyWith<$Res> implements $BundleCopyWith<$Res> {
  factory _$$_BundleCopyWith(_$_Bundle value, $Res Function(_$_Bundle) then) =
      __$$_BundleCopyWithImpl<$Res>;
  @override
  $Res call(
      {String bundleName,
      String bundleCode,
      List<BundleInfo> bundleInformation});
}

/// @nodoc
class __$$_BundleCopyWithImpl<$Res> extends _$BundleCopyWithImpl<$Res>
    implements _$$_BundleCopyWith<$Res> {
  __$$_BundleCopyWithImpl(_$_Bundle _value, $Res Function(_$_Bundle) _then)
      : super(_value, (v) => _then(v as _$_Bundle));

  @override
  _$_Bundle get _value => super._value as _$_Bundle;

  @override
  $Res call({
    Object? bundleName = freezed,
    Object? bundleCode = freezed,
    Object? bundleInformation = freezed,
  }) {
    return _then(_$_Bundle(
      bundleName: bundleName == freezed
          ? _value.bundleName
          : bundleName // ignore: cast_nullable_to_non_nullable
              as String,
      bundleCode: bundleCode == freezed
          ? _value.bundleCode
          : bundleCode // ignore: cast_nullable_to_non_nullable
              as String,
      bundleInformation: bundleInformation == freezed
          ? _value._bundleInformation
          : bundleInformation // ignore: cast_nullable_to_non_nullable
              as List<BundleInfo>,
    ));
  }
}

/// @nodoc

class _$_Bundle extends _Bundle {
  const _$_Bundle(
      {required this.bundleName,
      required this.bundleCode,
      required final List<BundleInfo> bundleInformation})
      : _bundleInformation = bundleInformation,
        super._();

  @override
  final String bundleName;
  @override
  final String bundleCode;
  final List<BundleInfo> _bundleInformation;
  @override
  List<BundleInfo> get bundleInformation {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bundleInformation);
  }

  @override
  String toString() {
    return 'Bundle(bundleName: $bundleName, bundleCode: $bundleCode, bundleInformation: $bundleInformation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Bundle &&
            const DeepCollectionEquality()
                .equals(other.bundleName, bundleName) &&
            const DeepCollectionEquality()
                .equals(other.bundleCode, bundleCode) &&
            const DeepCollectionEquality()
                .equals(other._bundleInformation, _bundleInformation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(bundleName),
      const DeepCollectionEquality().hash(bundleCode),
      const DeepCollectionEquality().hash(_bundleInformation));

  @JsonKey(ignore: true)
  @override
  _$$_BundleCopyWith<_$_Bundle> get copyWith =>
      __$$_BundleCopyWithImpl<_$_Bundle>(this, _$identity);
}

abstract class _Bundle extends Bundle {
  const factory _Bundle(
      {required final String bundleName,
      required final String bundleCode,
      required final List<BundleInfo> bundleInformation}) = _$_Bundle;
  const _Bundle._() : super._();

  @override
  String get bundleName;
  @override
  String get bundleCode;
  @override
  List<BundleInfo> get bundleInformation;
  @override
  @JsonKey(ignore: true)
  _$$_BundleCopyWith<_$_Bundle> get copyWith =>
      throw _privateConstructorUsedError;
}
