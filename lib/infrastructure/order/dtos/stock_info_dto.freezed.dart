// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MaterialStockInfoDto _$MaterialStockInfoDtoFromJson(Map<String, dynamic> json) {
  return _MaterialStockInfoDto.fromJson(json);
}

/// @nodoc
mixin _$MaterialStockInfoDto {
  @JsonKey(name: 'MaterialNumber', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'StockInformation', defaultValue: [])
  List<StockInfoDto> get stockInformation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialStockInfoDtoCopyWith<MaterialStockInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialStockInfoDtoCopyWith<$Res> {
  factory $MaterialStockInfoDtoCopyWith(MaterialStockInfoDto value,
          $Res Function(MaterialStockInfoDto) then) =
      _$MaterialStockInfoDtoCopyWithImpl<$Res, MaterialStockInfoDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'MaterialNumber', defaultValue: '') String materialNumber,
      @JsonKey(name: 'StockInformation', defaultValue: [])
      List<StockInfoDto> stockInformation});
}

/// @nodoc
class _$MaterialStockInfoDtoCopyWithImpl<$Res,
        $Val extends MaterialStockInfoDto>
    implements $MaterialStockInfoDtoCopyWith<$Res> {
  _$MaterialStockInfoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? stockInformation = null,
  }) {
    return _then(_value.copyWith(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      stockInformation: null == stockInformation
          ? _value.stockInformation
          : stockInformation // ignore: cast_nullable_to_non_nullable
              as List<StockInfoDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MaterialStockInfoDtoCopyWith<$Res>
    implements $MaterialStockInfoDtoCopyWith<$Res> {
  factory _$$_MaterialStockInfoDtoCopyWith(_$_MaterialStockInfoDto value,
          $Res Function(_$_MaterialStockInfoDto) then) =
      __$$_MaterialStockInfoDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'MaterialNumber', defaultValue: '') String materialNumber,
      @JsonKey(name: 'StockInformation', defaultValue: [])
      List<StockInfoDto> stockInformation});
}

/// @nodoc
class __$$_MaterialStockInfoDtoCopyWithImpl<$Res>
    extends _$MaterialStockInfoDtoCopyWithImpl<$Res, _$_MaterialStockInfoDto>
    implements _$$_MaterialStockInfoDtoCopyWith<$Res> {
  __$$_MaterialStockInfoDtoCopyWithImpl(_$_MaterialStockInfoDto _value,
      $Res Function(_$_MaterialStockInfoDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? stockInformation = null,
  }) {
    return _then(_$_MaterialStockInfoDto(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      stockInformation: null == stockInformation
          ? _value._stockInformation
          : stockInformation // ignore: cast_nullable_to_non_nullable
              as List<StockInfoDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MaterialStockInfoDto extends _MaterialStockInfoDto {
  _$_MaterialStockInfoDto(
      {@JsonKey(name: 'MaterialNumber', defaultValue: '')
      required this.materialNumber,
      @JsonKey(name: 'StockInformation', defaultValue: [])
      required final List<StockInfoDto> stockInformation})
      : _stockInformation = stockInformation,
        super._();

  factory _$_MaterialStockInfoDto.fromJson(Map<String, dynamic> json) =>
      _$$_MaterialStockInfoDtoFromJson(json);

  @override
  @JsonKey(name: 'MaterialNumber', defaultValue: '')
  final String materialNumber;
  final List<StockInfoDto> _stockInformation;
  @override
  @JsonKey(name: 'StockInformation', defaultValue: [])
  List<StockInfoDto> get stockInformation {
    if (_stockInformation is EqualUnmodifiableListView)
      return _stockInformation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stockInformation);
  }

  @override
  String toString() {
    return 'MaterialStockInfoDto(materialNumber: $materialNumber, stockInformation: $stockInformation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialStockInfoDto &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            const DeepCollectionEquality()
                .equals(other._stockInformation, _stockInformation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, materialNumber,
      const DeepCollectionEquality().hash(_stockInformation));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaterialStockInfoDtoCopyWith<_$_MaterialStockInfoDto> get copyWith =>
      __$$_MaterialStockInfoDtoCopyWithImpl<_$_MaterialStockInfoDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MaterialStockInfoDtoToJson(
      this,
    );
  }
}

abstract class _MaterialStockInfoDto extends MaterialStockInfoDto {
  factory _MaterialStockInfoDto(
          {@JsonKey(name: 'MaterialNumber', defaultValue: '')
          required final String materialNumber,
          @JsonKey(name: 'StockInformation', defaultValue: [])
          required final List<StockInfoDto> stockInformation}) =
      _$_MaterialStockInfoDto;
  _MaterialStockInfoDto._() : super._();

  factory _MaterialStockInfoDto.fromJson(Map<String, dynamic> json) =
      _$_MaterialStockInfoDto.fromJson;

  @override
  @JsonKey(name: 'MaterialNumber', defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'StockInformation', defaultValue: [])
  List<StockInfoDto> get stockInformation;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialStockInfoDtoCopyWith<_$_MaterialStockInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

StockInfoDto _$StockInfoDtoFromJson(Map<String, dynamic> json) {
  return _StockInfoDto.fromJson(json);
}

/// @nodoc
mixin _$StockInfoDto {
  @JsonKey(name: 'MaterialNumber', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'ExpiryDate', defaultValue: '')
  String get expiryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Batch', defaultValue: '')
  String get batch => throw _privateConstructorUsedError;
  @JsonKey(name: 'InStock', defaultValue: '')
  String get inStock => throw _privateConstructorUsedError;
  @JsonKey(name: 'SalesDistrict', defaultValue: '')
  String get salesDistrict => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StockInfoDtoCopyWith<StockInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockInfoDtoCopyWith<$Res> {
  factory $StockInfoDtoCopyWith(
          StockInfoDto value, $Res Function(StockInfoDto) then) =
      _$StockInfoDtoCopyWithImpl<$Res, StockInfoDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'MaterialNumber', defaultValue: '') String materialNumber,
      @JsonKey(name: 'ExpiryDate', defaultValue: '') String expiryDate,
      @JsonKey(name: 'Batch', defaultValue: '') String batch,
      @JsonKey(name: 'InStock', defaultValue: '') String inStock,
      @JsonKey(name: 'SalesDistrict', defaultValue: '') String salesDistrict});
}

/// @nodoc
class _$StockInfoDtoCopyWithImpl<$Res, $Val extends StockInfoDto>
    implements $StockInfoDtoCopyWith<$Res> {
  _$StockInfoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? expiryDate = null,
    Object? batch = null,
    Object? inStock = null,
    Object? salesDistrict = null,
  }) {
    return _then(_value.copyWith(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      inStock: null == inStock
          ? _value.inStock
          : inStock // ignore: cast_nullable_to_non_nullable
              as String,
      salesDistrict: null == salesDistrict
          ? _value.salesDistrict
          : salesDistrict // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StockInfoDtoCopyWith<$Res>
    implements $StockInfoDtoCopyWith<$Res> {
  factory _$$_StockInfoDtoCopyWith(
          _$_StockInfoDto value, $Res Function(_$_StockInfoDto) then) =
      __$$_StockInfoDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'MaterialNumber', defaultValue: '') String materialNumber,
      @JsonKey(name: 'ExpiryDate', defaultValue: '') String expiryDate,
      @JsonKey(name: 'Batch', defaultValue: '') String batch,
      @JsonKey(name: 'InStock', defaultValue: '') String inStock,
      @JsonKey(name: 'SalesDistrict', defaultValue: '') String salesDistrict});
}

/// @nodoc
class __$$_StockInfoDtoCopyWithImpl<$Res>
    extends _$StockInfoDtoCopyWithImpl<$Res, _$_StockInfoDto>
    implements _$$_StockInfoDtoCopyWith<$Res> {
  __$$_StockInfoDtoCopyWithImpl(
      _$_StockInfoDto _value, $Res Function(_$_StockInfoDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? expiryDate = null,
    Object? batch = null,
    Object? inStock = null,
    Object? salesDistrict = null,
  }) {
    return _then(_$_StockInfoDto(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      inStock: null == inStock
          ? _value.inStock
          : inStock // ignore: cast_nullable_to_non_nullable
              as String,
      salesDistrict: null == salesDistrict
          ? _value.salesDistrict
          : salesDistrict // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StockInfoDto extends _StockInfoDto {
  const _$_StockInfoDto(
      {@JsonKey(name: 'MaterialNumber', defaultValue: '')
      required this.materialNumber,
      @JsonKey(name: 'ExpiryDate', defaultValue: '') required this.expiryDate,
      @JsonKey(name: 'Batch', defaultValue: '') required this.batch,
      @JsonKey(name: 'InStock', defaultValue: '') required this.inStock,
      @JsonKey(name: 'SalesDistrict', defaultValue: '')
      required this.salesDistrict})
      : super._();

  factory _$_StockInfoDto.fromJson(Map<String, dynamic> json) =>
      _$$_StockInfoDtoFromJson(json);

  @override
  @JsonKey(name: 'MaterialNumber', defaultValue: '')
  final String materialNumber;
  @override
  @JsonKey(name: 'ExpiryDate', defaultValue: '')
  final String expiryDate;
  @override
  @JsonKey(name: 'Batch', defaultValue: '')
  final String batch;
  @override
  @JsonKey(name: 'InStock', defaultValue: '')
  final String inStock;
  @override
  @JsonKey(name: 'SalesDistrict', defaultValue: '')
  final String salesDistrict;

  @override
  String toString() {
    return 'StockInfoDto(materialNumber: $materialNumber, expiryDate: $expiryDate, batch: $batch, inStock: $inStock, salesDistrict: $salesDistrict)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StockInfoDto &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.inStock, inStock) || other.inStock == inStock) &&
            (identical(other.salesDistrict, salesDistrict) ||
                other.salesDistrict == salesDistrict));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, materialNumber, expiryDate, batch, inStock, salesDistrict);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      {@JsonKey(name: 'MaterialNumber', defaultValue: '')
      required final String materialNumber,
      @JsonKey(name: 'ExpiryDate', defaultValue: '')
      required final String expiryDate,
      @JsonKey(name: 'Batch', defaultValue: '') required final String batch,
      @JsonKey(name: 'InStock', defaultValue: '') required final String inStock,
      @JsonKey(name: 'SalesDistrict', defaultValue: '')
      required final String salesDistrict}) = _$_StockInfoDto;
  const _StockInfoDto._() : super._();

  factory _StockInfoDto.fromJson(Map<String, dynamic> json) =
      _$_StockInfoDto.fromJson;

  @override
  @JsonKey(name: 'MaterialNumber', defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'ExpiryDate', defaultValue: '')
  String get expiryDate;
  @override
  @JsonKey(name: 'Batch', defaultValue: '')
  String get batch;
  @override
  @JsonKey(name: 'InStock', defaultValue: '')
  String get inStock;
  @override
  @JsonKey(name: 'SalesDistrict', defaultValue: '')
  String get salesDistrict;
  @override
  @JsonKey(ignore: true)
  _$$_StockInfoDtoCopyWith<_$_StockInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}
