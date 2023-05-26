// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_district.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SalesDistrict {
  SalesOrg get salesOrg => throw _privateConstructorUsedError;
  List<SalesDistrictInfo> get salesDistrictInfo =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SalesDistrictCopyWith<SalesDistrict> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesDistrictCopyWith<$Res> {
  factory $SalesDistrictCopyWith(
          SalesDistrict value, $Res Function(SalesDistrict) then) =
      _$SalesDistrictCopyWithImpl<$Res, SalesDistrict>;
  @useResult
  $Res call({SalesOrg salesOrg, List<SalesDistrictInfo> salesDistrictInfo});
}

/// @nodoc
class _$SalesDistrictCopyWithImpl<$Res, $Val extends SalesDistrict>
    implements $SalesDistrictCopyWith<$Res> {
  _$SalesDistrictCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? salesDistrictInfo = null,
  }) {
    return _then(_value.copyWith(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      salesDistrictInfo: null == salesDistrictInfo
          ? _value.salesDistrictInfo
          : salesDistrictInfo // ignore: cast_nullable_to_non_nullable
              as List<SalesDistrictInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SalesDistrictCopyWith<$Res>
    implements $SalesDistrictCopyWith<$Res> {
  factory _$$_SalesDistrictCopyWith(
          _$_SalesDistrict value, $Res Function(_$_SalesDistrict) then) =
      __$$_SalesDistrictCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SalesOrg salesOrg, List<SalesDistrictInfo> salesDistrictInfo});
}

/// @nodoc
class __$$_SalesDistrictCopyWithImpl<$Res>
    extends _$SalesDistrictCopyWithImpl<$Res, _$_SalesDistrict>
    implements _$$_SalesDistrictCopyWith<$Res> {
  __$$_SalesDistrictCopyWithImpl(
      _$_SalesDistrict _value, $Res Function(_$_SalesDistrict) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? salesDistrictInfo = null,
  }) {
    return _then(_$_SalesDistrict(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      salesDistrictInfo: null == salesDistrictInfo
          ? _value._salesDistrictInfo
          : salesDistrictInfo // ignore: cast_nullable_to_non_nullable
              as List<SalesDistrictInfo>,
    ));
  }
}

/// @nodoc

class _$_SalesDistrict extends _SalesDistrict {
  const _$_SalesDistrict(
      {required this.salesOrg,
      required final List<SalesDistrictInfo> salesDistrictInfo})
      : _salesDistrictInfo = salesDistrictInfo,
        super._();

  @override
  final SalesOrg salesOrg;
  final List<SalesDistrictInfo> _salesDistrictInfo;
  @override
  List<SalesDistrictInfo> get salesDistrictInfo {
    if (_salesDistrictInfo is EqualUnmodifiableListView)
      return _salesDistrictInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_salesDistrictInfo);
  }

  @override
  String toString() {
    return 'SalesDistrict(salesOrg: $salesOrg, salesDistrictInfo: $salesDistrictInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalesDistrict &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            const DeepCollectionEquality()
                .equals(other._salesDistrictInfo, _salesDistrictInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg,
      const DeepCollectionEquality().hash(_salesDistrictInfo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SalesDistrictCopyWith<_$_SalesDistrict> get copyWith =>
      __$$_SalesDistrictCopyWithImpl<_$_SalesDistrict>(this, _$identity);
}

abstract class _SalesDistrict extends SalesDistrict {
  const factory _SalesDistrict(
          {required final SalesOrg salesOrg,
          required final List<SalesDistrictInfo> salesDistrictInfo}) =
      _$_SalesDistrict;
  const _SalesDistrict._() : super._();

  @override
  SalesOrg get salesOrg;
  @override
  List<SalesDistrictInfo> get salesDistrictInfo;
  @override
  @JsonKey(ignore: true)
  _$$_SalesDistrictCopyWith<_$_SalesDistrict> get copyWith =>
      throw _privateConstructorUsedError;
}
