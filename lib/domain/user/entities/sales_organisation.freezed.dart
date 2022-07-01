// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sales_organisation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SalesOrganisation {
  SalesOrg get salesOrg => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SalesOrganisationCopyWith<SalesOrganisation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrganisationCopyWith<$Res> {
  factory $SalesOrganisationCopyWith(
          SalesOrganisation value, $Res Function(SalesOrganisation) then) =
      _$SalesOrganisationCopyWithImpl<$Res>;
  $Res call({SalesOrg salesOrg});
}

/// @nodoc
class _$SalesOrganisationCopyWithImpl<$Res>
    implements $SalesOrganisationCopyWith<$Res> {
  _$SalesOrganisationCopyWithImpl(this._value, this._then);

  final SalesOrganisation _value;
  // ignore: unused_field
  final $Res Function(SalesOrganisation) _then;

  @override
  $Res call({
    Object? salesOrg = freezed,
  }) {
    return _then(_value.copyWith(
      salesOrg: salesOrg == freezed
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ));
  }
}

/// @nodoc
abstract class _$$_SalesOrganisationCopyWith<$Res>
    implements $SalesOrganisationCopyWith<$Res> {
  factory _$$_SalesOrganisationCopyWith(_$_SalesOrganisation value,
          $Res Function(_$_SalesOrganisation) then) =
      __$$_SalesOrganisationCopyWithImpl<$Res>;
  @override
  $Res call({SalesOrg salesOrg});
}

/// @nodoc
class __$$_SalesOrganisationCopyWithImpl<$Res>
    extends _$SalesOrganisationCopyWithImpl<$Res>
    implements _$$_SalesOrganisationCopyWith<$Res> {
  __$$_SalesOrganisationCopyWithImpl(
      _$_SalesOrganisation _value, $Res Function(_$_SalesOrganisation) _then)
      : super(_value, (v) => _then(v as _$_SalesOrganisation));

  @override
  _$_SalesOrganisation get _value => super._value as _$_SalesOrganisation;

  @override
  $Res call({
    Object? salesOrg = freezed,
  }) {
    return _then(_$_SalesOrganisation(
      salesOrg: salesOrg == freezed
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ));
  }
}

/// @nodoc

class _$_SalesOrganisation extends _SalesOrganisation {
  const _$_SalesOrganisation({required this.salesOrg}) : super._();

  @override
  final SalesOrg salesOrg;

  @override
  String toString() {
    return 'SalesOrganisation(salesOrg: $salesOrg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalesOrganisation &&
            const DeepCollectionEquality().equals(other.salesOrg, salesOrg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(salesOrg));

  @JsonKey(ignore: true)
  @override
  _$$_SalesOrganisationCopyWith<_$_SalesOrganisation> get copyWith =>
      __$$_SalesOrganisationCopyWithImpl<_$_SalesOrganisation>(
          this, _$identity);
}

abstract class _SalesOrganisation extends SalesOrganisation {
  const factory _SalesOrganisation({required final SalesOrg salesOrg}) =
      _$_SalesOrganisation;
  const _SalesOrganisation._() : super._();

  @override
  SalesOrg get salesOrg => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SalesOrganisationCopyWith<_$_SalesOrganisation> get copyWith =>
      throw _privateConstructorUsedError;
}
