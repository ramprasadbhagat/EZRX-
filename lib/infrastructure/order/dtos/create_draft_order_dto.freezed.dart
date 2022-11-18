// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_draft_order_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateDraftOrderDto _$CreateDraftOrderDtoFromJson(Map<String, dynamic> json) {
  return _CreateDraftOrderDto.fromJson(json);
}

/// @nodoc
mixin _$CreateDraftOrderDto {
  @JsonKey(name: 'draftOrder', defaultValue: false)
  bool get draftOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateDraftOrderDtoCopyWith<CreateDraftOrderDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateDraftOrderDtoCopyWith<$Res> {
  factory $CreateDraftOrderDtoCopyWith(
          CreateDraftOrderDto value, $Res Function(CreateDraftOrderDto) then) =
      _$CreateDraftOrderDtoCopyWithImpl<$Res, CreateDraftOrderDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'draftOrder', defaultValue: false) bool draftOrder});
}

/// @nodoc
class _$CreateDraftOrderDtoCopyWithImpl<$Res, $Val extends CreateDraftOrderDto>
    implements $CreateDraftOrderDtoCopyWith<$Res> {
  _$CreateDraftOrderDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$_CreateDraftOrderDtoCopyWith<$Res>
    implements $CreateDraftOrderDtoCopyWith<$Res> {
  factory _$$_CreateDraftOrderDtoCopyWith(_$_CreateDraftOrderDto value,
          $Res Function(_$_CreateDraftOrderDto) then) =
      __$$_CreateDraftOrderDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'draftOrder', defaultValue: false) bool draftOrder});
}

/// @nodoc
class __$$_CreateDraftOrderDtoCopyWithImpl<$Res>
    extends _$CreateDraftOrderDtoCopyWithImpl<$Res, _$_CreateDraftOrderDto>
    implements _$$_CreateDraftOrderDtoCopyWith<$Res> {
  __$$_CreateDraftOrderDtoCopyWithImpl(_$_CreateDraftOrderDto _value,
      $Res Function(_$_CreateDraftOrderDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? draftOrder = null,
  }) {
    return _then(_$_CreateDraftOrderDto(
      draftOrder: null == draftOrder
          ? _value.draftOrder
          : draftOrder // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateDraftOrderDto extends _CreateDraftOrderDto {
  const _$_CreateDraftOrderDto(
      {@JsonKey(name: 'draftOrder', defaultValue: false)
          required this.draftOrder})
      : super._();

  factory _$_CreateDraftOrderDto.fromJson(Map<String, dynamic> json) =>
      _$$_CreateDraftOrderDtoFromJson(json);

  @override
  @JsonKey(name: 'draftOrder', defaultValue: false)
  final bool draftOrder;

  @override
  String toString() {
    return 'CreateDraftOrderDto(draftOrder: $draftOrder)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateDraftOrderDto &&
            (identical(other.draftOrder, draftOrder) ||
                other.draftOrder == draftOrder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, draftOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateDraftOrderDtoCopyWith<_$_CreateDraftOrderDto> get copyWith =>
      __$$_CreateDraftOrderDtoCopyWithImpl<_$_CreateDraftOrderDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateDraftOrderDtoToJson(
      this,
    );
  }
}

abstract class _CreateDraftOrderDto extends CreateDraftOrderDto {
  const factory _CreateDraftOrderDto(
      {@JsonKey(name: 'draftOrder', defaultValue: false)
          required final bool draftOrder}) = _$_CreateDraftOrderDto;
  const _CreateDraftOrderDto._() : super._();

  factory _CreateDraftOrderDto.fromJson(Map<String, dynamic> json) =
      _$_CreateDraftOrderDto.fromJson;

  @override
  @JsonKey(name: 'draftOrder', defaultValue: false)
  bool get draftOrder;
  @override
  @JsonKey(ignore: true)
  _$$_CreateDraftOrderDtoCopyWith<_$_CreateDraftOrderDto> get copyWith =>
      throw _privateConstructorUsedError;
}
