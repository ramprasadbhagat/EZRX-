// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_material_item_bonus.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SubmitMaterialItemBonus {
  MaterialNumber get materialNumber => throw _privateConstructorUsedError;
  int get qty => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubmitMaterialItemBonusCopyWith<SubmitMaterialItemBonus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitMaterialItemBonusCopyWith<$Res> {
  factory $SubmitMaterialItemBonusCopyWith(SubmitMaterialItemBonus value,
          $Res Function(SubmitMaterialItemBonus) then) =
      _$SubmitMaterialItemBonusCopyWithImpl<$Res, SubmitMaterialItemBonus>;
  @useResult
  $Res call({MaterialNumber materialNumber, int qty, String comment});
}

/// @nodoc
class _$SubmitMaterialItemBonusCopyWithImpl<$Res,
        $Val extends SubmitMaterialItemBonus>
    implements $SubmitMaterialItemBonusCopyWith<$Res> {
  _$SubmitMaterialItemBonusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? qty = null,
    Object? comment = null,
  }) {
    return _then(_value.copyWith(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubmitMaterialItemBonusCopyWith<$Res>
    implements $SubmitMaterialItemBonusCopyWith<$Res> {
  factory _$$_SubmitMaterialItemBonusCopyWith(_$_SubmitMaterialItemBonus value,
          $Res Function(_$_SubmitMaterialItemBonus) then) =
      __$$_SubmitMaterialItemBonusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MaterialNumber materialNumber, int qty, String comment});
}

/// @nodoc
class __$$_SubmitMaterialItemBonusCopyWithImpl<$Res>
    extends _$SubmitMaterialItemBonusCopyWithImpl<$Res,
        _$_SubmitMaterialItemBonus>
    implements _$$_SubmitMaterialItemBonusCopyWith<$Res> {
  __$$_SubmitMaterialItemBonusCopyWithImpl(_$_SubmitMaterialItemBonus _value,
      $Res Function(_$_SubmitMaterialItemBonus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? qty = null,
    Object? comment = null,
  }) {
    return _then(_$_SubmitMaterialItemBonus(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SubmitMaterialItemBonus implements _SubmitMaterialItemBonus {
  _$_SubmitMaterialItemBonus(
      {required this.materialNumber, required this.qty, required this.comment});

  @override
  final MaterialNumber materialNumber;
  @override
  final int qty;
  @override
  final String comment;

  @override
  String toString() {
    return 'SubmitMaterialItemBonus(materialNumber: $materialNumber, qty: $qty, comment: $comment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubmitMaterialItemBonus &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialNumber, qty, comment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubmitMaterialItemBonusCopyWith<_$_SubmitMaterialItemBonus>
      get copyWith =>
          __$$_SubmitMaterialItemBonusCopyWithImpl<_$_SubmitMaterialItemBonus>(
              this, _$identity);
}

abstract class _SubmitMaterialItemBonus implements SubmitMaterialItemBonus {
  factory _SubmitMaterialItemBonus(
      {required final MaterialNumber materialNumber,
      required final int qty,
      required final String comment}) = _$_SubmitMaterialItemBonus;

  @override
  MaterialNumber get materialNumber;
  @override
  int get qty;
  @override
  String get comment;
  @override
  @JsonKey(ignore: true)
  _$$_SubmitMaterialItemBonusCopyWith<_$_SubmitMaterialItemBonus>
      get copyWith => throw _privateConstructorUsedError;
}
