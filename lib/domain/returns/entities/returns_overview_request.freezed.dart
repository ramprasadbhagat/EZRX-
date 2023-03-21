// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'returns_overview_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReturnsOverviewRequest {
  String get submitDate => throw _privateConstructorUsedError;
  String get returnId => throw _privateConstructorUsedError;
  String get refundTotal => throw _privateConstructorUsedError;
  String get requestStatus => throw _privateConstructorUsedError;
  List<ReturnsOverviewItem> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnsOverviewRequestCopyWith<ReturnsOverviewRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnsOverviewRequestCopyWith<$Res> {
  factory $ReturnsOverviewRequestCopyWith(ReturnsOverviewRequest value,
          $Res Function(ReturnsOverviewRequest) then) =
      _$ReturnsOverviewRequestCopyWithImpl<$Res, ReturnsOverviewRequest>;
  @useResult
  $Res call(
      {String submitDate,
      String returnId,
      String refundTotal,
      String requestStatus,
      List<ReturnsOverviewItem> items});
}

/// @nodoc
class _$ReturnsOverviewRequestCopyWithImpl<$Res,
        $Val extends ReturnsOverviewRequest>
    implements $ReturnsOverviewRequestCopyWith<$Res> {
  _$ReturnsOverviewRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? submitDate = null,
    Object? returnId = null,
    Object? refundTotal = null,
    Object? requestStatus = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      submitDate: null == submitDate
          ? _value.submitDate
          : submitDate // ignore: cast_nullable_to_non_nullable
              as String,
      returnId: null == returnId
          ? _value.returnId
          : returnId // ignore: cast_nullable_to_non_nullable
              as String,
      refundTotal: null == refundTotal
          ? _value.refundTotal
          : refundTotal // ignore: cast_nullable_to_non_nullable
              as String,
      requestStatus: null == requestStatus
          ? _value.requestStatus
          : requestStatus // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReturnsOverviewItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReturnsOverviewRequestCopyWith<$Res>
    implements $ReturnsOverviewRequestCopyWith<$Res> {
  factory _$$_ReturnsOverviewRequestCopyWith(_$_ReturnsOverviewRequest value,
          $Res Function(_$_ReturnsOverviewRequest) then) =
      __$$_ReturnsOverviewRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String submitDate,
      String returnId,
      String refundTotal,
      String requestStatus,
      List<ReturnsOverviewItem> items});
}

/// @nodoc
class __$$_ReturnsOverviewRequestCopyWithImpl<$Res>
    extends _$ReturnsOverviewRequestCopyWithImpl<$Res,
        _$_ReturnsOverviewRequest>
    implements _$$_ReturnsOverviewRequestCopyWith<$Res> {
  __$$_ReturnsOverviewRequestCopyWithImpl(_$_ReturnsOverviewRequest _value,
      $Res Function(_$_ReturnsOverviewRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? submitDate = null,
    Object? returnId = null,
    Object? refundTotal = null,
    Object? requestStatus = null,
    Object? items = null,
  }) {
    return _then(_$_ReturnsOverviewRequest(
      submitDate: null == submitDate
          ? _value.submitDate
          : submitDate // ignore: cast_nullable_to_non_nullable
              as String,
      returnId: null == returnId
          ? _value.returnId
          : returnId // ignore: cast_nullable_to_non_nullable
              as String,
      refundTotal: null == refundTotal
          ? _value.refundTotal
          : refundTotal // ignore: cast_nullable_to_non_nullable
              as String,
      requestStatus: null == requestStatus
          ? _value.requestStatus
          : requestStatus // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReturnsOverviewItem>,
    ));
  }
}

/// @nodoc

class _$_ReturnsOverviewRequest extends _ReturnsOverviewRequest {
  const _$_ReturnsOverviewRequest(
      {required this.submitDate,
      required this.returnId,
      required this.refundTotal,
      required this.requestStatus,
      required final List<ReturnsOverviewItem> items})
      : _items = items,
        super._();

  @override
  final String submitDate;
  @override
  final String returnId;
  @override
  final String refundTotal;
  @override
  final String requestStatus;
  final List<ReturnsOverviewItem> _items;
  @override
  List<ReturnsOverviewItem> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ReturnsOverviewRequest(submitDate: $submitDate, returnId: $returnId, refundTotal: $refundTotal, requestStatus: $requestStatus, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnsOverviewRequest &&
            (identical(other.submitDate, submitDate) ||
                other.submitDate == submitDate) &&
            (identical(other.returnId, returnId) ||
                other.returnId == returnId) &&
            (identical(other.refundTotal, refundTotal) ||
                other.refundTotal == refundTotal) &&
            (identical(other.requestStatus, requestStatus) ||
                other.requestStatus == requestStatus) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(runtimeType, submitDate, returnId,
      refundTotal, requestStatus, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnsOverviewRequestCopyWith<_$_ReturnsOverviewRequest> get copyWith =>
      __$$_ReturnsOverviewRequestCopyWithImpl<_$_ReturnsOverviewRequest>(
          this, _$identity);
}

abstract class _ReturnsOverviewRequest extends ReturnsOverviewRequest {
  const factory _ReturnsOverviewRequest(
          {required final String submitDate,
          required final String returnId,
          required final String refundTotal,
          required final String requestStatus,
          required final List<ReturnsOverviewItem> items}) =
      _$_ReturnsOverviewRequest;
  const _ReturnsOverviewRequest._() : super._();

  @override
  String get submitDate;
  @override
  String get returnId;
  @override
  String get refundTotal;
  @override
  String get requestStatus;
  @override
  List<ReturnsOverviewItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnsOverviewRequestCopyWith<_$_ReturnsOverviewRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
