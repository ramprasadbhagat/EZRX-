// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'usage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Usage {
  String get usageCode => throw _privateConstructorUsedError;
  String get usageDescription => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UsageCopyWith<Usage> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsageCopyWith<$Res> {
  factory $UsageCopyWith(Usage value, $Res Function(Usage) then) =
      _$UsageCopyWithImpl<$Res, Usage>;
  @useResult
  $Res call({String usageCode, String usageDescription});
}

/// @nodoc
class _$UsageCopyWithImpl<$Res, $Val extends Usage>
    implements $UsageCopyWith<$Res> {
  _$UsageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usageCode = null,
    Object? usageDescription = null,
  }) {
    return _then(_value.copyWith(
      usageCode: null == usageCode
          ? _value.usageCode
          : usageCode // ignore: cast_nullable_to_non_nullable
              as String,
      usageDescription: null == usageDescription
          ? _value.usageDescription
          : usageDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UsageCopyWith<$Res> implements $UsageCopyWith<$Res> {
  factory _$$_UsageCopyWith(_$_Usage value, $Res Function(_$_Usage) then) =
      __$$_UsageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String usageCode, String usageDescription});
}

/// @nodoc
class __$$_UsageCopyWithImpl<$Res> extends _$UsageCopyWithImpl<$Res, _$_Usage>
    implements _$$_UsageCopyWith<$Res> {
  __$$_UsageCopyWithImpl(_$_Usage _value, $Res Function(_$_Usage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usageCode = null,
    Object? usageDescription = null,
  }) {
    return _then(_$_Usage(
      usageCode: null == usageCode
          ? _value.usageCode
          : usageCode // ignore: cast_nullable_to_non_nullable
              as String,
      usageDescription: null == usageDescription
          ? _value.usageDescription
          : usageDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Usage extends _Usage {
  const _$_Usage({required this.usageCode, required this.usageDescription})
      : super._();

  @override
  final String usageCode;
  @override
  final String usageDescription;

  @override
  String toString() {
    return 'Usage(usageCode: $usageCode, usageDescription: $usageDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Usage &&
            (identical(other.usageCode, usageCode) ||
                other.usageCode == usageCode) &&
            (identical(other.usageDescription, usageDescription) ||
                other.usageDescription == usageDescription));
  }

  @override
  int get hashCode => Object.hash(runtimeType, usageCode, usageDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UsageCopyWith<_$_Usage> get copyWith =>
      __$$_UsageCopyWithImpl<_$_Usage>(this, _$identity);
}

abstract class _Usage extends Usage {
  const factory _Usage(
      {required final String usageCode,
      required final String usageDescription}) = _$_Usage;
  const _Usage._() : super._();

  @override
  String get usageCode;
  @override
  String get usageDescription;
  @override
  @JsonKey(ignore: true)
  _$$_UsageCopyWith<_$_Usage> get copyWith =>
      throw _privateConstructorUsedError;
}
