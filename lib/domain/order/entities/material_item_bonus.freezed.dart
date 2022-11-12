// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'material_item_bonus.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MaterialItemBonus {
  MaterialNumber get materialNumber => throw _privateConstructorUsedError;
  int get qty => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  String get materialDescription => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaterialItemBonusCopyWith<MaterialItemBonus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialItemBonusCopyWith<$Res> {
  factory $MaterialItemBonusCopyWith(
          MaterialItemBonus value, $Res Function(MaterialItemBonus) then) =
      _$MaterialItemBonusCopyWithImpl<$Res, MaterialItemBonus>;
  @useResult
  $Res call(
      {MaterialNumber materialNumber,
      int qty,
      String comment,
      String materialDescription});
}

/// @nodoc
class _$MaterialItemBonusCopyWithImpl<$Res, $Val extends MaterialItemBonus>
    implements $MaterialItemBonusCopyWith<$Res> {
  _$MaterialItemBonusCopyWithImpl(this._value, this._then);

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
    Object? materialDescription = null,
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
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MaterialItemBonusCopyWith<$Res>
    implements $MaterialItemBonusCopyWith<$Res> {
  factory _$$_MaterialItemBonusCopyWith(_$_MaterialItemBonus value,
          $Res Function(_$_MaterialItemBonus) then) =
      __$$_MaterialItemBonusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MaterialNumber materialNumber,
      int qty,
      String comment,
      String materialDescription});
}

/// @nodoc
class __$$_MaterialItemBonusCopyWithImpl<$Res>
    extends _$MaterialItemBonusCopyWithImpl<$Res, _$_MaterialItemBonus>
    implements _$$_MaterialItemBonusCopyWith<$Res> {
  __$$_MaterialItemBonusCopyWithImpl(
      _$_MaterialItemBonus _value, $Res Function(_$_MaterialItemBonus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? qty = null,
    Object? comment = null,
    Object? materialDescription = null,
  }) {
    return _then(_$_MaterialItemBonus(
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
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MaterialItemBonus extends _MaterialItemBonus {
  const _$_MaterialItemBonus(
      {required this.materialNumber,
      required this.qty,
      required this.comment,
      required this.materialDescription})
      : super._();

  @override
  final MaterialNumber materialNumber;
  @override
  final int qty;
  @override
  final String comment;
  @override
  final String materialDescription;

  @override
  String toString() {
    return 'MaterialItemBonus(materialNumber: $materialNumber, qty: $qty, comment: $comment, materialDescription: $materialDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialItemBonus &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.materialDescription, materialDescription) ||
                other.materialDescription == materialDescription));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, materialNumber, qty, comment, materialDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaterialItemBonusCopyWith<_$_MaterialItemBonus> get copyWith =>
      __$$_MaterialItemBonusCopyWithImpl<_$_MaterialItemBonus>(
          this, _$identity);
}

abstract class _MaterialItemBonus extends MaterialItemBonus {
  const factory _MaterialItemBonus(
      {required final MaterialNumber materialNumber,
      required final int qty,
      required final String comment,
      required final String materialDescription}) = _$_MaterialItemBonus;
  const _MaterialItemBonus._() : super._();

  @override
  MaterialNumber get materialNumber;
  @override
  int get qty;
  @override
  String get comment;
  @override
  String get materialDescription;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialItemBonusCopyWith<_$_MaterialItemBonus> get copyWith =>
      throw _privateConstructorUsedError;
}
