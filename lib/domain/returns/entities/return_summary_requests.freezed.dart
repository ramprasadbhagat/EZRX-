// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_summary_requests.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReturnSummaryRequest {
  StatusType get requestStatus => throw _privateConstructorUsedError;
  DateTimeStringValue get submitDate => throw _privateConstructorUsedError;
  String get returnId => throw _privateConstructorUsedError;
  double get refundTotal => throw _privateConstructorUsedError;
  List<ReturnSummaryRequestItems> get items =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnSummaryRequestCopyWith<ReturnSummaryRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnSummaryRequestCopyWith<$Res> {
  factory $ReturnSummaryRequestCopyWith(ReturnSummaryRequest value,
          $Res Function(ReturnSummaryRequest) then) =
      _$ReturnSummaryRequestCopyWithImpl<$Res, ReturnSummaryRequest>;
  @useResult
  $Res call(
      {StatusType requestStatus,
      DateTimeStringValue submitDate,
      String returnId,
      double refundTotal,
      List<ReturnSummaryRequestItems> items});
}

/// @nodoc
class _$ReturnSummaryRequestCopyWithImpl<$Res,
        $Val extends ReturnSummaryRequest>
    implements $ReturnSummaryRequestCopyWith<$Res> {
  _$ReturnSummaryRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestStatus = null,
    Object? submitDate = null,
    Object? returnId = null,
    Object? refundTotal = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      requestStatus: null == requestStatus
          ? _value.requestStatus
          : requestStatus // ignore: cast_nullable_to_non_nullable
              as StatusType,
      submitDate: null == submitDate
          ? _value.submitDate
          : submitDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      returnId: null == returnId
          ? _value.returnId
          : returnId // ignore: cast_nullable_to_non_nullable
              as String,
      refundTotal: null == refundTotal
          ? _value.refundTotal
          : refundTotal // ignore: cast_nullable_to_non_nullable
              as double,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReturnSummaryRequestItems>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReturnSummaryRequestCopyWith<$Res>
    implements $ReturnSummaryRequestCopyWith<$Res> {
  factory _$$_ReturnSummaryRequestCopyWith(_$_ReturnSummaryRequest value,
          $Res Function(_$_ReturnSummaryRequest) then) =
      __$$_ReturnSummaryRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StatusType requestStatus,
      DateTimeStringValue submitDate,
      String returnId,
      double refundTotal,
      List<ReturnSummaryRequestItems> items});
}

/// @nodoc
class __$$_ReturnSummaryRequestCopyWithImpl<$Res>
    extends _$ReturnSummaryRequestCopyWithImpl<$Res, _$_ReturnSummaryRequest>
    implements _$$_ReturnSummaryRequestCopyWith<$Res> {
  __$$_ReturnSummaryRequestCopyWithImpl(_$_ReturnSummaryRequest _value,
      $Res Function(_$_ReturnSummaryRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestStatus = null,
    Object? submitDate = null,
    Object? returnId = null,
    Object? refundTotal = null,
    Object? items = null,
  }) {
    return _then(_$_ReturnSummaryRequest(
      requestStatus: null == requestStatus
          ? _value.requestStatus
          : requestStatus // ignore: cast_nullable_to_non_nullable
              as StatusType,
      submitDate: null == submitDate
          ? _value.submitDate
          : submitDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      returnId: null == returnId
          ? _value.returnId
          : returnId // ignore: cast_nullable_to_non_nullable
              as String,
      refundTotal: null == refundTotal
          ? _value.refundTotal
          : refundTotal // ignore: cast_nullable_to_non_nullable
              as double,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReturnSummaryRequestItems>,
    ));
  }
}

/// @nodoc

class _$_ReturnSummaryRequest extends _ReturnSummaryRequest {
  const _$_ReturnSummaryRequest(
      {required this.requestStatus,
      required this.submitDate,
      required this.returnId,
      required this.refundTotal,
      required final List<ReturnSummaryRequestItems> items})
      : _items = items,
        super._();

  @override
  final StatusType requestStatus;
  @override
  final DateTimeStringValue submitDate;
  @override
  final String returnId;
  @override
  final double refundTotal;
  final List<ReturnSummaryRequestItems> _items;
  @override
  List<ReturnSummaryRequestItems> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ReturnSummaryRequest(requestStatus: $requestStatus, submitDate: $submitDate, returnId: $returnId, refundTotal: $refundTotal, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnSummaryRequest &&
            (identical(other.requestStatus, requestStatus) ||
                other.requestStatus == requestStatus) &&
            (identical(other.submitDate, submitDate) ||
                other.submitDate == submitDate) &&
            (identical(other.returnId, returnId) ||
                other.returnId == returnId) &&
            (identical(other.refundTotal, refundTotal) ||
                other.refundTotal == refundTotal) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestStatus, submitDate,
      returnId, refundTotal, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnSummaryRequestCopyWith<_$_ReturnSummaryRequest> get copyWith =>
      __$$_ReturnSummaryRequestCopyWithImpl<_$_ReturnSummaryRequest>(
          this, _$identity);
}

abstract class _ReturnSummaryRequest extends ReturnSummaryRequest {
  const factory _ReturnSummaryRequest(
          {required final StatusType requestStatus,
          required final DateTimeStringValue submitDate,
          required final String returnId,
          required final double refundTotal,
          required final List<ReturnSummaryRequestItems> items}) =
      _$_ReturnSummaryRequest;
  const _ReturnSummaryRequest._() : super._();

  @override
  StatusType get requestStatus;
  @override
  DateTimeStringValue get submitDate;
  @override
  String get returnId;
  @override
  double get refundTotal;
  @override
  List<ReturnSummaryRequestItems> get items;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnSummaryRequestCopyWith<_$_ReturnSummaryRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
