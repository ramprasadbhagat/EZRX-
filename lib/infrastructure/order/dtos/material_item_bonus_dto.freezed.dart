// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'material_item_bonus_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MaterialItemBonusDto _$MaterialItemBonusDtoFromJson(Map<String, dynamic> json) {
  return _MaterialItemBonusDto.fromJson(json);
}

/// @nodoc
mixin _$MaterialItemBonusDto {
  @JsonKey(name: 'MaterialNumber', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'freeQuantity', defaultValue: 0)
  int get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment', defaultValue: '')
  String get comment => throw _privateConstructorUsedError;
  @JsonKey(name: 'MaterialDescription', defaultValue: '')
  String get materialDescription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialItemBonusDtoCopyWith<MaterialItemBonusDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialItemBonusDtoCopyWith<$Res> {
  factory $MaterialItemBonusDtoCopyWith(MaterialItemBonusDto value,
          $Res Function(MaterialItemBonusDto) then) =
      _$MaterialItemBonusDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'MaterialNumber', defaultValue: '')
          String materialNumber,
      @JsonKey(name: 'freeQuantity', defaultValue: 0)
          int qty,
      @JsonKey(name: 'comment', defaultValue: '')
          String comment,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
          String materialDescription});
}

/// @nodoc
class _$MaterialItemBonusDtoCopyWithImpl<$Res>
    implements $MaterialItemBonusDtoCopyWith<$Res> {
  _$MaterialItemBonusDtoCopyWithImpl(this._value, this._then);

  final MaterialItemBonusDto _value;
  // ignore: unused_field
  final $Res Function(MaterialItemBonusDto) _then;

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
abstract class _$$_MaterialItemBonusDtoCopyWith<$Res>
    implements $MaterialItemBonusDtoCopyWith<$Res> {
  factory _$$_MaterialItemBonusDtoCopyWith(_$_MaterialItemBonusDto value,
          $Res Function(_$_MaterialItemBonusDto) then) =
      __$$_MaterialItemBonusDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'MaterialNumber', defaultValue: '')
          String materialNumber,
      @JsonKey(name: 'freeQuantity', defaultValue: 0)
          int qty,
      @JsonKey(name: 'comment', defaultValue: '')
          String comment,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
          String materialDescription});
}

/// @nodoc
class __$$_MaterialItemBonusDtoCopyWithImpl<$Res>
    extends _$MaterialItemBonusDtoCopyWithImpl<$Res>
    implements _$$_MaterialItemBonusDtoCopyWith<$Res> {
  __$$_MaterialItemBonusDtoCopyWithImpl(_$_MaterialItemBonusDto _value,
      $Res Function(_$_MaterialItemBonusDto) _then)
      : super(_value, (v) => _then(v as _$_MaterialItemBonusDto));

  @override
  _$_MaterialItemBonusDto get _value => super._value as _$_MaterialItemBonusDto;

  @override
  $Res call({
    Object? materialNumber = freezed,
    Object? qty = freezed,
    Object? comment = freezed,
    Object? materialDescription = freezed,
  }) {
    return _then(_$_MaterialItemBonusDto(
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
@JsonSerializable()
class _$_MaterialItemBonusDto extends _MaterialItemBonusDto {
  const _$_MaterialItemBonusDto(
      {@JsonKey(name: 'MaterialNumber', defaultValue: '')
          required this.materialNumber,
      @JsonKey(name: 'freeQuantity', defaultValue: 0)
          required this.qty,
      @JsonKey(name: 'comment', defaultValue: '')
          required this.comment,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
          required this.materialDescription})
      : super._();

  factory _$_MaterialItemBonusDto.fromJson(Map<String, dynamic> json) =>
      _$$_MaterialItemBonusDtoFromJson(json);

  @override
  @JsonKey(name: 'MaterialNumber', defaultValue: '')
  final String materialNumber;
  @override
  @JsonKey(name: 'freeQuantity', defaultValue: 0)
  final int qty;
  @override
  @JsonKey(name: 'comment', defaultValue: '')
  final String comment;
  @override
  @JsonKey(name: 'MaterialDescription', defaultValue: '')
  final String materialDescription;

  @override
  String toString() {
    return 'MaterialItemBonusDto(materialNumber: $materialNumber, qty: $qty, comment: $comment, materialDescription: $materialDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialItemBonusDto &&
            const DeepCollectionEquality()
                .equals(other.materialNumber, materialNumber) &&
            const DeepCollectionEquality().equals(other.qty, qty) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality()
                .equals(other.materialDescription, materialDescription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(materialNumber),
      const DeepCollectionEquality().hash(qty),
      const DeepCollectionEquality().hash(comment),
      const DeepCollectionEquality().hash(materialDescription));

  @JsonKey(ignore: true)
  @override
  _$$_MaterialItemBonusDtoCopyWith<_$_MaterialItemBonusDto> get copyWith =>
      __$$_MaterialItemBonusDtoCopyWithImpl<_$_MaterialItemBonusDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MaterialItemBonusDtoToJson(
      this,
    );
  }
}

abstract class _MaterialItemBonusDto extends MaterialItemBonusDto {
  const factory _MaterialItemBonusDto(
      {@JsonKey(name: 'MaterialNumber', defaultValue: '')
          required final String materialNumber,
      @JsonKey(name: 'freeQuantity', defaultValue: 0)
          required final int qty,
      @JsonKey(name: 'comment', defaultValue: '')
          required final String comment,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
          required final String materialDescription}) = _$_MaterialItemBonusDto;
  const _MaterialItemBonusDto._() : super._();

  factory _MaterialItemBonusDto.fromJson(Map<String, dynamic> json) =
      _$_MaterialItemBonusDto.fromJson;

  @override
  @JsonKey(name: 'MaterialNumber', defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'freeQuantity', defaultValue: 0)
  int get qty;
  @override
  @JsonKey(name: 'comment', defaultValue: '')
  String get comment;
  @override
  @JsonKey(name: 'MaterialDescription', defaultValue: '')
  String get materialDescription;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialItemBonusDtoCopyWith<_$_MaterialItemBonusDto> get copyWith =>
      throw _privateConstructorUsedError;
}
