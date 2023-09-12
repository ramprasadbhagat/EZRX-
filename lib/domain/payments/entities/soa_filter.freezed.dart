// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'soa_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SoaFilter {
  DateTimeStringValue get toDate => throw _privateConstructorUsedError;
  DateTimeStringValue get fromDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SoaFilterCopyWith<SoaFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SoaFilterCopyWith<$Res> {
  factory $SoaFilterCopyWith(SoaFilter value, $Res Function(SoaFilter) then) =
      _$SoaFilterCopyWithImpl<$Res, SoaFilter>;
  @useResult
  $Res call({DateTimeStringValue toDate, DateTimeStringValue fromDate});
}

/// @nodoc
class _$SoaFilterCopyWithImpl<$Res, $Val extends SoaFilter>
    implements $SoaFilterCopyWith<$Res> {
  _$SoaFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toDate = null,
    Object? fromDate = null,
  }) {
    return _then(_value.copyWith(
      toDate: null == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      fromDate: null == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SoaFilterCopyWith<$Res> implements $SoaFilterCopyWith<$Res> {
  factory _$$_SoaFilterCopyWith(
          _$_SoaFilter value, $Res Function(_$_SoaFilter) then) =
      __$$_SoaFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTimeStringValue toDate, DateTimeStringValue fromDate});
}

/// @nodoc
class __$$_SoaFilterCopyWithImpl<$Res>
    extends _$SoaFilterCopyWithImpl<$Res, _$_SoaFilter>
    implements _$$_SoaFilterCopyWith<$Res> {
  __$$_SoaFilterCopyWithImpl(
      _$_SoaFilter _value, $Res Function(_$_SoaFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toDate = null,
    Object? fromDate = null,
  }) {
    return _then(_$_SoaFilter(
      toDate: null == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      fromDate: null == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
    ));
  }
}

/// @nodoc

class _$_SoaFilter extends _SoaFilter {
  _$_SoaFilter({required this.toDate, required this.fromDate}) : super._();

  @override
  final DateTimeStringValue toDate;
  @override
  final DateTimeStringValue fromDate;

  @override
  String toString() {
    return 'SoaFilter(toDate: $toDate, fromDate: $fromDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SoaFilter &&
            (identical(other.toDate, toDate) || other.toDate == toDate) &&
            (identical(other.fromDate, fromDate) ||
                other.fromDate == fromDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, toDate, fromDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SoaFilterCopyWith<_$_SoaFilter> get copyWith =>
      __$$_SoaFilterCopyWithImpl<_$_SoaFilter>(this, _$identity);
}

abstract class _SoaFilter extends SoaFilter {
  factory _SoaFilter(
      {required final DateTimeStringValue toDate,
      required final DateTimeStringValue fromDate}) = _$_SoaFilter;
  _SoaFilter._() : super._();

  @override
  DateTimeStringValue get toDate;
  @override
  DateTimeStringValue get fromDate;
  @override
  @JsonKey(ignore: true)
  _$$_SoaFilterCopyWith<_$_SoaFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
