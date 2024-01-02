// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'e_invoice_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EInvoiceDto _$EInvoiceDtoFromJson(Map<String, dynamic> json) {
  return _EInvoiceDto.fromJson(json);
}

/// @nodoc
mixin _$EInvoiceDto {
  @JsonKey(name: 'name', defaultValue: '')
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EInvoiceDtoCopyWith<EInvoiceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EInvoiceDtoCopyWith<$Res> {
  factory $EInvoiceDtoCopyWith(
          EInvoiceDto value, $Res Function(EInvoiceDto) then) =
      _$EInvoiceDtoCopyWithImpl<$Res, EInvoiceDto>;
  @useResult
  $Res call({@JsonKey(name: 'name', defaultValue: '') String name});
}

/// @nodoc
class _$EInvoiceDtoCopyWithImpl<$Res, $Val extends EInvoiceDto>
    implements $EInvoiceDtoCopyWith<$Res> {
  _$EInvoiceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EInvoiceDtoCopyWith<$Res>
    implements $EInvoiceDtoCopyWith<$Res> {
  factory _$$_EInvoiceDtoCopyWith(
          _$_EInvoiceDto value, $Res Function(_$_EInvoiceDto) then) =
      __$$_EInvoiceDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'name', defaultValue: '') String name});
}

/// @nodoc
class __$$_EInvoiceDtoCopyWithImpl<$Res>
    extends _$EInvoiceDtoCopyWithImpl<$Res, _$_EInvoiceDto>
    implements _$$_EInvoiceDtoCopyWith<$Res> {
  __$$_EInvoiceDtoCopyWithImpl(
      _$_EInvoiceDto _value, $Res Function(_$_EInvoiceDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$_EInvoiceDto(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EInvoiceDto extends _EInvoiceDto {
  _$_EInvoiceDto({@JsonKey(name: 'name', defaultValue: '') required this.name})
      : super._();

  factory _$_EInvoiceDto.fromJson(Map<String, dynamic> json) =>
      _$$_EInvoiceDtoFromJson(json);

  @override
  @JsonKey(name: 'name', defaultValue: '')
  final String name;

  @override
  String toString() {
    return 'EInvoiceDto(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EInvoiceDto &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EInvoiceDtoCopyWith<_$_EInvoiceDto> get copyWith =>
      __$$_EInvoiceDtoCopyWithImpl<_$_EInvoiceDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EInvoiceDtoToJson(
      this,
    );
  }
}

abstract class _EInvoiceDto extends EInvoiceDto {
  factory _EInvoiceDto(
      {@JsonKey(name: 'name', defaultValue: '')
      required final String name}) = _$_EInvoiceDto;
  _EInvoiceDto._() : super._();

  factory _EInvoiceDto.fromJson(Map<String, dynamic> json) =
      _$_EInvoiceDto.fromJson;

  @override
  @JsonKey(name: 'name', defaultValue: '')
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_EInvoiceDtoCopyWith<_$_EInvoiceDto> get copyWith =>
      throw _privateConstructorUsedError;
}
