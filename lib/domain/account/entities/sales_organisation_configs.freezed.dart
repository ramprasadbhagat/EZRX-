// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sales_organisation_configs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SalesOrganisationConfigs {
  Currency get currency => throw _privateConstructorUsedError;
  bool get hideCustomer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SalesOrganisationConfigsCopyWith<SalesOrganisationConfigs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrganisationConfigsCopyWith<$Res> {
  factory $SalesOrganisationConfigsCopyWith(SalesOrganisationConfigs value,
          $Res Function(SalesOrganisationConfigs) then) =
      _$SalesOrganisationConfigsCopyWithImpl<$Res>;
  $Res call({Currency currency, bool hideCustomer});
}

/// @nodoc
class _$SalesOrganisationConfigsCopyWithImpl<$Res>
    implements $SalesOrganisationConfigsCopyWith<$Res> {
  _$SalesOrganisationConfigsCopyWithImpl(this._value, this._then);

  final SalesOrganisationConfigs _value;
  // ignore: unused_field
  final $Res Function(SalesOrganisationConfigs) _then;

  @override
  $Res call({
    Object? currency = freezed,
    Object? hideCustomer = freezed,
  }) {
    return _then(_value.copyWith(
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      hideCustomer: hideCustomer == freezed
          ? _value.hideCustomer
          : hideCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_SalesOrganisationConfigsCopyWith<$Res>
    implements $SalesOrganisationConfigsCopyWith<$Res> {
  factory _$$_SalesOrganisationConfigsCopyWith(
          _$_SalesOrganisationConfigs value,
          $Res Function(_$_SalesOrganisationConfigs) then) =
      __$$_SalesOrganisationConfigsCopyWithImpl<$Res>;
  @override
  $Res call({Currency currency, bool hideCustomer});
}

/// @nodoc
class __$$_SalesOrganisationConfigsCopyWithImpl<$Res>
    extends _$SalesOrganisationConfigsCopyWithImpl<$Res>
    implements _$$_SalesOrganisationConfigsCopyWith<$Res> {
  __$$_SalesOrganisationConfigsCopyWithImpl(_$_SalesOrganisationConfigs _value,
      $Res Function(_$_SalesOrganisationConfigs) _then)
      : super(_value, (v) => _then(v as _$_SalesOrganisationConfigs));

  @override
  _$_SalesOrganisationConfigs get _value =>
      super._value as _$_SalesOrganisationConfigs;

  @override
  $Res call({
    Object? currency = freezed,
    Object? hideCustomer = freezed,
  }) {
    return _then(_$_SalesOrganisationConfigs(
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      hideCustomer: hideCustomer == freezed
          ? _value.hideCustomer
          : hideCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SalesOrganisationConfigs extends _SalesOrganisationConfigs {
  const _$_SalesOrganisationConfigs(
      {required this.currency, required this.hideCustomer})
      : super._();

  @override
  final Currency currency;
  @override
  final bool hideCustomer;

  @override
  String toString() {
    return 'SalesOrganisationConfigs(currency: $currency, hideCustomer: $hideCustomer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalesOrganisationConfigs &&
            const DeepCollectionEquality().equals(other.currency, currency) &&
            const DeepCollectionEquality()
                .equals(other.hideCustomer, hideCustomer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currency),
      const DeepCollectionEquality().hash(hideCustomer));

  @JsonKey(ignore: true)
  @override
  _$$_SalesOrganisationConfigsCopyWith<_$_SalesOrganisationConfigs>
      get copyWith => __$$_SalesOrganisationConfigsCopyWithImpl<
          _$_SalesOrganisationConfigs>(this, _$identity);
}

abstract class _SalesOrganisationConfigs extends SalesOrganisationConfigs {
  const factory _SalesOrganisationConfigs(
      {required final Currency currency,
      required final bool hideCustomer}) = _$_SalesOrganisationConfigs;
  const _SalesOrganisationConfigs._() : super._();

  @override
  Currency get currency;
  @override
  bool get hideCustomer;
  @override
  @JsonKey(ignore: true)
  _$$_SalesOrganisationConfigsCopyWith<_$_SalesOrganisationConfigs>
      get copyWith => throw _privateConstructorUsedError;
}
