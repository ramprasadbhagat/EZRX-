// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_draft_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateDraftOrder {
  bool get draftOrder => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateDraftOrderCopyWith<CreateDraftOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateDraftOrderCopyWith<$Res> {
  factory $CreateDraftOrderCopyWith(
          CreateDraftOrder value, $Res Function(CreateDraftOrder) then) =
      _$CreateDraftOrderCopyWithImpl<$Res, CreateDraftOrder>;
  @useResult
  $Res call({bool draftOrder});
}

/// @nodoc
class _$CreateDraftOrderCopyWithImpl<$Res, $Val extends CreateDraftOrder>
    implements $CreateDraftOrderCopyWith<$Res> {
  _$CreateDraftOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? draftOrder = null,
  }) {
    return _then(_value.copyWith(
      draftOrder: null == draftOrder
          ? _value.draftOrder
          : draftOrder // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateDraftOrderCopyWith<$Res>
    implements $CreateDraftOrderCopyWith<$Res> {
  factory _$$_CreateDraftOrderCopyWith(
          _$_CreateDraftOrder value, $Res Function(_$_CreateDraftOrder) then) =
      __$$_CreateDraftOrderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool draftOrder});
}

/// @nodoc
class __$$_CreateDraftOrderCopyWithImpl<$Res>
    extends _$CreateDraftOrderCopyWithImpl<$Res, _$_CreateDraftOrder>
    implements _$$_CreateDraftOrderCopyWith<$Res> {
  __$$_CreateDraftOrderCopyWithImpl(
      _$_CreateDraftOrder _value, $Res Function(_$_CreateDraftOrder) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? draftOrder = null,
  }) {
    return _then(_$_CreateDraftOrder(
      draftOrder: null == draftOrder
          ? _value.draftOrder
          : draftOrder // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CreateDraftOrder extends _CreateDraftOrder {
  const _$_CreateDraftOrder({required this.draftOrder}) : super._();

  @override
  final bool draftOrder;

  @override
  String toString() {
    return 'CreateDraftOrder(draftOrder: $draftOrder)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateDraftOrder &&
            (identical(other.draftOrder, draftOrder) ||
                other.draftOrder == draftOrder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, draftOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateDraftOrderCopyWith<_$_CreateDraftOrder> get copyWith =>
      __$$_CreateDraftOrderCopyWithImpl<_$_CreateDraftOrder>(this, _$identity);
}

abstract class _CreateDraftOrder extends CreateDraftOrder {
  const factory _CreateDraftOrder({required final bool draftOrder}) =
      _$_CreateDraftOrder;
  const _CreateDraftOrder._() : super._();

  @override
  bool get draftOrder;
  @override
  @JsonKey(ignore: true)
  _$$_CreateDraftOrderCopyWith<_$_CreateDraftOrder> get copyWith =>
      throw _privateConstructorUsedError;
}
