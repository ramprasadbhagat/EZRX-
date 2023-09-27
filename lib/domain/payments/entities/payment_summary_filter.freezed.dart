// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_summary_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaymentSummaryFilter {
  DateTimeStringValue get createdDateFrom => throw _privateConstructorUsedError;
  DateTimeStringValue get createdDateTo => throw _privateConstructorUsedError;
  RangeValue get amountValueFrom => throw _privateConstructorUsedError;
  RangeValue get amountValueTo => throw _privateConstructorUsedError;
  List<StatusType> get filterStatuses => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentSummaryFilterCopyWith<PaymentSummaryFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentSummaryFilterCopyWith<$Res> {
  factory $PaymentSummaryFilterCopyWith(PaymentSummaryFilter value,
          $Res Function(PaymentSummaryFilter) then) =
      _$PaymentSummaryFilterCopyWithImpl<$Res, PaymentSummaryFilter>;
  @useResult
  $Res call(
      {DateTimeStringValue createdDateFrom,
      DateTimeStringValue createdDateTo,
      RangeValue amountValueFrom,
      RangeValue amountValueTo,
      List<StatusType> filterStatuses});
}

/// @nodoc
class _$PaymentSummaryFilterCopyWithImpl<$Res,
        $Val extends PaymentSummaryFilter>
    implements $PaymentSummaryFilterCopyWith<$Res> {
  _$PaymentSummaryFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdDateFrom = null,
    Object? createdDateTo = null,
    Object? amountValueFrom = null,
    Object? amountValueTo = null,
    Object? filterStatuses = null,
  }) {
    return _then(_value.copyWith(
      createdDateFrom: null == createdDateFrom
          ? _value.createdDateFrom
          : createdDateFrom // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      createdDateTo: null == createdDateTo
          ? _value.createdDateTo
          : createdDateTo // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      amountValueFrom: null == amountValueFrom
          ? _value.amountValueFrom
          : amountValueFrom // ignore: cast_nullable_to_non_nullable
              as RangeValue,
      amountValueTo: null == amountValueTo
          ? _value.amountValueTo
          : amountValueTo // ignore: cast_nullable_to_non_nullable
              as RangeValue,
      filterStatuses: null == filterStatuses
          ? _value.filterStatuses
          : filterStatuses // ignore: cast_nullable_to_non_nullable
              as List<StatusType>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentSummaryFilterCopyWith<$Res>
    implements $PaymentSummaryFilterCopyWith<$Res> {
  factory _$$_PaymentSummaryFilterCopyWith(_$_PaymentSummaryFilter value,
          $Res Function(_$_PaymentSummaryFilter) then) =
      __$$_PaymentSummaryFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTimeStringValue createdDateFrom,
      DateTimeStringValue createdDateTo,
      RangeValue amountValueFrom,
      RangeValue amountValueTo,
      List<StatusType> filterStatuses});
}

/// @nodoc
class __$$_PaymentSummaryFilterCopyWithImpl<$Res>
    extends _$PaymentSummaryFilterCopyWithImpl<$Res, _$_PaymentSummaryFilter>
    implements _$$_PaymentSummaryFilterCopyWith<$Res> {
  __$$_PaymentSummaryFilterCopyWithImpl(_$_PaymentSummaryFilter _value,
      $Res Function(_$_PaymentSummaryFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdDateFrom = null,
    Object? createdDateTo = null,
    Object? amountValueFrom = null,
    Object? amountValueTo = null,
    Object? filterStatuses = null,
  }) {
    return _then(_$_PaymentSummaryFilter(
      createdDateFrom: null == createdDateFrom
          ? _value.createdDateFrom
          : createdDateFrom // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      createdDateTo: null == createdDateTo
          ? _value.createdDateTo
          : createdDateTo // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      amountValueFrom: null == amountValueFrom
          ? _value.amountValueFrom
          : amountValueFrom // ignore: cast_nullable_to_non_nullable
              as RangeValue,
      amountValueTo: null == amountValueTo
          ? _value.amountValueTo
          : amountValueTo // ignore: cast_nullable_to_non_nullable
              as RangeValue,
      filterStatuses: null == filterStatuses
          ? _value._filterStatuses
          : filterStatuses // ignore: cast_nullable_to_non_nullable
              as List<StatusType>,
    ));
  }
}

/// @nodoc

class _$_PaymentSummaryFilter extends _PaymentSummaryFilter {
  _$_PaymentSummaryFilter(
      {required this.createdDateFrom,
      required this.createdDateTo,
      required this.amountValueFrom,
      required this.amountValueTo,
      required final List<StatusType> filterStatuses})
      : _filterStatuses = filterStatuses,
        super._();

  @override
  final DateTimeStringValue createdDateFrom;
  @override
  final DateTimeStringValue createdDateTo;
  @override
  final RangeValue amountValueFrom;
  @override
  final RangeValue amountValueTo;
  final List<StatusType> _filterStatuses;
  @override
  List<StatusType> get filterStatuses {
    if (_filterStatuses is EqualUnmodifiableListView) return _filterStatuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filterStatuses);
  }

  @override
  String toString() {
    return 'PaymentSummaryFilter(createdDateFrom: $createdDateFrom, createdDateTo: $createdDateTo, amountValueFrom: $amountValueFrom, amountValueTo: $amountValueTo, filterStatuses: $filterStatuses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentSummaryFilter &&
            (identical(other.createdDateFrom, createdDateFrom) ||
                other.createdDateFrom == createdDateFrom) &&
            (identical(other.createdDateTo, createdDateTo) ||
                other.createdDateTo == createdDateTo) &&
            (identical(other.amountValueFrom, amountValueFrom) ||
                other.amountValueFrom == amountValueFrom) &&
            (identical(other.amountValueTo, amountValueTo) ||
                other.amountValueTo == amountValueTo) &&
            const DeepCollectionEquality()
                .equals(other._filterStatuses, _filterStatuses));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdDateFrom,
      createdDateTo,
      amountValueFrom,
      amountValueTo,
      const DeepCollectionEquality().hash(_filterStatuses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentSummaryFilterCopyWith<_$_PaymentSummaryFilter> get copyWith =>
      __$$_PaymentSummaryFilterCopyWithImpl<_$_PaymentSummaryFilter>(
          this, _$identity);
}

abstract class _PaymentSummaryFilter extends PaymentSummaryFilter {
  factory _PaymentSummaryFilter(
          {required final DateTimeStringValue createdDateFrom,
          required final DateTimeStringValue createdDateTo,
          required final RangeValue amountValueFrom,
          required final RangeValue amountValueTo,
          required final List<StatusType> filterStatuses}) =
      _$_PaymentSummaryFilter;
  _PaymentSummaryFilter._() : super._();

  @override
  DateTimeStringValue get createdDateFrom;
  @override
  DateTimeStringValue get createdDateTo;
  @override
  RangeValue get amountValueFrom;
  @override
  RangeValue get amountValueTo;
  @override
  List<StatusType> get filterStatuses;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentSummaryFilterCopyWith<_$_PaymentSummaryFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
