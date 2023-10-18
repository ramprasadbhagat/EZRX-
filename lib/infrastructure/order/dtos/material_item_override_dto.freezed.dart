// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  @JsonKey(
      name: 'valueOverride',
      defaultValue: <ValueOverrideDto>[],
      includeIfNull: false,
      toJson: valueOverrideTojson)
  List<ValueOverrideDto> get valueOverride =>
      throw _privateConstructorUsedError;
  @JsonKey(
      name: 'percentageOverride',
      defaultValue: <PercentageOverrideDto>[],
      includeIfNull: false,
      toJson: percentageOverrideTojson)
  List<PercentageOverrideDto> get percentageOverride =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialItemOverrideDtoCopyWith<MaterialItemOverrideDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialItemOverrideDtoCopyWith<$Res> {
  factory $MaterialItemOverrideDtoCopyWith(MaterialItemOverrideDto value,
          $Res Function(MaterialItemOverrideDto) then) =
      _$MaterialItemOverrideDtoCopyWithImpl<$Res, MaterialItemOverrideDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'reference', defaultValue: '') String reference,
      @JsonKey(
          name: 'valueOverride',
          defaultValue: <ValueOverrideDto>[],
          includeIfNull: false,
          toJson: valueOverrideTojson)
      List<ValueOverrideDto> valueOverride,
      @JsonKey(
          name: 'percentageOverride',
          defaultValue: <PercentageOverrideDto>[],
          includeIfNull: false,
          toJson: percentageOverrideTojson)
      List<PercentageOverrideDto> percentageOverride});
}

/// @nodoc
class _$MaterialItemOverrideDtoCopyWithImpl<$Res,
        $Val extends MaterialItemOverrideDto>
    implements $MaterialItemOverrideDtoCopyWith<$Res> {
  _$MaterialItemOverrideDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? valueOverride = null,
    Object? percentageOverride = null,
  }) {
    return _then(_value.copyWith(
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      valueOverride: null == valueOverride
          ? _value.valueOverride
          : valueOverride // ignore: cast_nullable_to_non_nullable
              as List<ValueOverrideDto>,
      percentageOverride: null == percentageOverride
          ? _value.percentageOverride
          : percentageOverride // ignore: cast_nullable_to_non_nullable
              as List<PercentageOverrideDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MaterialItemOverrideDtoCopyWith<$Res>
    implements $MaterialItemOverrideDtoCopyWith<$Res> {
  factory _$$_MaterialItemOverrideDtoCopyWith(_$_MaterialItemOverrideDto value,
          $Res Function(_$_MaterialItemOverrideDto) then) =
      __$$_MaterialItemOverrideDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'reference', defaultValue: '') String reference,
      @JsonKey(
          name: 'valueOverride',
          defaultValue: <ValueOverrideDto>[],
          includeIfNull: false,
          toJson: valueOverrideTojson)
      List<ValueOverrideDto> valueOverride,
      @JsonKey(
          name: 'percentageOverride',
          defaultValue: <PercentageOverrideDto>[],
          includeIfNull: false,
          toJson: percentageOverrideTojson)
      List<PercentageOverrideDto> percentageOverride});
}

/// @nodoc
class __$$_MaterialItemOverrideDtoCopyWithImpl<$Res>
    extends _$MaterialItemOverrideDtoCopyWithImpl<$Res,
        _$_MaterialItemOverrideDto>
    implements _$$_MaterialItemOverrideDtoCopyWith<$Res> {
  __$$_MaterialItemOverrideDtoCopyWithImpl(_$_MaterialItemOverrideDto _value,
      $Res Function(_$_MaterialItemOverrideDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? valueOverride = null,
    Object? percentageOverride = null,
  }) {
    return _then(_$_MaterialItemOverrideDto(
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      valueOverride: null == valueOverride
          ? _value._valueOverride
          : valueOverride // ignore: cast_nullable_to_non_nullable
              as List<ValueOverrideDto>,
      percentageOverride: null == percentageOverride
          ? _value._percentageOverride
          : percentageOverride // ignore: cast_nullable_to_non_nullable
              as List<PercentageOverrideDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MaterialItemOverrideDto extends _MaterialItemOverrideDto {
  const _$_MaterialItemOverrideDto(
      {@JsonKey(name: 'reference', defaultValue: '') required this.reference,
      @JsonKey(
          name: 'valueOverride',
          defaultValue: <ValueOverrideDto>[],
          includeIfNull: false,
          toJson: valueOverrideTojson)
      required final List<ValueOverrideDto> valueOverride,
      @JsonKey(
          name: 'percentageOverride',
          defaultValue: <PercentageOverrideDto>[],
          includeIfNull: false,
          toJson: percentageOverrideTojson)
      required final List<PercentageOverrideDto> percentageOverride})
      : _valueOverride = valueOverride,
        _percentageOverride = percentageOverride,
        super._();

  factory _$_MaterialItemOverrideDto.fromJson(Map<String, dynamic> json) =>
      _$$_MaterialItemOverrideDtoFromJson(json);

  @override
  @JsonKey(name: 'reference', defaultValue: '')
  final String reference;
  final List<ValueOverrideDto> _valueOverride;
  @override
  @JsonKey(
      name: 'valueOverride',
      defaultValue: <ValueOverrideDto>[],
      includeIfNull: false,
      toJson: valueOverrideTojson)
  List<ValueOverrideDto> get valueOverride {
    if (_valueOverride is EqualUnmodifiableListView) return _valueOverride;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_valueOverride);
  }

  final List<PercentageOverrideDto> _percentageOverride;
  @override
  @JsonKey(
      name: 'percentageOverride',
      defaultValue: <PercentageOverrideDto>[],
      includeIfNull: false,
      toJson: percentageOverrideTojson)
  List<PercentageOverrideDto> get percentageOverride {
    if (_percentageOverride is EqualUnmodifiableListView)
      return _percentageOverride;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_percentageOverride);
  }

  @override
  String toString() {
    return 'MaterialItemOverrideDto(reference: $reference, valueOverride: $valueOverride, percentageOverride: $percentageOverride)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialItemOverrideDto &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            const DeepCollectionEquality()
                .equals(other._valueOverride, _valueOverride) &&
            const DeepCollectionEquality()
                .equals(other._percentageOverride, _percentageOverride));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      reference,
      const DeepCollectionEquality().hash(_valueOverride),
      const DeepCollectionEquality().hash(_percentageOverride));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
          @JsonKey(
              name: 'valueOverride',
              defaultValue: <ValueOverrideDto>[],
              includeIfNull: false,
              toJson: valueOverrideTojson)
          required final List<ValueOverrideDto> valueOverride,
          @JsonKey(
              name: 'percentageOverride',
              defaultValue: <PercentageOverrideDto>[],
              includeIfNull: false,
              toJson: percentageOverrideTojson)
          required final List<PercentageOverrideDto> percentageOverride}) =
      _$_MaterialItemOverrideDto;
  const _MaterialItemOverrideDto._() : super._();

  factory _MaterialItemOverrideDto.fromJson(Map<String, dynamic> json) =
      _$_MaterialItemOverrideDto.fromJson;

  @override
  @JsonKey(name: 'reference', defaultValue: '')
  String get reference;
  @override
  @JsonKey(
      name: 'valueOverride',
      defaultValue: <ValueOverrideDto>[],
      includeIfNull: false,
      toJson: valueOverrideTojson)
  List<ValueOverrideDto> get valueOverride;
  @override
  @JsonKey(
      name: 'percentageOverride',
      defaultValue: <PercentageOverrideDto>[],
      includeIfNull: false,
      toJson: percentageOverrideTojson)
  List<PercentageOverrideDto> get percentageOverride;
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
  @JsonKey(name: 'price', defaultValue: 0)
  double get price => throw _privateConstructorUsedError;
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
      _$ValueOverrideDtoCopyWithImpl<$Res, ValueOverrideDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'code', defaultValue: '') String code,
      @JsonKey(name: 'price', defaultValue: 0) double price,
      @JsonKey(name: 'currency', defaultValue: '') String currency});
}

/// @nodoc
class _$ValueOverrideDtoCopyWithImpl<$Res, $Val extends ValueOverrideDto>
    implements $ValueOverrideDtoCopyWith<$Res> {
  _$ValueOverrideDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? price = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ValueOverrideDtoCopyWith<$Res>
    implements $ValueOverrideDtoCopyWith<$Res> {
  factory _$$_ValueOverrideDtoCopyWith(
          _$_ValueOverrideDto value, $Res Function(_$_ValueOverrideDto) then) =
      __$$_ValueOverrideDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'code', defaultValue: '') String code,
      @JsonKey(name: 'price', defaultValue: 0) double price,
      @JsonKey(name: 'currency', defaultValue: '') String currency});
}

/// @nodoc
class __$$_ValueOverrideDtoCopyWithImpl<$Res>
    extends _$ValueOverrideDtoCopyWithImpl<$Res, _$_ValueOverrideDto>
    implements _$$_ValueOverrideDtoCopyWith<$Res> {
  __$$_ValueOverrideDtoCopyWithImpl(
      _$_ValueOverrideDto _value, $Res Function(_$_ValueOverrideDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? price = null,
    Object? currency = null,
  }) {
    return _then(_$_ValueOverrideDto(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
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
      @JsonKey(name: 'price', defaultValue: 0) required this.price,
      @JsonKey(name: 'currency', defaultValue: '') required this.currency})
      : super._();

  factory _$_ValueOverrideDto.fromJson(Map<String, dynamic> json) =>
      _$$_ValueOverrideDtoFromJson(json);

  @override
  @JsonKey(name: 'code', defaultValue: '')
  final String code;
  @override
  @JsonKey(name: 'price', defaultValue: 0)
  final double price;
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
            (identical(other.code, code) || other.code == code) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, price, currency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      {@JsonKey(name: 'code', defaultValue: '') required final String code,
      @JsonKey(name: 'price', defaultValue: 0) required final double price,
      @JsonKey(name: 'currency', defaultValue: '')
      required final String currency}) = _$_ValueOverrideDto;
  const _ValueOverrideDto._() : super._();

  factory _ValueOverrideDto.fromJson(Map<String, dynamic> json) =
      _$_ValueOverrideDto.fromJson;

  @override
  @JsonKey(name: 'code', defaultValue: '')
  String get code;
  @override
  @JsonKey(name: 'price', defaultValue: 0)
  double get price;
  @override
  @JsonKey(name: 'currency', defaultValue: '')
  String get currency;
  @override
  @JsonKey(ignore: true)
  _$$_ValueOverrideDtoCopyWith<_$_ValueOverrideDto> get copyWith =>
      throw _privateConstructorUsedError;
}

PercentageOverrideDto _$PercentageOverrideDtoFromJson(
    Map<String, dynamic> json) {
  return _PercentageOverrideDto.fromJson(json);
}

/// @nodoc
mixin _$PercentageOverrideDto {
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'percentage', defaultValue: 0)
  double get percentage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PercentageOverrideDtoCopyWith<PercentageOverrideDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PercentageOverrideDtoCopyWith<$Res> {
  factory $PercentageOverrideDtoCopyWith(PercentageOverrideDto value,
          $Res Function(PercentageOverrideDto) then) =
      _$PercentageOverrideDtoCopyWithImpl<$Res, PercentageOverrideDto>;
  @useResult
  $Res call(
      {String code,
      @JsonKey(name: 'percentage', defaultValue: 0) double percentage});
}

/// @nodoc
class _$PercentageOverrideDtoCopyWithImpl<$Res,
        $Val extends PercentageOverrideDto>
    implements $PercentageOverrideDtoCopyWith<$Res> {
  _$PercentageOverrideDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? percentage = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PercentageOverrideDtoCopyWith<$Res>
    implements $PercentageOverrideDtoCopyWith<$Res> {
  factory _$$_PercentageOverrideDtoCopyWith(_$_PercentageOverrideDto value,
          $Res Function(_$_PercentageOverrideDto) then) =
      __$$_PercentageOverrideDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      @JsonKey(name: 'percentage', defaultValue: 0) double percentage});
}

/// @nodoc
class __$$_PercentageOverrideDtoCopyWithImpl<$Res>
    extends _$PercentageOverrideDtoCopyWithImpl<$Res, _$_PercentageOverrideDto>
    implements _$$_PercentageOverrideDtoCopyWith<$Res> {
  __$$_PercentageOverrideDtoCopyWithImpl(_$_PercentageOverrideDto _value,
      $Res Function(_$_PercentageOverrideDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? percentage = null,
  }) {
    return _then(_$_PercentageOverrideDto(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PercentageOverrideDto extends _PercentageOverrideDto {
  const _$_PercentageOverrideDto(
      {required this.code,
      @JsonKey(name: 'percentage', defaultValue: 0) required this.percentage})
      : super._();

  factory _$_PercentageOverrideDto.fromJson(Map<String, dynamic> json) =>
      _$$_PercentageOverrideDtoFromJson(json);

  @override
  final String code;
  @override
  @JsonKey(name: 'percentage', defaultValue: 0)
  final double percentage;

  @override
  String toString() {
    return 'PercentageOverrideDto(code: $code, percentage: $percentage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PercentageOverrideDto &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, percentage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PercentageOverrideDtoCopyWith<_$_PercentageOverrideDto> get copyWith =>
      __$$_PercentageOverrideDtoCopyWithImpl<_$_PercentageOverrideDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PercentageOverrideDtoToJson(
      this,
    );
  }
}

abstract class _PercentageOverrideDto extends PercentageOverrideDto {
  const factory _PercentageOverrideDto(
      {required final String code,
      @JsonKey(name: 'percentage', defaultValue: 0)
      required final double percentage}) = _$_PercentageOverrideDto;
  const _PercentageOverrideDto._() : super._();

  factory _PercentageOverrideDto.fromJson(Map<String, dynamic> json) =
      _$_PercentageOverrideDto.fromJson;

  @override
  String get code;
  @override
  @JsonKey(name: 'percentage', defaultValue: 0)
  double get percentage;
  @override
  @JsonKey(ignore: true)
  _$$_PercentageOverrideDtoCopyWith<_$_PercentageOverrideDto> get copyWith =>
      throw _privateConstructorUsedError;
}
