// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'price_bundle_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PriceBundleDto _$PriceBundleDtoFromJson(Map<String, dynamic> json) {
  return _PriceBundleDto.fromJson(json);
}

/// @nodoc
mixin _$PriceBundleDto {
  @JsonKey(name: 'BundleName', defaultValue: '')
  @HiveField(35, defaultValue: '')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'BundleCode', defaultValue: '')
  @HiveField(36, defaultValue: '')
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'BundleInformation', defaultValue: <PriceBundleItemDto>[])
  @HiveField(37, defaultValue: <PriceBundleItemDto>[])
  List<PriceBundleItemDto> get information =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceBundleDtoCopyWith<PriceBundleDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceBundleDtoCopyWith<$Res> {
  factory $PriceBundleDtoCopyWith(
          PriceBundleDto value, $Res Function(PriceBundleDto) then) =
      _$PriceBundleDtoCopyWithImpl<$Res, PriceBundleDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'BundleName', defaultValue: '')
      @HiveField(35, defaultValue: '')
          String name,
      @JsonKey(name: 'BundleCode', defaultValue: '')
      @HiveField(36, defaultValue: '')
          String code,
      @JsonKey(name: 'BundleInformation', defaultValue: <PriceBundleItemDto>[])
      @HiveField(37, defaultValue: <PriceBundleItemDto>[])
          List<PriceBundleItemDto> information});
}

/// @nodoc
class _$PriceBundleDtoCopyWithImpl<$Res, $Val extends PriceBundleDto>
    implements $PriceBundleDtoCopyWith<$Res> {
  _$PriceBundleDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
    Object? information = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      information: null == information
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as List<PriceBundleItemDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PriceBundleDtoCopyWith<$Res>
    implements $PriceBundleDtoCopyWith<$Res> {
  factory _$$_PriceBundleDtoCopyWith(
          _$_PriceBundleDto value, $Res Function(_$_PriceBundleDto) then) =
      __$$_PriceBundleDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'BundleName', defaultValue: '')
      @HiveField(35, defaultValue: '')
          String name,
      @JsonKey(name: 'BundleCode', defaultValue: '')
      @HiveField(36, defaultValue: '')
          String code,
      @JsonKey(name: 'BundleInformation', defaultValue: <PriceBundleItemDto>[])
      @HiveField(37, defaultValue: <PriceBundleItemDto>[])
          List<PriceBundleItemDto> information});
}

/// @nodoc
class __$$_PriceBundleDtoCopyWithImpl<$Res>
    extends _$PriceBundleDtoCopyWithImpl<$Res, _$_PriceBundleDto>
    implements _$$_PriceBundleDtoCopyWith<$Res> {
  __$$_PriceBundleDtoCopyWithImpl(
      _$_PriceBundleDto _value, $Res Function(_$_PriceBundleDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
    Object? information = null,
  }) {
    return _then(_$_PriceBundleDto(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      information: null == information
          ? _value._information
          : information // ignore: cast_nullable_to_non_nullable
              as List<PriceBundleItemDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 13, adapterName: 'PriceBundleDtoAdapter')
class _$_PriceBundleDto extends _PriceBundleDto {
  const _$_PriceBundleDto(
      {@JsonKey(name: 'BundleName', defaultValue: '')
      @HiveField(35, defaultValue: '')
          required this.name,
      @JsonKey(name: 'BundleCode', defaultValue: '')
      @HiveField(36, defaultValue: '')
          required this.code,
      @JsonKey(name: 'BundleInformation', defaultValue: <PriceBundleItemDto>[])
      @HiveField(37, defaultValue: <PriceBundleItemDto>[])
          required final List<PriceBundleItemDto> information})
      : _information = information,
        super._();

  factory _$_PriceBundleDto.fromJson(Map<String, dynamic> json) =>
      _$$_PriceBundleDtoFromJson(json);

  @override
  @JsonKey(name: 'BundleName', defaultValue: '')
  @HiveField(35, defaultValue: '')
  final String name;
  @override
  @JsonKey(name: 'BundleCode', defaultValue: '')
  @HiveField(36, defaultValue: '')
  final String code;
  final List<PriceBundleItemDto> _information;
  @override
  @JsonKey(name: 'BundleInformation', defaultValue: <PriceBundleItemDto>[])
  @HiveField(37, defaultValue: <PriceBundleItemDto>[])
  List<PriceBundleItemDto> get information {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_information);
  }

  @override
  String toString() {
    return 'PriceBundleDto(name: $name, code: $code, information: $information)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceBundleDto &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality()
                .equals(other._information, _information));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code,
      const DeepCollectionEquality().hash(_information));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PriceBundleDtoCopyWith<_$_PriceBundleDto> get copyWith =>
      __$$_PriceBundleDtoCopyWithImpl<_$_PriceBundleDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PriceBundleDtoToJson(
      this,
    );
  }
}

abstract class _PriceBundleDto extends PriceBundleDto {
  const factory _PriceBundleDto(
      {@JsonKey(name: 'BundleName', defaultValue: '')
      @HiveField(35, defaultValue: '')
          required final String name,
      @JsonKey(name: 'BundleCode', defaultValue: '')
      @HiveField(36, defaultValue: '')
          required final String code,
      @JsonKey(name: 'BundleInformation', defaultValue: <PriceBundleItemDto>[])
      @HiveField(37, defaultValue: <PriceBundleItemDto>[])
          required final List<PriceBundleItemDto>
              information}) = _$_PriceBundleDto;
  const _PriceBundleDto._() : super._();

  factory _PriceBundleDto.fromJson(Map<String, dynamic> json) =
      _$_PriceBundleDto.fromJson;

  @override
  @JsonKey(name: 'BundleName', defaultValue: '')
  @HiveField(35, defaultValue: '')
  String get name;
  @override
  @JsonKey(name: 'BundleCode', defaultValue: '')
  @HiveField(36, defaultValue: '')
  String get code;
  @override
  @JsonKey(name: 'BundleInformation', defaultValue: <PriceBundleItemDto>[])
  @HiveField(37, defaultValue: <PriceBundleItemDto>[])
  List<PriceBundleItemDto> get information;
  @override
  @JsonKey(ignore: true)
  _$$_PriceBundleDtoCopyWith<_$_PriceBundleDto> get copyWith =>
      throw _privateConstructorUsedError;
}

PriceBundleItemDto _$PriceBundleItemDtoFromJson(Map<String, dynamic> json) {
  return _PriceBundleItemDto.fromJson(json);
}

/// @nodoc
mixin _$PriceBundleItemDto {
  @JsonKey(name: 'Type', defaultValue: '')
  @HiveField(38, defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'Sequence', defaultValue: 0)
  @HiveField(39, defaultValue: 0)
  int get sequence => throw _privateConstructorUsedError;
  @JsonKey(name: 'Quantity', defaultValue: 0)
  @HiveField(40, defaultValue: 0)
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'Rate', defaultValue: 0)
  @HiveField(41, defaultValue: 0)
  double get rate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceBundleItemDtoCopyWith<PriceBundleItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceBundleItemDtoCopyWith<$Res> {
  factory $PriceBundleItemDtoCopyWith(
          PriceBundleItemDto value, $Res Function(PriceBundleItemDto) then) =
      _$PriceBundleItemDtoCopyWithImpl<$Res, PriceBundleItemDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Type', defaultValue: '')
      @HiveField(38, defaultValue: '')
          String type,
      @JsonKey(name: 'Sequence', defaultValue: 0)
      @HiveField(39, defaultValue: 0)
          int sequence,
      @JsonKey(name: 'Quantity', defaultValue: 0)
      @HiveField(40, defaultValue: 0)
          int quantity,
      @JsonKey(name: 'Rate', defaultValue: 0)
      @HiveField(41, defaultValue: 0)
          double rate});
}

/// @nodoc
class _$PriceBundleItemDtoCopyWithImpl<$Res, $Val extends PriceBundleItemDto>
    implements $PriceBundleItemDtoCopyWith<$Res> {
  _$PriceBundleItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? sequence = null,
    Object? quantity = null,
    Object? rate = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      sequence: null == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PriceBundleItemDtoCopyWith<$Res>
    implements $PriceBundleItemDtoCopyWith<$Res> {
  factory _$$_PriceBundleItemDtoCopyWith(_$_PriceBundleItemDto value,
          $Res Function(_$_PriceBundleItemDto) then) =
      __$$_PriceBundleItemDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Type', defaultValue: '')
      @HiveField(38, defaultValue: '')
          String type,
      @JsonKey(name: 'Sequence', defaultValue: 0)
      @HiveField(39, defaultValue: 0)
          int sequence,
      @JsonKey(name: 'Quantity', defaultValue: 0)
      @HiveField(40, defaultValue: 0)
          int quantity,
      @JsonKey(name: 'Rate', defaultValue: 0)
      @HiveField(41, defaultValue: 0)
          double rate});
}

/// @nodoc
class __$$_PriceBundleItemDtoCopyWithImpl<$Res>
    extends _$PriceBundleItemDtoCopyWithImpl<$Res, _$_PriceBundleItemDto>
    implements _$$_PriceBundleItemDtoCopyWith<$Res> {
  __$$_PriceBundleItemDtoCopyWithImpl(
      _$_PriceBundleItemDto _value, $Res Function(_$_PriceBundleItemDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? sequence = null,
    Object? quantity = null,
    Object? rate = null,
  }) {
    return _then(_$_PriceBundleItemDto(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      sequence: null == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 14, adapterName: 'PriceBundleItemDtoAdapter')
class _$_PriceBundleItemDto extends _PriceBundleItemDto {
  const _$_PriceBundleItemDto(
      {@JsonKey(name: 'Type', defaultValue: '')
      @HiveField(38, defaultValue: '')
          required this.type,
      @JsonKey(name: 'Sequence', defaultValue: 0)
      @HiveField(39, defaultValue: 0)
          required this.sequence,
      @JsonKey(name: 'Quantity', defaultValue: 0)
      @HiveField(40, defaultValue: 0)
          required this.quantity,
      @JsonKey(name: 'Rate', defaultValue: 0)
      @HiveField(41, defaultValue: 0)
          required this.rate})
      : super._();

  factory _$_PriceBundleItemDto.fromJson(Map<String, dynamic> json) =>
      _$$_PriceBundleItemDtoFromJson(json);

  @override
  @JsonKey(name: 'Type', defaultValue: '')
  @HiveField(38, defaultValue: '')
  final String type;
  @override
  @JsonKey(name: 'Sequence', defaultValue: 0)
  @HiveField(39, defaultValue: 0)
  final int sequence;
  @override
  @JsonKey(name: 'Quantity', defaultValue: 0)
  @HiveField(40, defaultValue: 0)
  final int quantity;
  @override
  @JsonKey(name: 'Rate', defaultValue: 0)
  @HiveField(41, defaultValue: 0)
  final double rate;

  @override
  String toString() {
    return 'PriceBundleItemDto(type: $type, sequence: $sequence, quantity: $quantity, rate: $rate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceBundleItemDto &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, sequence, quantity, rate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PriceBundleItemDtoCopyWith<_$_PriceBundleItemDto> get copyWith =>
      __$$_PriceBundleItemDtoCopyWithImpl<_$_PriceBundleItemDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PriceBundleItemDtoToJson(
      this,
    );
  }
}

abstract class _PriceBundleItemDto extends PriceBundleItemDto {
  const factory _PriceBundleItemDto(
      {@JsonKey(name: 'Type', defaultValue: '')
      @HiveField(38, defaultValue: '')
          required final String type,
      @JsonKey(name: 'Sequence', defaultValue: 0)
      @HiveField(39, defaultValue: 0)
          required final int sequence,
      @JsonKey(name: 'Quantity', defaultValue: 0)
      @HiveField(40, defaultValue: 0)
          required final int quantity,
      @JsonKey(name: 'Rate', defaultValue: 0)
      @HiveField(41, defaultValue: 0)
          required final double rate}) = _$_PriceBundleItemDto;
  const _PriceBundleItemDto._() : super._();

  factory _PriceBundleItemDto.fromJson(Map<String, dynamic> json) =
      _$_PriceBundleItemDto.fromJson;

  @override
  @JsonKey(name: 'Type', defaultValue: '')
  @HiveField(38, defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'Sequence', defaultValue: 0)
  @HiveField(39, defaultValue: 0)
  int get sequence;
  @override
  @JsonKey(name: 'Quantity', defaultValue: 0)
  @HiveField(40, defaultValue: 0)
  int get quantity;
  @override
  @JsonKey(name: 'Rate', defaultValue: 0)
  @HiveField(41, defaultValue: 0)
  double get rate;
  @override
  @JsonKey(ignore: true)
  _$$_PriceBundleItemDtoCopyWith<_$_PriceBundleItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}
