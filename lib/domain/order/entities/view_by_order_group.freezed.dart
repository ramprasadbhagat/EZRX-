// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_by_order_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ViewByOrderHistoryGroup {
  DateTimeStringValue get createdDate => throw _privateConstructorUsedError;
  List<OrderHistoryDetailsOrderHeader> get orderHeaders =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewByOrderHistoryGroupCopyWith<ViewByOrderHistoryGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByOrderHistoryGroupCopyWith<$Res> {
  factory $ViewByOrderHistoryGroupCopyWith(ViewByOrderHistoryGroup value,
          $Res Function(ViewByOrderHistoryGroup) then) =
      _$ViewByOrderHistoryGroupCopyWithImpl<$Res, ViewByOrderHistoryGroup>;
  @useResult
  $Res call(
      {DateTimeStringValue createdDate,
      List<OrderHistoryDetailsOrderHeader> orderHeaders});
}

/// @nodoc
class _$ViewByOrderHistoryGroupCopyWithImpl<$Res,
        $Val extends ViewByOrderHistoryGroup>
    implements $ViewByOrderHistoryGroupCopyWith<$Res> {
  _$ViewByOrderHistoryGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdDate = null,
    Object? orderHeaders = null,
  }) {
    return _then(_value.copyWith(
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      orderHeaders: null == orderHeaders
          ? _value.orderHeaders
          : orderHeaders // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderHeader>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ViewByOrderHistoryGroupCopyWith<$Res>
    implements $ViewByOrderHistoryGroupCopyWith<$Res> {
  factory _$$_ViewByOrderHistoryGroupCopyWith(_$_ViewByOrderHistoryGroup value,
          $Res Function(_$_ViewByOrderHistoryGroup) then) =
      __$$_ViewByOrderHistoryGroupCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTimeStringValue createdDate,
      List<OrderHistoryDetailsOrderHeader> orderHeaders});
}

/// @nodoc
class __$$_ViewByOrderHistoryGroupCopyWithImpl<$Res>
    extends _$ViewByOrderHistoryGroupCopyWithImpl<$Res,
        _$_ViewByOrderHistoryGroup>
    implements _$$_ViewByOrderHistoryGroupCopyWith<$Res> {
  __$$_ViewByOrderHistoryGroupCopyWithImpl(_$_ViewByOrderHistoryGroup _value,
      $Res Function(_$_ViewByOrderHistoryGroup) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdDate = null,
    Object? orderHeaders = null,
  }) {
    return _then(_$_ViewByOrderHistoryGroup(
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      orderHeaders: null == orderHeaders
          ? _value._orderHeaders
          : orderHeaders // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderHeader>,
    ));
  }
}

/// @nodoc

class _$_ViewByOrderHistoryGroup implements _ViewByOrderHistoryGroup {
  _$_ViewByOrderHistoryGroup(
      {required this.createdDate,
      required final List<OrderHistoryDetailsOrderHeader> orderHeaders})
      : _orderHeaders = orderHeaders;

  @override
  final DateTimeStringValue createdDate;
  final List<OrderHistoryDetailsOrderHeader> _orderHeaders;
  @override
  List<OrderHistoryDetailsOrderHeader> get orderHeaders {
    if (_orderHeaders is EqualUnmodifiableListView) return _orderHeaders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHeaders);
  }

  @override
  String toString() {
    return 'ViewByOrderHistoryGroup(createdDate: $createdDate, orderHeaders: $orderHeaders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewByOrderHistoryGroup &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            const DeepCollectionEquality()
                .equals(other._orderHeaders, _orderHeaders));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createdDate,
      const DeepCollectionEquality().hash(_orderHeaders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewByOrderHistoryGroupCopyWith<_$_ViewByOrderHistoryGroup>
      get copyWith =>
          __$$_ViewByOrderHistoryGroupCopyWithImpl<_$_ViewByOrderHistoryGroup>(
              this, _$identity);
}

abstract class _ViewByOrderHistoryGroup implements ViewByOrderHistoryGroup {
  factory _ViewByOrderHistoryGroup(
          {required final DateTimeStringValue createdDate,
          required final List<OrderHistoryDetailsOrderHeader> orderHeaders}) =
      _$_ViewByOrderHistoryGroup;

  @override
  DateTimeStringValue get createdDate;
  @override
  List<OrderHistoryDetailsOrderHeader> get orderHeaders;
  @override
  @JsonKey(ignore: true)
  _$$_ViewByOrderHistoryGroupCopyWith<_$_ViewByOrderHistoryGroup>
      get copyWith => throw _privateConstructorUsedError;
}
