// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_basic_information_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MaterialBasicInformationDto _$MaterialBasicInformationDtoFromJson(
    Map<String, dynamic> json) {
  return _MaterialBasicInformationDto.fromJson(json);
}

/// @nodoc
mixin _$MaterialBasicInformationDto {
  @JsonKey(name: 'salesOrg', defaultValue: '')
  String get salesOrg => throw _privateConstructorUsedError;
  @JsonKey(name: 'partnerRole', defaultValue: '')
  String get partnerRole => throw _privateConstructorUsedError;
  @JsonKey(name: 'partnerNumber', defaultValue: '')
  String get partnerNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialBasicInformationDtoCopyWith<MaterialBasicInformationDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialBasicInformationDtoCopyWith<$Res> {
  factory $MaterialBasicInformationDtoCopyWith(
          MaterialBasicInformationDto value,
          $Res Function(MaterialBasicInformationDto) then) =
      _$MaterialBasicInformationDtoCopyWithImpl<$Res,
          MaterialBasicInformationDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'salesOrg', defaultValue: '') String salesOrg,
      @JsonKey(name: 'partnerRole', defaultValue: '') String partnerRole,
      @JsonKey(name: 'partnerNumber', defaultValue: '') String partnerNumber});
}

/// @nodoc
class _$MaterialBasicInformationDtoCopyWithImpl<$Res,
        $Val extends MaterialBasicInformationDto>
    implements $MaterialBasicInformationDtoCopyWith<$Res> {
  _$MaterialBasicInformationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? partnerRole = null,
    Object? partnerNumber = null,
  }) {
    return _then(_value.copyWith(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      partnerRole: null == partnerRole
          ? _value.partnerRole
          : partnerRole // ignore: cast_nullable_to_non_nullable
              as String,
      partnerNumber: null == partnerNumber
          ? _value.partnerNumber
          : partnerNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MaterialBasicInformationDtoCopyWith<$Res>
    implements $MaterialBasicInformationDtoCopyWith<$Res> {
  factory _$$_MaterialBasicInformationDtoCopyWith(
          _$_MaterialBasicInformationDto value,
          $Res Function(_$_MaterialBasicInformationDto) then) =
      __$$_MaterialBasicInformationDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'salesOrg', defaultValue: '') String salesOrg,
      @JsonKey(name: 'partnerRole', defaultValue: '') String partnerRole,
      @JsonKey(name: 'partnerNumber', defaultValue: '') String partnerNumber});
}

/// @nodoc
class __$$_MaterialBasicInformationDtoCopyWithImpl<$Res>
    extends _$MaterialBasicInformationDtoCopyWithImpl<$Res,
        _$_MaterialBasicInformationDto>
    implements _$$_MaterialBasicInformationDtoCopyWith<$Res> {
  __$$_MaterialBasicInformationDtoCopyWithImpl(
      _$_MaterialBasicInformationDto _value,
      $Res Function(_$_MaterialBasicInformationDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? partnerRole = null,
    Object? partnerNumber = null,
  }) {
    return _then(_$_MaterialBasicInformationDto(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      partnerRole: null == partnerRole
          ? _value.partnerRole
          : partnerRole // ignore: cast_nullable_to_non_nullable
              as String,
      partnerNumber: null == partnerNumber
          ? _value.partnerNumber
          : partnerNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MaterialBasicInformationDto extends _MaterialBasicInformationDto {
  const _$_MaterialBasicInformationDto(
      {@JsonKey(name: 'salesOrg', defaultValue: '')
          required this.salesOrg,
      @JsonKey(name: 'partnerRole', defaultValue: '')
          required this.partnerRole,
      @JsonKey(name: 'partnerNumber', defaultValue: '')
          required this.partnerNumber})
      : super._();

  factory _$_MaterialBasicInformationDto.fromJson(Map<String, dynamic> json) =>
      _$$_MaterialBasicInformationDtoFromJson(json);

  @override
  @JsonKey(name: 'salesOrg', defaultValue: '')
  final String salesOrg;
  @override
  @JsonKey(name: 'partnerRole', defaultValue: '')
  final String partnerRole;
  @override
  @JsonKey(name: 'partnerNumber', defaultValue: '')
  final String partnerNumber;

  @override
  String toString() {
    return 'MaterialBasicInformationDto(salesOrg: $salesOrg, partnerRole: $partnerRole, partnerNumber: $partnerNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialBasicInformationDto &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.partnerRole, partnerRole) ||
                other.partnerRole == partnerRole) &&
            (identical(other.partnerNumber, partnerNumber) ||
                other.partnerNumber == partnerNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, salesOrg, partnerRole, partnerNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaterialBasicInformationDtoCopyWith<_$_MaterialBasicInformationDto>
      get copyWith => __$$_MaterialBasicInformationDtoCopyWithImpl<
          _$_MaterialBasicInformationDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MaterialBasicInformationDtoToJson(
      this,
    );
  }
}

abstract class _MaterialBasicInformationDto
    extends MaterialBasicInformationDto {
  const factory _MaterialBasicInformationDto(
          {@JsonKey(name: 'salesOrg', defaultValue: '')
              required final String salesOrg,
          @JsonKey(name: 'partnerRole', defaultValue: '')
              required final String partnerRole,
          @JsonKey(name: 'partnerNumber', defaultValue: '')
              required final String partnerNumber}) =
      _$_MaterialBasicInformationDto;
  const _MaterialBasicInformationDto._() : super._();

  factory _MaterialBasicInformationDto.fromJson(Map<String, dynamic> json) =
      _$_MaterialBasicInformationDto.fromJson;

  @override
  @JsonKey(name: 'salesOrg', defaultValue: '')
  String get salesOrg;
  @override
  @JsonKey(name: 'partnerRole', defaultValue: '')
  String get partnerRole;
  @override
  @JsonKey(name: 'partnerNumber', defaultValue: '')
  String get partnerNumber;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialBasicInformationDtoCopyWith<_$_MaterialBasicInformationDto>
      get copyWith => throw _privateConstructorUsedError;
}
