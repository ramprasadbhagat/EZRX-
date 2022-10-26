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
  @JsonKey(name: 'hideCustomer', defaultValue: false)
  bool get hideCustomer => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableGimmickMaterial', defaultValue: false)
  bool get enableGimmickMaterial => throw _privateConstructorUsedError;
  @JsonKey(name: 'languageFilter', defaultValue: false)
  bool get languageFilter => throw _privateConstructorUsedError;
  @JsonKey(name: 'languageValue', defaultValue: '')
  String get languageValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'disablePrincipals', defaultValue: false)
  bool get disablePrincipals => throw _privateConstructorUsedError;
  @_PrincipalListConverter()
  @JsonKey(name: 'principalList')
  List<dynamic> get principalList => throw _privateConstructorUsedError;
  @JsonKey(name: 'disableOrderType', defaultValue: false)
  bool get disableOrderType => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableBatchNumber', defaultValue: false)
  bool get enableBatchNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'disableBundles', defaultValue: false)
  bool get disableBundles => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableZDP5', defaultValue: false)
  bool get enableZDP5 => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'currency')
          String currency,
      @JsonKey(name: 'hideCustomer', defaultValue: false)
          bool hideCustomer,
      @JsonKey(name: 'enableGimmickMaterial', defaultValue: false)
          bool enableGimmickMaterial,
      @JsonKey(name: 'languageFilter', defaultValue: false)
          bool languageFilter,
      @JsonKey(name: 'languageValue', defaultValue: '')
          String languageValue,
      @JsonKey(name: 'disablePrincipals', defaultValue: false)
          bool disablePrincipals,
      @_PrincipalListConverter()
      @JsonKey(name: 'principalList')
          List<dynamic> principalList,
      @JsonKey(name: 'disableOrderType', defaultValue: false)
          bool disableOrderType,
      @JsonKey(name: 'enableBatchNumber', defaultValue: false)
          bool enableBatchNumber,
      @JsonKey(name: 'disableBundles', defaultValue: false)
          bool disableBundles,
      @JsonKey(name: 'enableZDP5', defaultValue: false)
          bool enableZDP5});
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
    Object? enableGimmickMaterial = freezed,
    Object? languageFilter = freezed,
    Object? languageValue = freezed,
    Object? disablePrincipals = freezed,
    Object? principalList = freezed,
    Object? disableOrderType = freezed,
    Object? enableBatchNumber = freezed,
    Object? disableBundles = freezed,
    Object? enableZDP5 = freezed,
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
      enableGimmickMaterial: enableGimmickMaterial == freezed
          ? _value.enableGimmickMaterial
          : enableGimmickMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      languageFilter: languageFilter == freezed
          ? _value.languageFilter
          : languageFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      languageValue: languageValue == freezed
          ? _value.languageValue
          : languageValue // ignore: cast_nullable_to_non_nullable
              as String,
      disablePrincipals: disablePrincipals == freezed
          ? _value.disablePrincipals
          : disablePrincipals // ignore: cast_nullable_to_non_nullable
              as bool,
      principalList: principalList == freezed
          ? _value.principalList
          : principalList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      disableOrderType: disableOrderType == freezed
          ? _value.disableOrderType
          : disableOrderType // ignore: cast_nullable_to_non_nullable
              as bool,
      enableBatchNumber: enableBatchNumber == freezed
          ? _value.enableBatchNumber
          : enableBatchNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      disableBundles: disableBundles == freezed
          ? _value.disableBundles
          : disableBundles // ignore: cast_nullable_to_non_nullable
              as bool,
      enableZDP5: enableZDP5 == freezed
          ? _value.enableZDP5
          : enableZDP5 // ignore: cast_nullable_to_non_nullable
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
      {@JsonKey(name: 'currency')
          String currency,
      @JsonKey(name: 'hideCustomer', defaultValue: false)
          bool hideCustomer,
      @JsonKey(name: 'enableGimmickMaterial', defaultValue: false)
          bool enableGimmickMaterial,
      @JsonKey(name: 'languageFilter', defaultValue: false)
          bool languageFilter,
      @JsonKey(name: 'languageValue', defaultValue: '')
          String languageValue,
      @JsonKey(name: 'disablePrincipals', defaultValue: false)
          bool disablePrincipals,
      @_PrincipalListConverter()
      @JsonKey(name: 'principalList')
          List<dynamic> principalList,
      @JsonKey(name: 'disableOrderType', defaultValue: false)
          bool disableOrderType,
      @JsonKey(name: 'enableBatchNumber', defaultValue: false)
          bool enableBatchNumber,
      @JsonKey(name: 'disableBundles', defaultValue: false)
          bool disableBundles,
      @JsonKey(name: 'enableZDP5', defaultValue: false)
          bool enableZDP5});
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
    Object? enableGimmickMaterial = freezed,
    Object? languageFilter = freezed,
    Object? languageValue = freezed,
    Object? disablePrincipals = freezed,
    Object? principalList = freezed,
    Object? disableOrderType = freezed,
    Object? enableBatchNumber = freezed,
    Object? disableBundles = freezed,
    Object? enableZDP5 = freezed,
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
      enableGimmickMaterial: enableGimmickMaterial == freezed
          ? _value.enableGimmickMaterial
          : enableGimmickMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      languageFilter: languageFilter == freezed
          ? _value.languageFilter
          : languageFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      languageValue: languageValue == freezed
          ? _value.languageValue
          : languageValue // ignore: cast_nullable_to_non_nullable
              as String,
      disablePrincipals: disablePrincipals == freezed
          ? _value.disablePrincipals
          : disablePrincipals // ignore: cast_nullable_to_non_nullable
              as bool,
      principalList: principalList == freezed
          ? _value._principalList
          : principalList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      disableOrderType: disableOrderType == freezed
          ? _value.disableOrderType
          : disableOrderType // ignore: cast_nullable_to_non_nullable
              as bool,
      enableBatchNumber: enableBatchNumber == freezed
          ? _value.enableBatchNumber
          : enableBatchNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      disableBundles: disableBundles == freezed
          ? _value.disableBundles
          : disableBundles // ignore: cast_nullable_to_non_nullable
              as bool,
      enableZDP5: enableZDP5 == freezed
          ? _value.enableZDP5
          : enableZDP5 // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SalesOrganisationConfigsDto extends _SalesOrganisationConfigsDto {
  const _$_SalesOrganisationConfigsDto(
      {@JsonKey(name: 'currency')
          required this.currency,
      @JsonKey(name: 'hideCustomer', defaultValue: false)
          required this.hideCustomer,
      @JsonKey(name: 'enableGimmickMaterial', defaultValue: false)
          required this.enableGimmickMaterial,
      @JsonKey(name: 'languageFilter', defaultValue: false)
          required this.languageFilter,
      @JsonKey(name: 'languageValue', defaultValue: '')
          required this.languageValue,
      @JsonKey(name: 'disablePrincipals', defaultValue: false)
          required this.disablePrincipals,
      @_PrincipalListConverter()
      @JsonKey(name: 'principalList')
          required final List<dynamic> principalList,
      @JsonKey(name: 'disableOrderType', defaultValue: false)
          required this.disableOrderType,
      @JsonKey(name: 'enableBatchNumber', defaultValue: false)
          required this.enableBatchNumber,
      @JsonKey(name: 'disableBundles', defaultValue: false)
          required this.disableBundles,
      @JsonKey(name: 'enableZDP5', defaultValue: false)
          required this.enableZDP5})
      : _principalList = principalList,
        super._();

  factory _$_SalesOrganisationConfigsDto.fromJson(Map<String, dynamic> json) =>
      _$$_SalesOrganisationConfigsDtoFromJson(json);

  @override
  @JsonKey(name: 'currency')
  final String currency;
  @override
  @JsonKey(name: 'hideCustomer', defaultValue: false)
  final bool hideCustomer;
  @override
  @JsonKey(name: 'enableGimmickMaterial', defaultValue: false)
  final bool enableGimmickMaterial;
  @override
  @JsonKey(name: 'languageFilter', defaultValue: false)
  final bool languageFilter;
  @override
  @JsonKey(name: 'languageValue', defaultValue: '')
  final String languageValue;
  @override
  @JsonKey(name: 'disablePrincipals', defaultValue: false)
  final bool disablePrincipals;
  final List<dynamic> _principalList;
  @override
  @_PrincipalListConverter()
  @JsonKey(name: 'principalList')
  List<dynamic> get principalList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_principalList);
  }

  @override
  @JsonKey(name: 'disableOrderType', defaultValue: false)
  final bool disableOrderType;
  @override
  @JsonKey(name: 'enableBatchNumber', defaultValue: false)
  final bool enableBatchNumber;
  @override
  @JsonKey(name: 'disableBundles', defaultValue: false)
  final bool disableBundles;
  @override
  @JsonKey(name: 'enableZDP5', defaultValue: false)
  final bool enableZDP5;

  @override
  String toString() {
    return 'SalesOrganisationConfigsDto(currency: $currency, hideCustomer: $hideCustomer, enableGimmickMaterial: $enableGimmickMaterial, languageFilter: $languageFilter, languageValue: $languageValue, disablePrincipals: $disablePrincipals, principalList: $principalList, disableOrderType: $disableOrderType, enableBatchNumber: $enableBatchNumber, disableBundles: $disableBundles, enableZDP5: $enableZDP5)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalesOrganisationConfigsDto &&
            const DeepCollectionEquality().equals(other.currency, currency) &&
            const DeepCollectionEquality()
                .equals(other.hideCustomer, hideCustomer) &&
            const DeepCollectionEquality()
                .equals(other.enableGimmickMaterial, enableGimmickMaterial) &&
            const DeepCollectionEquality()
                .equals(other.languageFilter, languageFilter) &&
            const DeepCollectionEquality()
                .equals(other.languageValue, languageValue) &&
            const DeepCollectionEquality()
                .equals(other.disablePrincipals, disablePrincipals) &&
            const DeepCollectionEquality()
                .equals(other._principalList, _principalList) &&
            const DeepCollectionEquality()
                .equals(other.disableOrderType, disableOrderType) &&
            const DeepCollectionEquality()
                .equals(other.enableBatchNumber, enableBatchNumber) &&
            const DeepCollectionEquality()
                .equals(other.disableBundles, disableBundles) &&
            const DeepCollectionEquality()
                .equals(other.enableZDP5, enableZDP5));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currency),
      const DeepCollectionEquality().hash(hideCustomer),
      const DeepCollectionEquality().hash(enableGimmickMaterial),
      const DeepCollectionEquality().hash(languageFilter),
      const DeepCollectionEquality().hash(languageValue),
      const DeepCollectionEquality().hash(disablePrincipals),
      const DeepCollectionEquality().hash(_principalList),
      const DeepCollectionEquality().hash(disableOrderType),
      const DeepCollectionEquality().hash(enableBatchNumber),
      const DeepCollectionEquality().hash(disableBundles),
      const DeepCollectionEquality().hash(enableZDP5));

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
      {@JsonKey(name: 'currency')
          required final String currency,
      @JsonKey(name: 'hideCustomer', defaultValue: false)
          required final bool hideCustomer,
      @JsonKey(name: 'enableGimmickMaterial', defaultValue: false)
          required final bool enableGimmickMaterial,
      @JsonKey(name: 'languageFilter', defaultValue: false)
          required final bool languageFilter,
      @JsonKey(name: 'languageValue', defaultValue: '')
          required final String languageValue,
      @JsonKey(name: 'disablePrincipals', defaultValue: false)
          required final bool disablePrincipals,
      @_PrincipalListConverter()
      @JsonKey(name: 'principalList')
          required final List<dynamic> principalList,
      @JsonKey(name: 'disableOrderType', defaultValue: false)
          required final bool disableOrderType,
      @JsonKey(name: 'enableBatchNumber', defaultValue: false)
          required final bool enableBatchNumber,
      @JsonKey(name: 'disableBundles', defaultValue: false)
          required final bool disableBundles,
      @JsonKey(name: 'enableZDP5', defaultValue: false)
          required final bool enableZDP5}) = _$_SalesOrganisationConfigsDto;
  const _SalesOrganisationConfigsDto._() : super._();

  factory _SalesOrganisationConfigsDto.fromJson(Map<String, dynamic> json) =
      _$_SalesOrganisationConfigsDto.fromJson;

  @override
  @JsonKey(name: 'currency')
  String get currency;
  @override
  @JsonKey(name: 'hideCustomer', defaultValue: false)
  bool get hideCustomer;
  @override
  @JsonKey(name: 'enableGimmickMaterial', defaultValue: false)
  bool get enableGimmickMaterial;
  @override
  @JsonKey(name: 'languageFilter', defaultValue: false)
  bool get languageFilter;
  @override
  @JsonKey(name: 'languageValue', defaultValue: '')
  String get languageValue;
  @override
  @JsonKey(name: 'disablePrincipals', defaultValue: false)
  bool get disablePrincipals;
  @override
  @_PrincipalListConverter()
  @JsonKey(name: 'principalList')
  List<dynamic> get principalList;
  @override
  @JsonKey(name: 'disableOrderType', defaultValue: false)
  bool get disableOrderType;
  @override
  @JsonKey(name: 'enableBatchNumber', defaultValue: false)
  bool get enableBatchNumber;
  @override
  @JsonKey(name: 'disableBundles', defaultValue: false)
  bool get disableBundles;
  @override
  @JsonKey(name: 'enableZDP5', defaultValue: false)
  bool get enableZDP5;
  @override
  @JsonKey(ignore: true)
  _$$_SalesOrganisationConfigsDtoCopyWith<_$_SalesOrganisationConfigsDto>
      get copyWith => throw _privateConstructorUsedError;
}
