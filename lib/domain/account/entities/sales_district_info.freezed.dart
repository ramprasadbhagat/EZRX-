// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_district_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SalesDistrictInfo {
  int get id => throw _privateConstructorUsedError;
  StringValue get salesDistrictHeader => throw _privateConstructorUsedError;
  StringValue get salesDistrictLabel => throw _privateConstructorUsedError;
  bool get isDeleteInProgress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SalesDistrictInfoCopyWith<SalesDistrictInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesDistrictInfoCopyWith<$Res> {
  factory $SalesDistrictInfoCopyWith(
          SalesDistrictInfo value, $Res Function(SalesDistrictInfo) then) =
      _$SalesDistrictInfoCopyWithImpl<$Res, SalesDistrictInfo>;
  @useResult
  $Res call(
      {int id,
      StringValue salesDistrictHeader,
      StringValue salesDistrictLabel,
      bool isDeleteInProgress});
}

/// @nodoc
class _$SalesDistrictInfoCopyWithImpl<$Res, $Val extends SalesDistrictInfo>
    implements $SalesDistrictInfoCopyWith<$Res> {
  _$SalesDistrictInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? salesDistrictHeader = null,
    Object? salesDistrictLabel = null,
    Object? isDeleteInProgress = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      salesDistrictHeader: null == salesDistrictHeader
          ? _value.salesDistrictHeader
          : salesDistrictHeader // ignore: cast_nullable_to_non_nullable
              as StringValue,
      salesDistrictLabel: null == salesDistrictLabel
          ? _value.salesDistrictLabel
          : salesDistrictLabel // ignore: cast_nullable_to_non_nullable
              as StringValue,
      isDeleteInProgress: null == isDeleteInProgress
          ? _value.isDeleteInProgress
          : isDeleteInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SalesDistrictInfoCopyWith<$Res>
    implements $SalesDistrictInfoCopyWith<$Res> {
  factory _$$_SalesDistrictInfoCopyWith(_$_SalesDistrictInfo value,
          $Res Function(_$_SalesDistrictInfo) then) =
      __$$_SalesDistrictInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      StringValue salesDistrictHeader,
      StringValue salesDistrictLabel,
      bool isDeleteInProgress});
}

/// @nodoc
class __$$_SalesDistrictInfoCopyWithImpl<$Res>
    extends _$SalesDistrictInfoCopyWithImpl<$Res, _$_SalesDistrictInfo>
    implements _$$_SalesDistrictInfoCopyWith<$Res> {
  __$$_SalesDistrictInfoCopyWithImpl(
      _$_SalesDistrictInfo _value, $Res Function(_$_SalesDistrictInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? salesDistrictHeader = null,
    Object? salesDistrictLabel = null,
    Object? isDeleteInProgress = null,
  }) {
    return _then(_$_SalesDistrictInfo(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      salesDistrictHeader: null == salesDistrictHeader
          ? _value.salesDistrictHeader
          : salesDistrictHeader // ignore: cast_nullable_to_non_nullable
              as StringValue,
      salesDistrictLabel: null == salesDistrictLabel
          ? _value.salesDistrictLabel
          : salesDistrictLabel // ignore: cast_nullable_to_non_nullable
              as StringValue,
      isDeleteInProgress: null == isDeleteInProgress
          ? _value.isDeleteInProgress
          : isDeleteInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SalesDistrictInfo extends _SalesDistrictInfo {
  const _$_SalesDistrictInfo(
      {required this.id,
      required this.salesDistrictHeader,
      required this.salesDistrictLabel,
      required this.isDeleteInProgress})
      : super._();

  @override
  final int id;
  @override
  final StringValue salesDistrictHeader;
  @override
  final StringValue salesDistrictLabel;
  @override
  final bool isDeleteInProgress;

  @override
  String toString() {
    return 'SalesDistrictInfo(id: $id, salesDistrictHeader: $salesDistrictHeader, salesDistrictLabel: $salesDistrictLabel, isDeleteInProgress: $isDeleteInProgress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalesDistrictInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.salesDistrictHeader, salesDistrictHeader) ||
                other.salesDistrictHeader == salesDistrictHeader) &&
            (identical(other.salesDistrictLabel, salesDistrictLabel) ||
                other.salesDistrictLabel == salesDistrictLabel) &&
            (identical(other.isDeleteInProgress, isDeleteInProgress) ||
                other.isDeleteInProgress == isDeleteInProgress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, salesDistrictHeader,
      salesDistrictLabel, isDeleteInProgress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SalesDistrictInfoCopyWith<_$_SalesDistrictInfo> get copyWith =>
      __$$_SalesDistrictInfoCopyWithImpl<_$_SalesDistrictInfo>(
          this, _$identity);
}

abstract class _SalesDistrictInfo extends SalesDistrictInfo {
  const factory _SalesDistrictInfo(
      {required final int id,
      required final StringValue salesDistrictHeader,
      required final StringValue salesDistrictLabel,
      required final bool isDeleteInProgress}) = _$_SalesDistrictInfo;
  const _SalesDistrictInfo._() : super._();

  @override
  int get id;
  @override
  StringValue get salesDistrictHeader;
  @override
  StringValue get salesDistrictLabel;
  @override
  bool get isDeleteInProgress;
  @override
  @JsonKey(ignore: true)
  _$$_SalesDistrictInfoCopyWith<_$_SalesDistrictInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
