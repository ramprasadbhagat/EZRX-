// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_items_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReturnItemsFilter {
  DateTimeStringValue get invoiceDateFrom => throw _privateConstructorUsedError;
  DateTimeStringValue get invoiceDateTo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnItemsFilterCopyWith<ReturnItemsFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnItemsFilterCopyWith<$Res> {
  factory $ReturnItemsFilterCopyWith(
          ReturnItemsFilter value, $Res Function(ReturnItemsFilter) then) =
      _$ReturnItemsFilterCopyWithImpl<$Res, ReturnItemsFilter>;
  @useResult
  $Res call(
      {DateTimeStringValue invoiceDateFrom, DateTimeStringValue invoiceDateTo});
}

/// @nodoc
class _$ReturnItemsFilterCopyWithImpl<$Res, $Val extends ReturnItemsFilter>
    implements $ReturnItemsFilterCopyWith<$Res> {
  _$ReturnItemsFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceDateFrom = null,
    Object? invoiceDateTo = null,
  }) {
    return _then(_value.copyWith(
      invoiceDateFrom: null == invoiceDateFrom
          ? _value.invoiceDateFrom
          : invoiceDateFrom // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      invoiceDateTo: null == invoiceDateTo
          ? _value.invoiceDateTo
          : invoiceDateTo // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReturnItemsFilterCopyWith<$Res>
    implements $ReturnItemsFilterCopyWith<$Res> {
  factory _$$_ReturnItemsFilterCopyWith(_$_ReturnItemsFilter value,
          $Res Function(_$_ReturnItemsFilter) then) =
      __$$_ReturnItemsFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTimeStringValue invoiceDateFrom, DateTimeStringValue invoiceDateTo});
}

/// @nodoc
class __$$_ReturnItemsFilterCopyWithImpl<$Res>
    extends _$ReturnItemsFilterCopyWithImpl<$Res, _$_ReturnItemsFilter>
    implements _$$_ReturnItemsFilterCopyWith<$Res> {
  __$$_ReturnItemsFilterCopyWithImpl(
      _$_ReturnItemsFilter _value, $Res Function(_$_ReturnItemsFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceDateFrom = null,
    Object? invoiceDateTo = null,
  }) {
    return _then(_$_ReturnItemsFilter(
      invoiceDateFrom: null == invoiceDateFrom
          ? _value.invoiceDateFrom
          : invoiceDateFrom // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      invoiceDateTo: null == invoiceDateTo
          ? _value.invoiceDateTo
          : invoiceDateTo // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
    ));
  }
}

/// @nodoc

class _$_ReturnItemsFilter extends _ReturnItemsFilter {
  _$_ReturnItemsFilter(
      {required this.invoiceDateFrom, required this.invoiceDateTo})
      : super._();

  @override
  final DateTimeStringValue invoiceDateFrom;
  @override
  final DateTimeStringValue invoiceDateTo;

  @override
  String toString() {
    return 'ReturnItemsFilter(invoiceDateFrom: $invoiceDateFrom, invoiceDateTo: $invoiceDateTo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnItemsFilter &&
            (identical(other.invoiceDateFrom, invoiceDateFrom) ||
                other.invoiceDateFrom == invoiceDateFrom) &&
            (identical(other.invoiceDateTo, invoiceDateTo) ||
                other.invoiceDateTo == invoiceDateTo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, invoiceDateFrom, invoiceDateTo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnItemsFilterCopyWith<_$_ReturnItemsFilter> get copyWith =>
      __$$_ReturnItemsFilterCopyWithImpl<_$_ReturnItemsFilter>(
          this, _$identity);
}

abstract class _ReturnItemsFilter extends ReturnItemsFilter {
  factory _ReturnItemsFilter(
      {required final DateTimeStringValue invoiceDateFrom,
      required final DateTimeStringValue invoiceDateTo}) = _$_ReturnItemsFilter;
  _ReturnItemsFilter._() : super._();

  @override
  DateTimeStringValue get invoiceDateFrom;
  @override
  DateTimeStringValue get invoiceDateTo;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnItemsFilterCopyWith<_$_ReturnItemsFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
