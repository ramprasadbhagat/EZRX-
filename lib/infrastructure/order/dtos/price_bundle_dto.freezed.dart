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
  @HiveField(35)
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'BundleCode', defaultValue: '')
  @HiveField(36)
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'BundleInformation', defaultValue: <PriceBundleItemDto>[])
  @HiveField(37)
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
      _$PriceBundleDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'BundleName', defaultValue: '')
      @HiveField(35)
          String name,
      @JsonKey(name: 'BundleCode', defaultValue: '')
      @HiveField(36)
          String code,
      @JsonKey(name: 'BundleInformation', defaultValue: <PriceBundleItemDto>[])
      @HiveField(37)
          List<PriceBundleItemDto> information});
}

/// @nodoc
class _$PriceBundleDtoCopyWithImpl<$Res>
    implements $PriceBundleDtoCopyWith<$Res> {
  _$PriceBundleDtoCopyWithImpl(this._value, this._then);

  final PriceBundleDto _value;
  // ignore: unused_field
  final $Res Function(PriceBundleDto) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? code = freezed,
    Object? information = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      information: information == freezed
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as List<PriceBundleItemDto>,
    ));
  }
}

/// @nodoc
abstract class _$$_PriceBundleDtoCopyWith<$Res>
    implements $PriceBundleDtoCopyWith<$Res> {
  factory _$$_PriceBundleDtoCopyWith(
          _$_PriceBundleDto value, $Res Function(_$_PriceBundleDto) then) =
      __$$_PriceBundleDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'BundleName', defaultValue: '')
      @HiveField(35)
          String name,
      @JsonKey(name: 'BundleCode', defaultValue: '')
      @HiveField(36)
          String code,
      @JsonKey(name: 'BundleInformation', defaultValue: <PriceBundleItemDto>[])
      @HiveField(37)
          List<PriceBundleItemDto> information});
}

/// @nodoc
class __$$_PriceBundleDtoCopyWithImpl<$Res>
    extends _$PriceBundleDtoCopyWithImpl<$Res>
    implements _$$_PriceBundleDtoCopyWith<$Res> {
  __$$_PriceBundleDtoCopyWithImpl(
      _$_PriceBundleDto _value, $Res Function(_$_PriceBundleDto) _then)
      : super(_value, (v) => _then(v as _$_PriceBundleDto));

  @override
  _$_PriceBundleDto get _value => super._value as _$_PriceBundleDto;

  @override
  $Res call({
    Object? name = freezed,
    Object? code = freezed,
    Object? information = freezed,
  }) {
    return _then(_$_PriceBundleDto(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      information: information == freezed
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
      @HiveField(35)
          required this.name,
      @JsonKey(name: 'BundleCode', defaultValue: '')
      @HiveField(36)
          required this.code,
      @JsonKey(name: 'BundleInformation', defaultValue: <PriceBundleItemDto>[])
      @HiveField(37)
          required final List<PriceBundleItemDto> information})
      : _information = information,
        super._();

  factory _$_PriceBundleDto.fromJson(Map<String, dynamic> json) =>
      _$$_PriceBundleDtoFromJson(json);

  @override
  @JsonKey(name: 'BundleName', defaultValue: '')
  @HiveField(35)
  final String name;
  @override
  @JsonKey(name: 'BundleCode', defaultValue: '')
  @HiveField(36)
  final String code;
  final List<PriceBundleItemDto> _information;
  @override
  @JsonKey(name: 'BundleInformation', defaultValue: <PriceBundleItemDto>[])
  @HiveField(37)
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
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality()
                .equals(other._information, _information));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(_information));

  @JsonKey(ignore: true)
  @override
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
      @HiveField(35)
          required final String name,
      @JsonKey(name: 'BundleCode', defaultValue: '')
      @HiveField(36)
          required final String code,
      @JsonKey(name: 'BundleInformation', defaultValue: <PriceBundleItemDto>[])
      @HiveField(37)
          required final List<PriceBundleItemDto>
              information}) = _$_PriceBundleDto;
  const _PriceBundleDto._() : super._();

  factory _PriceBundleDto.fromJson(Map<String, dynamic> json) =
      _$_PriceBundleDto.fromJson;

  @override
  @JsonKey(name: 'BundleName', defaultValue: '')
  @HiveField(35)
  String get name;
  @override
  @JsonKey(name: 'BundleCode', defaultValue: '')
  @HiveField(36)
  String get code;
  @override
  @JsonKey(name: 'BundleInformation', defaultValue: <PriceBundleItemDto>[])
  @HiveField(37)
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
  @HiveField(38)
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'Sequence', defaultValue: 0)
  @HiveField(39)
  int get sequence => throw _privateConstructorUsedError;
  @JsonKey(name: 'Quantity', defaultValue: 0)
  @HiveField(40)
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'Rate', defaultValue: 0)
  @HiveField(41)
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
      _$PriceBundleItemDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'Type', defaultValue: '') @HiveField(38) String type,
      @JsonKey(name: 'Sequence', defaultValue: 0) @HiveField(39) int sequence,
      @JsonKey(name: 'Quantity', defaultValue: 0) @HiveField(40) int quantity,
      @JsonKey(name: 'Rate', defaultValue: 0) @HiveField(41) double rate});
}

/// @nodoc
class _$PriceBundleItemDtoCopyWithImpl<$Res>
    implements $PriceBundleItemDtoCopyWith<$Res> {
  _$PriceBundleItemDtoCopyWithImpl(this._value, this._then);

  final PriceBundleItemDto _value;
  // ignore: unused_field
  final $Res Function(PriceBundleItemDto) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? sequence = freezed,
    Object? quantity = freezed,
    Object? rate = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      sequence: sequence == freezed
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_PriceBundleItemDtoCopyWith<$Res>
    implements $PriceBundleItemDtoCopyWith<$Res> {
  factory _$$_PriceBundleItemDtoCopyWith(_$_PriceBundleItemDto value,
          $Res Function(_$_PriceBundleItemDto) then) =
      __$$_PriceBundleItemDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'Type', defaultValue: '') @HiveField(38) String type,
      @JsonKey(name: 'Sequence', defaultValue: 0) @HiveField(39) int sequence,
      @JsonKey(name: 'Quantity', defaultValue: 0) @HiveField(40) int quantity,
      @JsonKey(name: 'Rate', defaultValue: 0) @HiveField(41) double rate});
}

/// @nodoc
class __$$_PriceBundleItemDtoCopyWithImpl<$Res>
    extends _$PriceBundleItemDtoCopyWithImpl<$Res>
    implements _$$_PriceBundleItemDtoCopyWith<$Res> {
  __$$_PriceBundleItemDtoCopyWithImpl(
      _$_PriceBundleItemDto _value, $Res Function(_$_PriceBundleItemDto) _then)
      : super(_value, (v) => _then(v as _$_PriceBundleItemDto));

  @override
  _$_PriceBundleItemDto get _value => super._value as _$_PriceBundleItemDto;

  @override
  $Res call({
    Object? type = freezed,
    Object? sequence = freezed,
    Object? quantity = freezed,
    Object? rate = freezed,
  }) {
    return _then(_$_PriceBundleItemDto(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      sequence: sequence == freezed
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      rate: rate == freezed
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
      @HiveField(38)
          required this.type,
      @JsonKey(name: 'Sequence', defaultValue: 0)
      @HiveField(39)
          required this.sequence,
      @JsonKey(name: 'Quantity', defaultValue: 0)
      @HiveField(40)
          required this.quantity,
      @JsonKey(name: 'Rate', defaultValue: 0)
      @HiveField(41)
          required this.rate})
      : super._();

  factory _$_PriceBundleItemDto.fromJson(Map<String, dynamic> json) =>
      _$$_PriceBundleItemDtoFromJson(json);

  @override
  @JsonKey(name: 'Type', defaultValue: '')
  @HiveField(38)
  final String type;
  @override
  @JsonKey(name: 'Sequence', defaultValue: 0)
  @HiveField(39)
  final int sequence;
  @override
  @JsonKey(name: 'Quantity', defaultValue: 0)
  @HiveField(40)
  final int quantity;
  @override
  @JsonKey(name: 'Rate', defaultValue: 0)
  @HiveField(41)
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
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.sequence, sequence) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality().equals(other.rate, rate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(sequence),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(rate));

  @JsonKey(ignore: true)
  @override
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
      @HiveField(38)
          required final String type,
      @JsonKey(name: 'Sequence', defaultValue: 0)
      @HiveField(39)
          required final int sequence,
      @JsonKey(name: 'Quantity', defaultValue: 0)
      @HiveField(40)
          required final int quantity,
      @JsonKey(name: 'Rate', defaultValue: 0)
      @HiveField(41)
          required final double rate}) = _$_PriceBundleItemDto;
  const _PriceBundleItemDto._() : super._();

  factory _PriceBundleItemDto.fromJson(Map<String, dynamic> json) =
      _$_PriceBundleItemDto.fromJson;

  @override
  @JsonKey(name: 'Type', defaultValue: '')
  @HiveField(38)
  String get type;
  @override
  @JsonKey(name: 'Sequence', defaultValue: 0)
  @HiveField(39)
  int get sequence;
  @override
  @JsonKey(name: 'Quantity', defaultValue: 0)
  @HiveField(40)
  int get quantity;
  @override
  @JsonKey(name: 'Rate', defaultValue: 0)
  @HiveField(41)
  double get rate;
  @override
  @JsonKey(ignore: true)
  _$$_PriceBundleItemDtoCopyWith<_$_PriceBundleItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}
