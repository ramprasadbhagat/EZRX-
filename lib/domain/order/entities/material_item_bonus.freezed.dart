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
  String get materialNumber => throw _privateConstructorUsedError;
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
      _$MaterialItemBonusCopyWithImpl<$Res>;
  $Res call(
      {String materialNumber,
      int qty,
      String comment,
      String materialDescription});
}

/// @nodoc
class _$MaterialItemBonusCopyWithImpl<$Res>
    implements $MaterialItemBonusCopyWith<$Res> {
  _$MaterialItemBonusCopyWithImpl(this._value, this._then);

  final MaterialItemBonus _value;
  // ignore: unused_field
  final $Res Function(MaterialItemBonus) _then;

  @override
  $Res call({
    Object? materialNumber = freezed,
    Object? qty = freezed,
    Object? comment = freezed,
    Object? materialDescription = freezed,
  }) {
    return _then(_value.copyWith(
      materialNumber: materialNumber == freezed
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      qty: qty == freezed
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: materialDescription == freezed
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_MaterialItemBonusCopyWith<$Res>
    implements $MaterialItemBonusCopyWith<$Res> {
  factory _$$_MaterialItemBonusCopyWith(_$_MaterialItemBonus value,
          $Res Function(_$_MaterialItemBonus) then) =
      __$$_MaterialItemBonusCopyWithImpl<$Res>;
  @override
  $Res call(
      {String materialNumber,
      int qty,
      String comment,
      String materialDescription});
}

/// @nodoc
class __$$_MaterialItemBonusCopyWithImpl<$Res>
    extends _$MaterialItemBonusCopyWithImpl<$Res>
    implements _$$_MaterialItemBonusCopyWith<$Res> {
  __$$_MaterialItemBonusCopyWithImpl(
      _$_MaterialItemBonus _value, $Res Function(_$_MaterialItemBonus) _then)
      : super(_value, (v) => _then(v as _$_MaterialItemBonus));

  @override
  _$_MaterialItemBonus get _value => super._value as _$_MaterialItemBonus;

  @override
  $Res call({
    Object? materialNumber = freezed,
    Object? qty = freezed,
    Object? comment = freezed,
    Object? materialDescription = freezed,
  }) {
    return _then(_$_MaterialItemBonus(
      materialNumber: materialNumber == freezed
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      qty: qty == freezed
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: materialDescription == freezed
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
  final String materialNumber;
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
            const DeepCollectionEquality()
                .equals(other.materialNumber, materialNumber) &&
            const DeepCollectionEquality().equals(other.qty, qty) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality()
                .equals(other.materialDescription, materialDescription));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(materialNumber),
      const DeepCollectionEquality().hash(qty),
      const DeepCollectionEquality().hash(comment),
      const DeepCollectionEquality().hash(materialDescription));

  @JsonKey(ignore: true)
  @override
  _$$_MaterialItemBonusCopyWith<_$_MaterialItemBonus> get copyWith =>
      __$$_MaterialItemBonusCopyWithImpl<_$_MaterialItemBonus>(
          this, _$identity);
}

abstract class _MaterialItemBonus extends MaterialItemBonus {
  const factory _MaterialItemBonus(
      {required final String materialNumber,
      required final int qty,
      required final String comment,
      required final String materialDescription}) = _$_MaterialItemBonus;
  const _MaterialItemBonus._() : super._();

  @override
  String get materialNumber;
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
