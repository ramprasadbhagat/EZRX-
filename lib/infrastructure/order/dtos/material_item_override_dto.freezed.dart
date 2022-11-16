// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'material_item_override_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MaterialItemOverrideDto _$MaterialItemOverrideDtoFromJson(
    Map<String, dynamic> json) {
  return _MaterialItemOverrideDto.fromJson(json);
}

/// @nodoc
mixin _$MaterialItemOverrideDto {
  @JsonKey(name: 'reference', defaultValue: '')
  String get reference => throw _privateConstructorUsedError;
  @JsonKey(name: 'valueOverride', defaultValue: <ValueOverrideDto>[])
  List<ValueOverrideDto> get valueOverride =>
      throw _privateConstructorUsedError; //TODO: Implement later due to not know the data type
  @JsonKey(name: 'percentageOverride')
  dynamic get percentageOverride => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialItemOverrideDtoCopyWith<MaterialItemOverrideDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialItemOverrideDtoCopyWith<$Res> {
  factory $MaterialItemOverrideDtoCopyWith(MaterialItemOverrideDto value,
          $Res Function(MaterialItemOverrideDto) then) =
      _$MaterialItemOverrideDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'reference', defaultValue: '')
          String reference,
      @JsonKey(name: 'valueOverride', defaultValue: <ValueOverrideDto>[])
          List<ValueOverrideDto> valueOverride,
      @JsonKey(name: 'percentageOverride')
          dynamic percentageOverride});
}

/// @nodoc
class _$MaterialItemOverrideDtoCopyWithImpl<$Res>
    implements $MaterialItemOverrideDtoCopyWith<$Res> {
  _$MaterialItemOverrideDtoCopyWithImpl(this._value, this._then);

  final MaterialItemOverrideDto _value;
  // ignore: unused_field
  final $Res Function(MaterialItemOverrideDto) _then;

  @override
  $Res call({
    Object? reference = freezed,
    Object? valueOverride = freezed,
    Object? percentageOverride = freezed,
  }) {
    return _then(_value.copyWith(
      reference: reference == freezed
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      valueOverride: valueOverride == freezed
          ? _value.valueOverride
          : valueOverride // ignore: cast_nullable_to_non_nullable
              as List<ValueOverrideDto>,
      percentageOverride: percentageOverride == freezed
          ? _value.percentageOverride
          : percentageOverride // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_MaterialItemOverrideDtoCopyWith<$Res>
    implements $MaterialItemOverrideDtoCopyWith<$Res> {
  factory _$$_MaterialItemOverrideDtoCopyWith(_$_MaterialItemOverrideDto value,
          $Res Function(_$_MaterialItemOverrideDto) then) =
      __$$_MaterialItemOverrideDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'reference', defaultValue: '')
          String reference,
      @JsonKey(name: 'valueOverride', defaultValue: <ValueOverrideDto>[])
          List<ValueOverrideDto> valueOverride,
      @JsonKey(name: 'percentageOverride')
          dynamic percentageOverride});
}

/// @nodoc
class __$$_MaterialItemOverrideDtoCopyWithImpl<$Res>
    extends _$MaterialItemOverrideDtoCopyWithImpl<$Res>
    implements _$$_MaterialItemOverrideDtoCopyWith<$Res> {
  __$$_MaterialItemOverrideDtoCopyWithImpl(_$_MaterialItemOverrideDto _value,
      $Res Function(_$_MaterialItemOverrideDto) _then)
      : super(_value, (v) => _then(v as _$_MaterialItemOverrideDto));

  @override
  _$_MaterialItemOverrideDto get _value =>
      super._value as _$_MaterialItemOverrideDto;

  @override
  $Res call({
    Object? reference = freezed,
    Object? valueOverride = freezed,
    Object? percentageOverride = freezed,
  }) {
    return _then(_$_MaterialItemOverrideDto(
      reference: reference == freezed
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      valueOverride: valueOverride == freezed
          ? _value._valueOverride
          : valueOverride // ignore: cast_nullable_to_non_nullable
              as List<ValueOverrideDto>,
      percentageOverride: percentageOverride == freezed
          ? _value.percentageOverride
          : percentageOverride // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MaterialItemOverrideDto extends _MaterialItemOverrideDto {
  const _$_MaterialItemOverrideDto(
      {@JsonKey(name: 'reference', defaultValue: '')
          required this.reference,
      @JsonKey(name: 'valueOverride', defaultValue: <ValueOverrideDto>[])
          required final List<ValueOverrideDto> valueOverride,
      @JsonKey(name: 'percentageOverride')
          this.percentageOverride})
      : _valueOverride = valueOverride,
        super._();

  factory _$_MaterialItemOverrideDto.fromJson(Map<String, dynamic> json) =>
      _$$_MaterialItemOverrideDtoFromJson(json);

  @override
  @JsonKey(name: 'reference', defaultValue: '')
  final String reference;
  final List<ValueOverrideDto> _valueOverride;
  @override
  @JsonKey(name: 'valueOverride', defaultValue: <ValueOverrideDto>[])
  List<ValueOverrideDto> get valueOverride {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_valueOverride);
  }

//TODO: Implement later due to not know the data type
  @override
  @JsonKey(name: 'percentageOverride')
  final dynamic percentageOverride;

  @override
  String toString() {
    return 'MaterialItemOverrideDto(reference: $reference, valueOverride: $valueOverride, percentageOverride: $percentageOverride)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialItemOverrideDto &&
            const DeepCollectionEquality().equals(other.reference, reference) &&
            const DeepCollectionEquality()
                .equals(other._valueOverride, _valueOverride) &&
            const DeepCollectionEquality()
                .equals(other.percentageOverride, percentageOverride));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(reference),
      const DeepCollectionEquality().hash(_valueOverride),
      const DeepCollectionEquality().hash(percentageOverride));

  @JsonKey(ignore: true)
  @override
  _$$_MaterialItemOverrideDtoCopyWith<_$_MaterialItemOverrideDto>
      get copyWith =>
          __$$_MaterialItemOverrideDtoCopyWithImpl<_$_MaterialItemOverrideDto>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MaterialItemOverrideDtoToJson(
      this,
    );
  }
}

abstract class _MaterialItemOverrideDto extends MaterialItemOverrideDto {
  const factory _MaterialItemOverrideDto(
      {@JsonKey(name: 'reference', defaultValue: '')
          required final String reference,
      @JsonKey(name: 'valueOverride', defaultValue: <ValueOverrideDto>[])
          required final List<ValueOverrideDto> valueOverride,
      @JsonKey(name: 'percentageOverride')
          final dynamic percentageOverride}) = _$_MaterialItemOverrideDto;
  const _MaterialItemOverrideDto._() : super._();

  factory _MaterialItemOverrideDto.fromJson(Map<String, dynamic> json) =
      _$_MaterialItemOverrideDto.fromJson;

  @override
  @JsonKey(name: 'reference', defaultValue: '')
  String get reference;
  @override
  @JsonKey(name: 'valueOverride', defaultValue: <ValueOverrideDto>[])
  List<ValueOverrideDto> get valueOverride;
  @override //TODO: Implement later due to not know the data type
  @JsonKey(name: 'percentageOverride')
  dynamic get percentageOverride;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialItemOverrideDtoCopyWith<_$_MaterialItemOverrideDto>
      get copyWith => throw _privateConstructorUsedError;
}

ValueOverrideDto _$ValueOverrideDtoFromJson(Map<String, dynamic> json) {
  return _ValueOverrideDto.fromJson(json);
}

/// @nodoc
mixin _$ValueOverrideDto {
  @JsonKey(name: 'code', defaultValue: '')
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  dynamic get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency', defaultValue: '')
  String get currency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ValueOverrideDtoCopyWith<ValueOverrideDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueOverrideDtoCopyWith<$Res> {
  factory $ValueOverrideDtoCopyWith(
          ValueOverrideDto value, $Res Function(ValueOverrideDto) then) =
      _$ValueOverrideDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'code', defaultValue: '') String code,
      @JsonKey(name: 'price') dynamic price,
      @JsonKey(name: 'currency', defaultValue: '') String currency});
}

/// @nodoc
class _$ValueOverrideDtoCopyWithImpl<$Res>
    implements $ValueOverrideDtoCopyWith<$Res> {
  _$ValueOverrideDtoCopyWithImpl(this._value, this._then);

  final ValueOverrideDto _value;
  // ignore: unused_field
  final $Res Function(ValueOverrideDto) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? price = freezed,
    Object? currency = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as dynamic,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ValueOverrideDtoCopyWith<$Res>
    implements $ValueOverrideDtoCopyWith<$Res> {
  factory _$$_ValueOverrideDtoCopyWith(
          _$_ValueOverrideDto value, $Res Function(_$_ValueOverrideDto) then) =
      __$$_ValueOverrideDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'code', defaultValue: '') String code,
      @JsonKey(name: 'price') dynamic price,
      @JsonKey(name: 'currency', defaultValue: '') String currency});
}

/// @nodoc
class __$$_ValueOverrideDtoCopyWithImpl<$Res>
    extends _$ValueOverrideDtoCopyWithImpl<$Res>
    implements _$$_ValueOverrideDtoCopyWith<$Res> {
  __$$_ValueOverrideDtoCopyWithImpl(
      _$_ValueOverrideDto _value, $Res Function(_$_ValueOverrideDto) _then)
      : super(_value, (v) => _then(v as _$_ValueOverrideDto));

  @override
  _$_ValueOverrideDto get _value => super._value as _$_ValueOverrideDto;

  @override
  $Res call({
    Object? code = freezed,
    Object? price = freezed,
    Object? currency = freezed,
  }) {
    return _then(_$_ValueOverrideDto(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as dynamic,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ValueOverrideDto extends _ValueOverrideDto {
  const _$_ValueOverrideDto(
      {@JsonKey(name: 'code', defaultValue: '') required this.code,
      @JsonKey(name: 'price') this.price,
      @JsonKey(name: 'currency', defaultValue: '') required this.currency})
      : super._();

  factory _$_ValueOverrideDto.fromJson(Map<String, dynamic> json) =>
      _$$_ValueOverrideDtoFromJson(json);

  @override
  @JsonKey(name: 'code', defaultValue: '')
  final String code;
  @override
  @JsonKey(name: 'price')
  final dynamic price;
  @override
  @JsonKey(name: 'currency', defaultValue: '')
  final String currency;

  @override
  String toString() {
    return 'ValueOverrideDto(code: $code, price: $price, currency: $currency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ValueOverrideDto &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.currency, currency));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(currency));

  @JsonKey(ignore: true)
  @override
  _$$_ValueOverrideDtoCopyWith<_$_ValueOverrideDto> get copyWith =>
      __$$_ValueOverrideDtoCopyWithImpl<_$_ValueOverrideDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ValueOverrideDtoToJson(
      this,
    );
  }
}

abstract class _ValueOverrideDto extends ValueOverrideDto {
  const factory _ValueOverrideDto(
      {@JsonKey(name: 'code', defaultValue: '')
          required final String code,
      @JsonKey(name: 'price')
          final dynamic price,
      @JsonKey(name: 'currency', defaultValue: '')
          required final String currency}) = _$_ValueOverrideDto;
  const _ValueOverrideDto._() : super._();

  factory _ValueOverrideDto.fromJson(Map<String, dynamic> json) =
      _$_ValueOverrideDto.fromJson;

  @override
  @JsonKey(name: 'code', defaultValue: '')
  String get code;
  @override
  @JsonKey(name: 'price')
  dynamic get price;
  @override
  @JsonKey(name: 'currency', defaultValue: '')
  String get currency;
  @override
  @JsonKey(ignore: true)
  _$$_ValueOverrideDtoCopyWith<_$_ValueOverrideDto> get copyWith =>
      throw _privateConstructorUsedError;
}
