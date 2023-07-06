// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReturnFilter {
  DateTimeStringValue get returnDateFrom => throw _privateConstructorUsedError;
  DateTimeStringValue get returnDateTo => throw _privateConstructorUsedError;
  RangeValue get amountValueFrom => throw _privateConstructorUsedError;
  RangeValue get amountValueTo => throw _privateConstructorUsedError;
  List<StatusType> get returnStatusList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnFilterCopyWith<ReturnFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnFilterCopyWith<$Res> {
  factory $ReturnFilterCopyWith(
          ReturnFilter value, $Res Function(ReturnFilter) then) =
      _$ReturnFilterCopyWithImpl<$Res, ReturnFilter>;
  @useResult
  $Res call(
      {DateTimeStringValue returnDateFrom,
      DateTimeStringValue returnDateTo,
      RangeValue amountValueFrom,
      RangeValue amountValueTo,
      List<StatusType> returnStatusList});
}

/// @nodoc
class _$ReturnFilterCopyWithImpl<$Res, $Val extends ReturnFilter>
    implements $ReturnFilterCopyWith<$Res> {
  _$ReturnFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnDateFrom = null,
    Object? returnDateTo = null,
    Object? amountValueFrom = null,
    Object? amountValueTo = null,
    Object? returnStatusList = null,
  }) {
    return _then(_value.copyWith(
      returnDateFrom: null == returnDateFrom
          ? _value.returnDateFrom
          : returnDateFrom // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      returnDateTo: null == returnDateTo
          ? _value.returnDateTo
          : returnDateTo // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      amountValueFrom: null == amountValueFrom
          ? _value.amountValueFrom
          : amountValueFrom // ignore: cast_nullable_to_non_nullable
              as RangeValue,
      amountValueTo: null == amountValueTo
          ? _value.amountValueTo
          : amountValueTo // ignore: cast_nullable_to_non_nullable
              as RangeValue,
      returnStatusList: null == returnStatusList
          ? _value.returnStatusList
          : returnStatusList // ignore: cast_nullable_to_non_nullable
              as List<StatusType>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReturnFilterCopyWith<$Res>
    implements $ReturnFilterCopyWith<$Res> {
  factory _$$_ReturnFilterCopyWith(
          _$_ReturnFilter value, $Res Function(_$_ReturnFilter) then) =
      __$$_ReturnFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTimeStringValue returnDateFrom,
      DateTimeStringValue returnDateTo,
      RangeValue amountValueFrom,
      RangeValue amountValueTo,
      List<StatusType> returnStatusList});
}

/// @nodoc
class __$$_ReturnFilterCopyWithImpl<$Res>
    extends _$ReturnFilterCopyWithImpl<$Res, _$_ReturnFilter>
    implements _$$_ReturnFilterCopyWith<$Res> {
  __$$_ReturnFilterCopyWithImpl(
      _$_ReturnFilter _value, $Res Function(_$_ReturnFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnDateFrom = null,
    Object? returnDateTo = null,
    Object? amountValueFrom = null,
    Object? amountValueTo = null,
    Object? returnStatusList = null,
  }) {
    return _then(_$_ReturnFilter(
      returnDateFrom: null == returnDateFrom
          ? _value.returnDateFrom
          : returnDateFrom // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      returnDateTo: null == returnDateTo
          ? _value.returnDateTo
          : returnDateTo // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      amountValueFrom: null == amountValueFrom
          ? _value.amountValueFrom
          : amountValueFrom // ignore: cast_nullable_to_non_nullable
              as RangeValue,
      amountValueTo: null == amountValueTo
          ? _value.amountValueTo
          : amountValueTo // ignore: cast_nullable_to_non_nullable
              as RangeValue,
      returnStatusList: null == returnStatusList
          ? _value._returnStatusList
          : returnStatusList // ignore: cast_nullable_to_non_nullable
              as List<StatusType>,
    ));
  }
}

/// @nodoc

class _$_ReturnFilter extends _ReturnFilter {
  _$_ReturnFilter(
      {required this.returnDateFrom,
      required this.returnDateTo,
      required this.amountValueFrom,
      required this.amountValueTo,
      required final List<StatusType> returnStatusList})
      : _returnStatusList = returnStatusList,
        super._();

  @override
  final DateTimeStringValue returnDateFrom;
  @override
  final DateTimeStringValue returnDateTo;
  @override
  final RangeValue amountValueFrom;
  @override
  final RangeValue amountValueTo;
  final List<StatusType> _returnStatusList;
  @override
  List<StatusType> get returnStatusList {
    if (_returnStatusList is EqualUnmodifiableListView)
      return _returnStatusList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_returnStatusList);
  }

  @override
  String toString() {
    return 'ReturnFilter(returnDateFrom: $returnDateFrom, returnDateTo: $returnDateTo, amountValueFrom: $amountValueFrom, amountValueTo: $amountValueTo, returnStatusList: $returnStatusList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnFilter &&
            (identical(other.returnDateFrom, returnDateFrom) ||
                other.returnDateFrom == returnDateFrom) &&
            (identical(other.returnDateTo, returnDateTo) ||
                other.returnDateTo == returnDateTo) &&
            (identical(other.amountValueFrom, amountValueFrom) ||
                other.amountValueFrom == amountValueFrom) &&
            (identical(other.amountValueTo, amountValueTo) ||
                other.amountValueTo == amountValueTo) &&
            const DeepCollectionEquality()
                .equals(other._returnStatusList, _returnStatusList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      returnDateFrom,
      returnDateTo,
      amountValueFrom,
      amountValueTo,
      const DeepCollectionEquality().hash(_returnStatusList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnFilterCopyWith<_$_ReturnFilter> get copyWith =>
      __$$_ReturnFilterCopyWithImpl<_$_ReturnFilter>(this, _$identity);
}

abstract class _ReturnFilter extends ReturnFilter {
  factory _ReturnFilter(
      {required final DateTimeStringValue returnDateFrom,
      required final DateTimeStringValue returnDateTo,
      required final RangeValue amountValueFrom,
      required final RangeValue amountValueTo,
      required final List<StatusType> returnStatusList}) = _$_ReturnFilter;
  _ReturnFilter._() : super._();

  @override
  DateTimeStringValue get returnDateFrom;
  @override
  DateTimeStringValue get returnDateTo;
  @override
  RangeValue get amountValueFrom;
  @override
  RangeValue get amountValueTo;
  @override
  List<StatusType> get returnStatusList;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnFilterCopyWith<_$_ReturnFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
