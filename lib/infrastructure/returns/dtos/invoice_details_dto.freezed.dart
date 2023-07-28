// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InvoiceDetailsDto _$InvoiceDetailsDtoFromJson(Map<String, dynamic> json) {
  return _InvoiceDetailsDto.fromJson(json);
}

/// @nodoc
mixin _$InvoiceDetailsDto {
  @JsonKey(name: 'invoiceNumber', defaultValue: '')
  String get invoiceNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'salesOrg', defaultValue: '')
  String get salesOrg => throw _privateConstructorUsedError;
  @JsonKey(name: 'materials', defaultValue: <ReturnItemDetailsDto>[])
  List<ReturnItemDetailsDto> get materials =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvoiceDetailsDtoCopyWith<InvoiceDetailsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceDetailsDtoCopyWith<$Res> {
  factory $InvoiceDetailsDtoCopyWith(
          InvoiceDetailsDto value, $Res Function(InvoiceDetailsDto) then) =
      _$InvoiceDetailsDtoCopyWithImpl<$Res, InvoiceDetailsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'invoiceNumber', defaultValue: '') String invoiceNumber,
      @JsonKey(name: 'salesOrg', defaultValue: '') String salesOrg,
      @JsonKey(name: 'materials', defaultValue: <ReturnItemDetailsDto>[])
      List<ReturnItemDetailsDto> materials});
}

/// @nodoc
class _$InvoiceDetailsDtoCopyWithImpl<$Res, $Val extends InvoiceDetailsDto>
    implements $InvoiceDetailsDtoCopyWith<$Res> {
  _$InvoiceDetailsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceNumber = null,
    Object? salesOrg = null,
    Object? materials = null,
  }) {
    return _then(_value.copyWith(
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      materials: null == materials
          ? _value.materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<ReturnItemDetailsDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InvoiceDetailsDtoCopyWith<$Res>
    implements $InvoiceDetailsDtoCopyWith<$Res> {
  factory _$$_InvoiceDetailsDtoCopyWith(_$_InvoiceDetailsDto value,
          $Res Function(_$_InvoiceDetailsDto) then) =
      __$$_InvoiceDetailsDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'invoiceNumber', defaultValue: '') String invoiceNumber,
      @JsonKey(name: 'salesOrg', defaultValue: '') String salesOrg,
      @JsonKey(name: 'materials', defaultValue: <ReturnItemDetailsDto>[])
      List<ReturnItemDetailsDto> materials});
}

/// @nodoc
class __$$_InvoiceDetailsDtoCopyWithImpl<$Res>
    extends _$InvoiceDetailsDtoCopyWithImpl<$Res, _$_InvoiceDetailsDto>
    implements _$$_InvoiceDetailsDtoCopyWith<$Res> {
  __$$_InvoiceDetailsDtoCopyWithImpl(
      _$_InvoiceDetailsDto _value, $Res Function(_$_InvoiceDetailsDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceNumber = null,
    Object? salesOrg = null,
    Object? materials = null,
  }) {
    return _then(_$_InvoiceDetailsDto(
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      materials: null == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<ReturnItemDetailsDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InvoiceDetailsDto extends _InvoiceDetailsDto {
  const _$_InvoiceDetailsDto(
      {@JsonKey(name: 'invoiceNumber', defaultValue: '')
      required this.invoiceNumber,
      @JsonKey(name: 'salesOrg', defaultValue: '') required this.salesOrg,
      @JsonKey(name: 'materials', defaultValue: <ReturnItemDetailsDto>[])
      required final List<ReturnItemDetailsDto> materials})
      : _materials = materials,
        super._();

  factory _$_InvoiceDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$$_InvoiceDetailsDtoFromJson(json);

  @override
  @JsonKey(name: 'invoiceNumber', defaultValue: '')
  final String invoiceNumber;
  @override
  @JsonKey(name: 'salesOrg', defaultValue: '')
  final String salesOrg;
  final List<ReturnItemDetailsDto> _materials;
  @override
  @JsonKey(name: 'materials', defaultValue: <ReturnItemDetailsDto>[])
  List<ReturnItemDetailsDto> get materials {
    if (_materials is EqualUnmodifiableListView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materials);
  }

  @override
  String toString() {
    return 'InvoiceDetailsDto(invoiceNumber: $invoiceNumber, salesOrg: $salesOrg, materials: $materials)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvoiceDetailsDto &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, invoiceNumber, salesOrg,
      const DeepCollectionEquality().hash(_materials));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InvoiceDetailsDtoCopyWith<_$_InvoiceDetailsDto> get copyWith =>
      __$$_InvoiceDetailsDtoCopyWithImpl<_$_InvoiceDetailsDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InvoiceDetailsDtoToJson(
      this,
    );
  }
}

abstract class _InvoiceDetailsDto extends InvoiceDetailsDto {
  const factory _InvoiceDetailsDto(
          {@JsonKey(name: 'invoiceNumber', defaultValue: '')
          required final String invoiceNumber,
          @JsonKey(name: 'salesOrg', defaultValue: '')
          required final String salesOrg,
          @JsonKey(name: 'materials', defaultValue: <ReturnItemDetailsDto>[])
          required final List<ReturnItemDetailsDto> materials}) =
      _$_InvoiceDetailsDto;
  const _InvoiceDetailsDto._() : super._();

  factory _InvoiceDetailsDto.fromJson(Map<String, dynamic> json) =
      _$_InvoiceDetailsDto.fromJson;

  @override
  @JsonKey(name: 'invoiceNumber', defaultValue: '')
  String get invoiceNumber;
  @override
  @JsonKey(name: 'salesOrg', defaultValue: '')
  String get salesOrg;
  @override
  @JsonKey(name: 'materials', defaultValue: <ReturnItemDetailsDto>[])
  List<ReturnItemDetailsDto> get materials;
  @override
  @JsonKey(ignore: true)
  _$$_InvoiceDetailsDtoCopyWith<_$_InvoiceDetailsDto> get copyWith =>
      throw _privateConstructorUsedError;
}
