// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_district_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SalesDistrictDetails {
  int get id => throw _privateConstructorUsedError;
  String get salesDistrict => throw _privateConstructorUsedError;
  String get salesDistrictLabel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SalesDistrictDetailsCopyWith<SalesDistrictDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesDistrictDetailsCopyWith<$Res> {
  factory $SalesDistrictDetailsCopyWith(SalesDistrictDetails value,
          $Res Function(SalesDistrictDetails) then) =
      _$SalesDistrictDetailsCopyWithImpl<$Res, SalesDistrictDetails>;
  @useResult
  $Res call({int id, String salesDistrict, String salesDistrictLabel});
}

/// @nodoc
class _$SalesDistrictDetailsCopyWithImpl<$Res,
        $Val extends SalesDistrictDetails>
    implements $SalesDistrictDetailsCopyWith<$Res> {
  _$SalesDistrictDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? salesDistrict = null,
    Object? salesDistrictLabel = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      salesDistrict: null == salesDistrict
          ? _value.salesDistrict
          : salesDistrict // ignore: cast_nullable_to_non_nullable
              as String,
      salesDistrictLabel: null == salesDistrictLabel
          ? _value.salesDistrictLabel
          : salesDistrictLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SalesDistrictDetailsCopyWith<$Res>
    implements $SalesDistrictDetailsCopyWith<$Res> {
  factory _$$_SalesDistrictDetailsCopyWith(_$_SalesDistrictDetails value,
          $Res Function(_$_SalesDistrictDetails) then) =
      __$$_SalesDistrictDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String salesDistrict, String salesDistrictLabel});
}

/// @nodoc
class __$$_SalesDistrictDetailsCopyWithImpl<$Res>
    extends _$SalesDistrictDetailsCopyWithImpl<$Res, _$_SalesDistrictDetails>
    implements _$$_SalesDistrictDetailsCopyWith<$Res> {
  __$$_SalesDistrictDetailsCopyWithImpl(_$_SalesDistrictDetails _value,
      $Res Function(_$_SalesDistrictDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? salesDistrict = null,
    Object? salesDistrictLabel = null,
  }) {
    return _then(_$_SalesDistrictDetails(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      salesDistrict: null == salesDistrict
          ? _value.salesDistrict
          : salesDistrict // ignore: cast_nullable_to_non_nullable
              as String,
      salesDistrictLabel: null == salesDistrictLabel
          ? _value.salesDistrictLabel
          : salesDistrictLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SalesDistrictDetails extends _SalesDistrictDetails {
  const _$_SalesDistrictDetails(
      {required this.id,
      required this.salesDistrict,
      required this.salesDistrictLabel})
      : super._();

  @override
  final int id;
  @override
  final String salesDistrict;
  @override
  final String salesDistrictLabel;

  @override
  String toString() {
    return 'SalesDistrictDetails(id: $id, salesDistrict: $salesDistrict, salesDistrictLabel: $salesDistrictLabel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalesDistrictDetails &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.salesDistrict, salesDistrict) ||
                other.salesDistrict == salesDistrict) &&
            (identical(other.salesDistrictLabel, salesDistrictLabel) ||
                other.salesDistrictLabel == salesDistrictLabel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, salesDistrict, salesDistrictLabel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SalesDistrictDetailsCopyWith<_$_SalesDistrictDetails> get copyWith =>
      __$$_SalesDistrictDetailsCopyWithImpl<_$_SalesDistrictDetails>(
          this, _$identity);
}

abstract class _SalesDistrictDetails extends SalesDistrictDetails {
  const factory _SalesDistrictDetails(
      {required final int id,
      required final String salesDistrict,
      required final String salesDistrictLabel}) = _$_SalesDistrictDetails;
  const _SalesDistrictDetails._() : super._();

  @override
  int get id;
  @override
  String get salesDistrict;
  @override
  String get salesDistrictLabel;
  @override
  @JsonKey(ignore: true)
  _$$_SalesDistrictDetailsCopyWith<_$_SalesDistrictDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
