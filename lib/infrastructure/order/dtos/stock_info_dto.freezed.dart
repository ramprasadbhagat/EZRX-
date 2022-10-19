// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stock_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StockInfoDto _$StockInfoDtoFromJson(Map<String, dynamic> json) {
  return _StockInfoDto.fromJson(json);
}

/// @nodoc
mixin _$StockInfoDto {
  @JsonKey(name: 'MaterialNumber')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'ExpiryDate')
  String get expiryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Batch')
  String get batch => throw _privateConstructorUsedError;
  @JsonKey(name: 'InStock')
  String get inStock => throw _privateConstructorUsedError;
  @JsonKey(name: 'SalesDistrict')
  String? get salesDistrict => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StockInfoDtoCopyWith<StockInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockInfoDtoCopyWith<$Res> {
  factory $StockInfoDtoCopyWith(
          StockInfoDto value, $Res Function(StockInfoDto) then) =
      _$StockInfoDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'MaterialNumber') String materialNumber,
      @JsonKey(name: 'ExpiryDate') String expiryDate,
      @JsonKey(name: 'Batch') String batch,
      @JsonKey(name: 'InStock') String inStock,
      @JsonKey(name: 'SalesDistrict') String? salesDistrict});
}

/// @nodoc
class _$StockInfoDtoCopyWithImpl<$Res> implements $StockInfoDtoCopyWith<$Res> {
  _$StockInfoDtoCopyWithImpl(this._value, this._then);

  final StockInfoDto _value;
  // ignore: unused_field
  final $Res Function(StockInfoDto) _then;

  @override
  $Res call({
    Object? materialNumber = freezed,
    Object? expiryDate = freezed,
    Object? batch = freezed,
    Object? inStock = freezed,
    Object? salesDistrict = freezed,
  }) {
    return _then(_value.copyWith(
      materialNumber: materialNumber == freezed
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: expiryDate == freezed
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      batch: batch == freezed
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      inStock: inStock == freezed
          ? _value.inStock
          : inStock // ignore: cast_nullable_to_non_nullable
              as String,
      salesDistrict: salesDistrict == freezed
          ? _value.salesDistrict
          : salesDistrict // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_StockInfoDtoCopyWith<$Res>
    implements $StockInfoDtoCopyWith<$Res> {
  factory _$$_StockInfoDtoCopyWith(
          _$_StockInfoDto value, $Res Function(_$_StockInfoDto) then) =
      __$$_StockInfoDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'MaterialNumber') String materialNumber,
      @JsonKey(name: 'ExpiryDate') String expiryDate,
      @JsonKey(name: 'Batch') String batch,
      @JsonKey(name: 'InStock') String inStock,
      @JsonKey(name: 'SalesDistrict') String? salesDistrict});
}

/// @nodoc
class __$$_StockInfoDtoCopyWithImpl<$Res>
    extends _$StockInfoDtoCopyWithImpl<$Res>
    implements _$$_StockInfoDtoCopyWith<$Res> {
  __$$_StockInfoDtoCopyWithImpl(
      _$_StockInfoDto _value, $Res Function(_$_StockInfoDto) _then)
      : super(_value, (v) => _then(v as _$_StockInfoDto));

  @override
  _$_StockInfoDto get _value => super._value as _$_StockInfoDto;

  @override
  $Res call({
    Object? materialNumber = freezed,
    Object? expiryDate = freezed,
    Object? batch = freezed,
    Object? inStock = freezed,
    Object? salesDistrict = freezed,
  }) {
    return _then(_$_StockInfoDto(
      materialNumber: materialNumber == freezed
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: expiryDate == freezed
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      batch: batch == freezed
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      inStock: inStock == freezed
          ? _value.inStock
          : inStock // ignore: cast_nullable_to_non_nullable
              as String,
      salesDistrict: salesDistrict == freezed
          ? _value.salesDistrict
          : salesDistrict // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StockInfoDto extends _StockInfoDto {
  const _$_StockInfoDto(
      {@JsonKey(name: 'MaterialNumber') required this.materialNumber,
      @JsonKey(name: 'ExpiryDate') required this.expiryDate,
      @JsonKey(name: 'Batch') required this.batch,
      @JsonKey(name: 'InStock') required this.inStock,
      @JsonKey(name: 'SalesDistrict') required this.salesDistrict})
      : super._();

  factory _$_StockInfoDto.fromJson(Map<String, dynamic> json) =>
      _$$_StockInfoDtoFromJson(json);

  @override
  @JsonKey(name: 'MaterialNumber')
  final String materialNumber;
  @override
  @JsonKey(name: 'ExpiryDate')
  final String expiryDate;
  @override
  @JsonKey(name: 'Batch')
  final String batch;
  @override
  @JsonKey(name: 'InStock')
  final String inStock;
  @override
  @JsonKey(name: 'SalesDistrict')
  final String? salesDistrict;

  @override
  String toString() {
    return 'StockInfoDto(materialNumber: $materialNumber, expiryDate: $expiryDate, batch: $batch, inStock: $inStock, salesDistrict: $salesDistrict)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StockInfoDto &&
            const DeepCollectionEquality()
                .equals(other.materialNumber, materialNumber) &&
            const DeepCollectionEquality()
                .equals(other.expiryDate, expiryDate) &&
            const DeepCollectionEquality().equals(other.batch, batch) &&
            const DeepCollectionEquality().equals(other.inStock, inStock) &&
            const DeepCollectionEquality()
                .equals(other.salesDistrict, salesDistrict));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(materialNumber),
      const DeepCollectionEquality().hash(expiryDate),
      const DeepCollectionEquality().hash(batch),
      const DeepCollectionEquality().hash(inStock),
      const DeepCollectionEquality().hash(salesDistrict));

  @JsonKey(ignore: true)
  @override
  _$$_StockInfoDtoCopyWith<_$_StockInfoDto> get copyWith =>
      __$$_StockInfoDtoCopyWithImpl<_$_StockInfoDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StockInfoDtoToJson(
      this,
    );
  }
}

abstract class _StockInfoDto extends StockInfoDto {
  const factory _StockInfoDto(
      {@JsonKey(name: 'MaterialNumber')
          required final String materialNumber,
      @JsonKey(name: 'ExpiryDate')
          required final String expiryDate,
      @JsonKey(name: 'Batch')
          required final String batch,
      @JsonKey(name: 'InStock')
          required final String inStock,
      @JsonKey(name: 'SalesDistrict')
          required final String? salesDistrict}) = _$_StockInfoDto;
  const _StockInfoDto._() : super._();

  factory _StockInfoDto.fromJson(Map<String, dynamic> json) =
      _$_StockInfoDto.fromJson;

  @override
  @JsonKey(name: 'MaterialNumber')
  String get materialNumber;
  @override
  @JsonKey(name: 'ExpiryDate')
  String get expiryDate;
  @override
  @JsonKey(name: 'Batch')
  String get batch;
  @override
  @JsonKey(name: 'InStock')
  String get inStock;
  @override
  @JsonKey(name: 'SalesDistrict')
  String? get salesDistrict;
  @override
  @JsonKey(ignore: true)
  _$$_StockInfoDtoCopyWith<_$_StockInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}
