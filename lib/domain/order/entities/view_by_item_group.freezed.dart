// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_by_item_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ViewByItemGroup {
  DateTimeStringValue get createdDate => throw _privateConstructorUsedError;
  List<OrderHistoryItem> get orderHistoryItem =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewByItemGroupCopyWith<ViewByItemGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByItemGroupCopyWith<$Res> {
  factory $ViewByItemGroupCopyWith(
          ViewByItemGroup value, $Res Function(ViewByItemGroup) then) =
      _$ViewByItemGroupCopyWithImpl<$Res, ViewByItemGroup>;
  @useResult
  $Res call(
      {DateTimeStringValue createdDate,
      List<OrderHistoryItem> orderHistoryItem});
}

/// @nodoc
class _$ViewByItemGroupCopyWithImpl<$Res, $Val extends ViewByItemGroup>
    implements $ViewByItemGroupCopyWith<$Res> {
  _$ViewByItemGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdDate = null,
    Object? orderHistoryItem = null,
  }) {
    return _then(_value.copyWith(
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      orderHistoryItem: null == orderHistoryItem
          ? _value.orderHistoryItem
          : orderHistoryItem // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ViewByItemGroupCopyWith<$Res>
    implements $ViewByItemGroupCopyWith<$Res> {
  factory _$$_ViewByItemGroupCopyWith(
          _$_ViewByItemGroup value, $Res Function(_$_ViewByItemGroup) then) =
      __$$_ViewByItemGroupCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTimeStringValue createdDate,
      List<OrderHistoryItem> orderHistoryItem});
}

/// @nodoc
class __$$_ViewByItemGroupCopyWithImpl<$Res>
    extends _$ViewByItemGroupCopyWithImpl<$Res, _$_ViewByItemGroup>
    implements _$$_ViewByItemGroupCopyWith<$Res> {
  __$$_ViewByItemGroupCopyWithImpl(
      _$_ViewByItemGroup _value, $Res Function(_$_ViewByItemGroup) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdDate = null,
    Object? orderHistoryItem = null,
  }) {
    return _then(_$_ViewByItemGroup(
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      orderHistoryItem: null == orderHistoryItem
          ? _value._orderHistoryItem
          : orderHistoryItem // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryItem>,
    ));
  }
}

/// @nodoc

class _$_ViewByItemGroup implements _ViewByItemGroup {
  _$_ViewByItemGroup(
      {required this.createdDate,
      required final List<OrderHistoryItem> orderHistoryItem})
      : _orderHistoryItem = orderHistoryItem;

  @override
  final DateTimeStringValue createdDate;
  final List<OrderHistoryItem> _orderHistoryItem;
  @override
  List<OrderHistoryItem> get orderHistoryItem {
    if (_orderHistoryItem is EqualUnmodifiableListView)
      return _orderHistoryItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHistoryItem);
  }

  @override
  String toString() {
    return 'ViewByItemGroup(createdDate: $createdDate, orderHistoryItem: $orderHistoryItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewByItemGroup &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            const DeepCollectionEquality()
                .equals(other._orderHistoryItem, _orderHistoryItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createdDate,
      const DeepCollectionEquality().hash(_orderHistoryItem));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewByItemGroupCopyWith<_$_ViewByItemGroup> get copyWith =>
      __$$_ViewByItemGroupCopyWithImpl<_$_ViewByItemGroup>(this, _$identity);
}

abstract class _ViewByItemGroup implements ViewByItemGroup {
  factory _ViewByItemGroup(
          {required final DateTimeStringValue createdDate,
          required final List<OrderHistoryItem> orderHistoryItem}) =
      _$_ViewByItemGroup;

  @override
  DateTimeStringValue get createdDate;
  @override
  List<OrderHistoryItem> get orderHistoryItem;
  @override
  @JsonKey(ignore: true)
  _$$_ViewByItemGroupCopyWith<_$_ViewByItemGroup> get copyWith =>
      throw _privateConstructorUsedError;
}
