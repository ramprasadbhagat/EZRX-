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
      _$BundleCopyWithImpl<$Res, Bundle>;
  @useResult
  $Res call(
      {String bundleName,
      String bundleCode,
      List<BundleInfo> bundleInformation});
}

/// @nodoc
class _$BundleCopyWithImpl<$Res, $Val extends Bundle>
    implements $BundleCopyWith<$Res> {
  _$BundleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bundleName = null,
    Object? bundleCode = null,
    Object? bundleInformation = null,
  }) {
    return _then(_value.copyWith(
      bundleName: null == bundleName
          ? _value.bundleName
          : bundleName // ignore: cast_nullable_to_non_nullable
              as String,
      bundleCode: null == bundleCode
          ? _value.bundleCode
          : bundleCode // ignore: cast_nullable_to_non_nullable
              as String,
      bundleInformation: null == bundleInformation
          ? _value.bundleInformation
          : bundleInformation // ignore: cast_nullable_to_non_nullable
              as List<BundleInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BundleCopyWith<$Res> implements $BundleCopyWith<$Res> {
  factory _$$_BundleCopyWith(_$_Bundle value, $Res Function(_$_Bundle) then) =
      __$$_BundleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String bundleName,
      String bundleCode,
      List<BundleInfo> bundleInformation});
}

/// @nodoc
class __$$_BundleCopyWithImpl<$Res>
    extends _$BundleCopyWithImpl<$Res, _$_Bundle>
    implements _$$_BundleCopyWith<$Res> {
  __$$_BundleCopyWithImpl(_$_Bundle _value, $Res Function(_$_Bundle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bundleName = null,
    Object? bundleCode = null,
    Object? bundleInformation = null,
  }) {
    return _then(_$_Bundle(
      bundleName: null == bundleName
          ? _value.bundleName
          : bundleName // ignore: cast_nullable_to_non_nullable
              as String,
      bundleCode: null == bundleCode
          ? _value.bundleCode
          : bundleCode // ignore: cast_nullable_to_non_nullable
              as String,
      bundleInformation: null == bundleInformation
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
            (identical(other.bundleName, bundleName) ||
                other.bundleName == bundleName) &&
            (identical(other.bundleCode, bundleCode) ||
                other.bundleCode == bundleCode) &&
            const DeepCollectionEquality()
                .equals(other._bundleInformation, _bundleInformation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bundleName, bundleCode,
      const DeepCollectionEquality().hash(_bundleInformation));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
