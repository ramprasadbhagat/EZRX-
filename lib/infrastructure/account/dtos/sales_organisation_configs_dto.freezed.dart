// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sales_organisation_configs_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SalesOrganisationConfigsDto _$SalesOrganisationConfigsDtoFromJson(
    Map<String, dynamic> json) {
  return _SalesOrganisationConfigsDto.fromJson(json);
}

/// @nodoc
mixin _$SalesOrganisationConfigsDto {
  @JsonKey(name: 'currency')
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'hideCustomer')
  bool get hideCustomer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalesOrganisationConfigsDtoCopyWith<SalesOrganisationConfigsDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrganisationConfigsDtoCopyWith<$Res> {
  factory $SalesOrganisationConfigsDtoCopyWith(
          SalesOrganisationConfigsDto value,
          $Res Function(SalesOrganisationConfigsDto) then) =
      _$SalesOrganisationConfigsDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'currency') String currency,
      @JsonKey(name: 'hideCustomer') bool hideCustomer});
}

/// @nodoc
class _$SalesOrganisationConfigsDtoCopyWithImpl<$Res>
    implements $SalesOrganisationConfigsDtoCopyWith<$Res> {
  _$SalesOrganisationConfigsDtoCopyWithImpl(this._value, this._then);

  final SalesOrganisationConfigsDto _value;
  // ignore: unused_field
  final $Res Function(SalesOrganisationConfigsDto) _then;

  @override
  $Res call({
    Object? currency = freezed,
    Object? hideCustomer = freezed,
  }) {
    return _then(_value.copyWith(
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      hideCustomer: hideCustomer == freezed
          ? _value.hideCustomer
          : hideCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_SalesOrganisationConfigsDtoCopyWith<$Res>
    implements $SalesOrganisationConfigsDtoCopyWith<$Res> {
  factory _$$_SalesOrganisationConfigsDtoCopyWith(
          _$_SalesOrganisationConfigsDto value,
          $Res Function(_$_SalesOrganisationConfigsDto) then) =
      __$$_SalesOrganisationConfigsDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'currency') String currency,
      @JsonKey(name: 'hideCustomer') bool hideCustomer});
}

/// @nodoc
class __$$_SalesOrganisationConfigsDtoCopyWithImpl<$Res>
    extends _$SalesOrganisationConfigsDtoCopyWithImpl<$Res>
    implements _$$_SalesOrganisationConfigsDtoCopyWith<$Res> {
  __$$_SalesOrganisationConfigsDtoCopyWithImpl(
      _$_SalesOrganisationConfigsDto _value,
      $Res Function(_$_SalesOrganisationConfigsDto) _then)
      : super(_value, (v) => _then(v as _$_SalesOrganisationConfigsDto));

  @override
  _$_SalesOrganisationConfigsDto get _value =>
      super._value as _$_SalesOrganisationConfigsDto;

  @override
  $Res call({
    Object? currency = freezed,
    Object? hideCustomer = freezed,
  }) {
    return _then(_$_SalesOrganisationConfigsDto(
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      hideCustomer: hideCustomer == freezed
          ? _value.hideCustomer
          : hideCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SalesOrganisationConfigsDto extends _SalesOrganisationConfigsDto {
  const _$_SalesOrganisationConfigsDto(
      {@JsonKey(name: 'currency') required this.currency,
      @JsonKey(name: 'hideCustomer') required this.hideCustomer})
      : super._();

  factory _$_SalesOrganisationConfigsDto.fromJson(Map<String, dynamic> json) =>
      _$$_SalesOrganisationConfigsDtoFromJson(json);

  @override
  @JsonKey(name: 'currency')
  final String currency;
  @override
  @JsonKey(name: 'hideCustomer')
  final bool hideCustomer;

  @override
  String toString() {
    return 'SalesOrganisationConfigsDto(currency: $currency, hideCustomer: $hideCustomer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalesOrganisationConfigsDto &&
            const DeepCollectionEquality().equals(other.currency, currency) &&
            const DeepCollectionEquality()
                .equals(other.hideCustomer, hideCustomer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currency),
      const DeepCollectionEquality().hash(hideCustomer));

  @JsonKey(ignore: true)
  @override
  _$$_SalesOrganisationConfigsDtoCopyWith<_$_SalesOrganisationConfigsDto>
      get copyWith => __$$_SalesOrganisationConfigsDtoCopyWithImpl<
          _$_SalesOrganisationConfigsDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SalesOrganisationConfigsDtoToJson(
      this,
    );
  }
}

abstract class _SalesOrganisationConfigsDto
    extends SalesOrganisationConfigsDto {
  const factory _SalesOrganisationConfigsDto(
          {@JsonKey(name: 'currency') required final String currency,
          @JsonKey(name: 'hideCustomer') required final bool hideCustomer}) =
      _$_SalesOrganisationConfigsDto;
  const _SalesOrganisationConfigsDto._() : super._();

  factory _SalesOrganisationConfigsDto.fromJson(Map<String, dynamic> json) =
      _$_SalesOrganisationConfigsDto.fromJson;

  @override
  @JsonKey(name: 'currency')
  String get currency;
  @override
  @JsonKey(name: 'hideCustomer')
  bool get hideCustomer;
  @override
  @JsonKey(ignore: true)
  _$$_SalesOrganisationConfigsDtoCopyWith<_$_SalesOrganisationConfigsDto>
      get copyWith => throw _privateConstructorUsedError;
}
