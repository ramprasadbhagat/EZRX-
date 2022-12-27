// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'is_approver_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IsApproverDto _$IsApproverDtoFromJson(Map<String, dynamic> json) {
  return _IsApproverDto.fromJson(json);
}

/// @nodoc
mixin _$IsApproverDto {
  bool get isApprover => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IsApproverDtoCopyWith<IsApproverDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IsApproverDtoCopyWith<$Res> {
  factory $IsApproverDtoCopyWith(
          IsApproverDto value, $Res Function(IsApproverDto) then) =
      _$IsApproverDtoCopyWithImpl<$Res, IsApproverDto>;
  @useResult
  $Res call({bool isApprover});
}

/// @nodoc
class _$IsApproverDtoCopyWithImpl<$Res, $Val extends IsApproverDto>
    implements $IsApproverDtoCopyWith<$Res> {
  _$IsApproverDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isApprover = null,
  }) {
    return _then(_value.copyWith(
      isApprover: null == isApprover
          ? _value.isApprover
          : isApprover // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IsApproverDtoCopyWith<$Res>
    implements $IsApproverDtoCopyWith<$Res> {
  factory _$$_IsApproverDtoCopyWith(
          _$_IsApproverDto value, $Res Function(_$_IsApproverDto) then) =
      __$$_IsApproverDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isApprover});
}

/// @nodoc
class __$$_IsApproverDtoCopyWithImpl<$Res>
    extends _$IsApproverDtoCopyWithImpl<$Res, _$_IsApproverDto>
    implements _$$_IsApproverDtoCopyWith<$Res> {
  __$$_IsApproverDtoCopyWithImpl(
      _$_IsApproverDto _value, $Res Function(_$_IsApproverDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isApprover = null,
  }) {
    return _then(_$_IsApproverDto(
      isApprover: null == isApprover
          ? _value.isApprover
          : isApprover // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IsApproverDto extends _IsApproverDto {
  _$_IsApproverDto({required this.isApprover}) : super._();

  factory _$_IsApproverDto.fromJson(Map<String, dynamic> json) =>
      _$$_IsApproverDtoFromJson(json);

  @override
  final bool isApprover;

  @override
  String toString() {
    return 'IsApproverDto(isApprover: $isApprover)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IsApproverDto &&
            (identical(other.isApprover, isApprover) ||
                other.isApprover == isApprover));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isApprover);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IsApproverDtoCopyWith<_$_IsApproverDto> get copyWith =>
      __$$_IsApproverDtoCopyWithImpl<_$_IsApproverDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IsApproverDtoToJson(
      this,
    );
  }
}

abstract class _IsApproverDto extends IsApproverDto {
  factory _IsApproverDto({required final bool isApprover}) = _$_IsApproverDto;
  _IsApproverDto._() : super._();

  factory _IsApproverDto.fromJson(Map<String, dynamic> json) =
      _$_IsApproverDto.fromJson;

  @override
  bool get isApprover;
  @override
  @JsonKey(ignore: true)
  _$$_IsApproverDtoCopyWith<_$_IsApproverDto> get copyWith =>
      throw _privateConstructorUsedError;
}
