// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransactionParams {
  String get customerCode => throw _privateConstructorUsedError;
  int get first => throw _privateConstructorUsedError;
  int get after => throw _privateConstructorUsedError;
  PaymentSummaryFilter get filter => throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionParamsCopyWith<TransactionParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionParamsCopyWith<$Res> {
  factory $TransactionParamsCopyWith(
          TransactionParams value, $Res Function(TransactionParams) then) =
      _$TransactionParamsCopyWithImpl<$Res, TransactionParams>;
  @useResult
  $Res call(
      {String customerCode,
      int first,
      int after,
      PaymentSummaryFilter filter,
      SearchKey searchKey});

  $PaymentSummaryFilterCopyWith<$Res> get filter;
}

/// @nodoc
class _$TransactionParamsCopyWithImpl<$Res, $Val extends TransactionParams>
    implements $TransactionParamsCopyWith<$Res> {
  _$TransactionParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCode = null,
    Object? first = null,
    Object? after = null,
    Object? filter = null,
    Object? searchKey = null,
  }) {
    return _then(_value.copyWith(
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as int,
      after: null == after
          ? _value.after
          : after // ignore: cast_nullable_to_non_nullable
              as int,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as PaymentSummaryFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentSummaryFilterCopyWith<$Res> get filter {
    return $PaymentSummaryFilterCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TransactionParamsCopyWith<$Res>
    implements $TransactionParamsCopyWith<$Res> {
  factory _$$_TransactionParamsCopyWith(_$_TransactionParams value,
          $Res Function(_$_TransactionParams) then) =
      __$$_TransactionParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String customerCode,
      int first,
      int after,
      PaymentSummaryFilter filter,
      SearchKey searchKey});

  @override
  $PaymentSummaryFilterCopyWith<$Res> get filter;
}

/// @nodoc
class __$$_TransactionParamsCopyWithImpl<$Res>
    extends _$TransactionParamsCopyWithImpl<$Res, _$_TransactionParams>
    implements _$$_TransactionParamsCopyWith<$Res> {
  __$$_TransactionParamsCopyWithImpl(
      _$_TransactionParams _value, $Res Function(_$_TransactionParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCode = null,
    Object? first = null,
    Object? after = null,
    Object? filter = null,
    Object? searchKey = null,
  }) {
    return _then(_$_TransactionParams(
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as int,
      after: null == after
          ? _value.after
          : after // ignore: cast_nullable_to_non_nullable
              as int,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as PaymentSummaryFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }
}

/// @nodoc

class _$_TransactionParams extends _TransactionParams {
  const _$_TransactionParams(
      {required this.customerCode,
      required this.first,
      required this.after,
      required this.filter,
      required this.searchKey})
      : super._();

  @override
  final String customerCode;
  @override
  final int first;
  @override
  final int after;
  @override
  final PaymentSummaryFilter filter;
  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'TransactionParams(customerCode: $customerCode, first: $first, after: $after, filter: $filter, searchKey: $searchKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionParams &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.after, after) || other.after == after) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, customerCode, first, after, filter, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionParamsCopyWith<_$_TransactionParams> get copyWith =>
      __$$_TransactionParamsCopyWithImpl<_$_TransactionParams>(
          this, _$identity);
}

abstract class _TransactionParams extends TransactionParams {
  const factory _TransactionParams(
      {required final String customerCode,
      required final int first,
      required final int after,
      required final PaymentSummaryFilter filter,
      required final SearchKey searchKey}) = _$_TransactionParams;
  const _TransactionParams._() : super._();

  @override
  String get customerCode;
  @override
  int get first;
  @override
  int get after;
  @override
  PaymentSummaryFilter get filter;
  @override
  SearchKey get searchKey;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionParamsCopyWith<_$_TransactionParams> get copyWith =>
      throw _privateConstructorUsedError;
}
