// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'submit_material_item_bonus_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubmitMaterialItemBonusDto _$SubmitMaterialItemBonusDtoFromJson(
    Map<String, dynamic> json) {
  return _SubmitMaterialItemBonusDto.fromJson(json);
}

/// @nodoc
mixin _$SubmitMaterialItemBonusDto {
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty', defaultValue: 0)
  int get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment', defaultValue: '')
  String get comment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubmitMaterialItemBonusDtoCopyWith<SubmitMaterialItemBonusDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitMaterialItemBonusDtoCopyWith<$Res> {
  factory $SubmitMaterialItemBonusDtoCopyWith(SubmitMaterialItemBonusDto value,
          $Res Function(SubmitMaterialItemBonusDto) then) =
      _$SubmitMaterialItemBonusDtoCopyWithImpl<$Res,
          SubmitMaterialItemBonusDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'materialNumber', defaultValue: '') String materialNumber,
      @JsonKey(name: 'qty', defaultValue: 0) int qty,
      @JsonKey(name: 'comment', defaultValue: '') String comment});
}

/// @nodoc
class _$SubmitMaterialItemBonusDtoCopyWithImpl<$Res,
        $Val extends SubmitMaterialItemBonusDto>
    implements $SubmitMaterialItemBonusDtoCopyWith<$Res> {
  _$SubmitMaterialItemBonusDtoCopyWithImpl(this._value, this._then);

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
              as String,
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
abstract class _$$_SubmitMaterialItemBonusDtoCopyWith<$Res>
    implements $SubmitMaterialItemBonusDtoCopyWith<$Res> {
  factory _$$_SubmitMaterialItemBonusDtoCopyWith(
          _$_SubmitMaterialItemBonusDto value,
          $Res Function(_$_SubmitMaterialItemBonusDto) then) =
      __$$_SubmitMaterialItemBonusDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'materialNumber', defaultValue: '') String materialNumber,
      @JsonKey(name: 'qty', defaultValue: 0) int qty,
      @JsonKey(name: 'comment', defaultValue: '') String comment});
}

/// @nodoc
class __$$_SubmitMaterialItemBonusDtoCopyWithImpl<$Res>
    extends _$SubmitMaterialItemBonusDtoCopyWithImpl<$Res,
        _$_SubmitMaterialItemBonusDto>
    implements _$$_SubmitMaterialItemBonusDtoCopyWith<$Res> {
  __$$_SubmitMaterialItemBonusDtoCopyWithImpl(
      _$_SubmitMaterialItemBonusDto _value,
      $Res Function(_$_SubmitMaterialItemBonusDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? qty = null,
    Object? comment = null,
  }) {
    return _then(_$_SubmitMaterialItemBonusDto(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
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
@JsonSerializable()
class _$_SubmitMaterialItemBonusDto extends _SubmitMaterialItemBonusDto {
  _$_SubmitMaterialItemBonusDto(
      {@JsonKey(name: 'materialNumber', defaultValue: '')
          required this.materialNumber,
      @JsonKey(name: 'qty', defaultValue: 0)
          required this.qty,
      @JsonKey(name: 'comment', defaultValue: '')
          required this.comment})
      : super._();

  factory _$_SubmitMaterialItemBonusDto.fromJson(Map<String, dynamic> json) =>
      _$$_SubmitMaterialItemBonusDtoFromJson(json);

  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  final String materialNumber;
  @override
  @JsonKey(name: 'qty', defaultValue: 0)
  final int qty;
  @override
  @JsonKey(name: 'comment', defaultValue: '')
  final String comment;

  @override
  String toString() {
    return 'SubmitMaterialItemBonusDto(materialNumber: $materialNumber, qty: $qty, comment: $comment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubmitMaterialItemBonusDto &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, materialNumber, qty, comment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubmitMaterialItemBonusDtoCopyWith<_$_SubmitMaterialItemBonusDto>
      get copyWith => __$$_SubmitMaterialItemBonusDtoCopyWithImpl<
          _$_SubmitMaterialItemBonusDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubmitMaterialItemBonusDtoToJson(
      this,
    );
  }
}

abstract class _SubmitMaterialItemBonusDto extends SubmitMaterialItemBonusDto {
  factory _SubmitMaterialItemBonusDto(
      {@JsonKey(name: 'materialNumber', defaultValue: '')
          required final String materialNumber,
      @JsonKey(name: 'qty', defaultValue: 0)
          required final int qty,
      @JsonKey(name: 'comment', defaultValue: '')
          required final String comment}) = _$_SubmitMaterialItemBonusDto;
  _SubmitMaterialItemBonusDto._() : super._();

  factory _SubmitMaterialItemBonusDto.fromJson(Map<String, dynamic> json) =
      _$_SubmitMaterialItemBonusDto.fromJson;

  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'qty', defaultValue: 0)
  int get qty;
  @override
  @JsonKey(name: 'comment', defaultValue: '')
  String get comment;
  @override
  @JsonKey(ignore: true)
  _$$_SubmitMaterialItemBonusDtoCopyWith<_$_SubmitMaterialItemBonusDto>
      get copyWith => throw _privateConstructorUsedError;
}
