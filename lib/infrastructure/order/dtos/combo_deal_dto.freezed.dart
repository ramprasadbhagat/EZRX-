// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'combo_deal_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ComboDealDto _$ComboDealDtoFromJson(Map<String, dynamic> json) {
  return _ComboDealDto.fromJson(json);
}

/// @nodoc
mixin _$ComboDealDto {
  @JsonKey(name: 'groupDeal')
  @HiveField(0, defaultValue: ComboDealGroupDealDto.empty)
  ComboDealGroupDealDto get groupDeal => throw _privateConstructorUsedError;
  @JsonKey(name: 'flexiSKUTier', defaultValue: [])
  @HiveField(1, defaultValue: [])
  List<ComboDealSKUTierDto> get flexiSKUTier =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'flexiQtyTier', defaultValue: [])
  @HiveField(2, defaultValue: [])
  List<ComboDealQtyTierDto> get flexiQtyTier =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'flexiAmmountTier', defaultValue: [])
  @HiveField(3, defaultValue: [])
  List<ComboDealAmountTierDto> get flexiAmountTier =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'materialComboDeals', defaultValue: [])
  @HiveField(4, defaultValue: [])
  List<ComboDealMaterialSetDto> get materialComboDeals =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComboDealDtoCopyWith<ComboDealDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComboDealDtoCopyWith<$Res> {
  factory $ComboDealDtoCopyWith(
          ComboDealDto value, $Res Function(ComboDealDto) then) =
      _$ComboDealDtoCopyWithImpl<$Res, ComboDealDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'groupDeal')
      @HiveField(0, defaultValue: ComboDealGroupDealDto.empty)
          ComboDealGroupDealDto groupDeal,
      @JsonKey(name: 'flexiSKUTier', defaultValue: [])
      @HiveField(1, defaultValue: [])
          List<ComboDealSKUTierDto> flexiSKUTier,
      @JsonKey(name: 'flexiQtyTier', defaultValue: [])
      @HiveField(2, defaultValue: [])
          List<ComboDealQtyTierDto> flexiQtyTier,
      @JsonKey(name: 'flexiAmmountTier', defaultValue: [])
      @HiveField(3, defaultValue: [])
          List<ComboDealAmountTierDto> flexiAmountTier,
      @JsonKey(name: 'materialComboDeals', defaultValue: [])
      @HiveField(4, defaultValue: [])
          List<ComboDealMaterialSetDto> materialComboDeals});

  $ComboDealGroupDealDtoCopyWith<$Res> get groupDeal;
}

/// @nodoc
class _$ComboDealDtoCopyWithImpl<$Res, $Val extends ComboDealDto>
    implements $ComboDealDtoCopyWith<$Res> {
  _$ComboDealDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupDeal = null,
    Object? flexiSKUTier = null,
    Object? flexiQtyTier = null,
    Object? flexiAmountTier = null,
    Object? materialComboDeals = null,
  }) {
    return _then(_value.copyWith(
      groupDeal: null == groupDeal
          ? _value.groupDeal
          : groupDeal // ignore: cast_nullable_to_non_nullable
              as ComboDealGroupDealDto,
      flexiSKUTier: null == flexiSKUTier
          ? _value.flexiSKUTier
          : flexiSKUTier // ignore: cast_nullable_to_non_nullable
              as List<ComboDealSKUTierDto>,
      flexiQtyTier: null == flexiQtyTier
          ? _value.flexiQtyTier
          : flexiQtyTier // ignore: cast_nullable_to_non_nullable
              as List<ComboDealQtyTierDto>,
      flexiAmountTier: null == flexiAmountTier
          ? _value.flexiAmountTier
          : flexiAmountTier // ignore: cast_nullable_to_non_nullable
              as List<ComboDealAmountTierDto>,
      materialComboDeals: null == materialComboDeals
          ? _value.materialComboDeals
          : materialComboDeals // ignore: cast_nullable_to_non_nullable
              as List<ComboDealMaterialSetDto>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ComboDealGroupDealDtoCopyWith<$Res> get groupDeal {
    return $ComboDealGroupDealDtoCopyWith<$Res>(_value.groupDeal, (value) {
      return _then(_value.copyWith(groupDeal: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ComboDealDtoCopyWith<$Res>
    implements $ComboDealDtoCopyWith<$Res> {
  factory _$$_ComboDealDtoCopyWith(
          _$_ComboDealDto value, $Res Function(_$_ComboDealDto) then) =
      __$$_ComboDealDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'groupDeal')
      @HiveField(0, defaultValue: ComboDealGroupDealDto.empty)
          ComboDealGroupDealDto groupDeal,
      @JsonKey(name: 'flexiSKUTier', defaultValue: [])
      @HiveField(1, defaultValue: [])
          List<ComboDealSKUTierDto> flexiSKUTier,
      @JsonKey(name: 'flexiQtyTier', defaultValue: [])
      @HiveField(2, defaultValue: [])
          List<ComboDealQtyTierDto> flexiQtyTier,
      @JsonKey(name: 'flexiAmmountTier', defaultValue: [])
      @HiveField(3, defaultValue: [])
          List<ComboDealAmountTierDto> flexiAmountTier,
      @JsonKey(name: 'materialComboDeals', defaultValue: [])
      @HiveField(4, defaultValue: [])
          List<ComboDealMaterialSetDto> materialComboDeals});

  @override
  $ComboDealGroupDealDtoCopyWith<$Res> get groupDeal;
}

/// @nodoc
class __$$_ComboDealDtoCopyWithImpl<$Res>
    extends _$ComboDealDtoCopyWithImpl<$Res, _$_ComboDealDto>
    implements _$$_ComboDealDtoCopyWith<$Res> {
  __$$_ComboDealDtoCopyWithImpl(
      _$_ComboDealDto _value, $Res Function(_$_ComboDealDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupDeal = null,
    Object? flexiSKUTier = null,
    Object? flexiQtyTier = null,
    Object? flexiAmountTier = null,
    Object? materialComboDeals = null,
  }) {
    return _then(_$_ComboDealDto(
      groupDeal: null == groupDeal
          ? _value.groupDeal
          : groupDeal // ignore: cast_nullable_to_non_nullable
              as ComboDealGroupDealDto,
      flexiSKUTier: null == flexiSKUTier
          ? _value._flexiSKUTier
          : flexiSKUTier // ignore: cast_nullable_to_non_nullable
              as List<ComboDealSKUTierDto>,
      flexiQtyTier: null == flexiQtyTier
          ? _value._flexiQtyTier
          : flexiQtyTier // ignore: cast_nullable_to_non_nullable
              as List<ComboDealQtyTierDto>,
      flexiAmountTier: null == flexiAmountTier
          ? _value._flexiAmountTier
          : flexiAmountTier // ignore: cast_nullable_to_non_nullable
              as List<ComboDealAmountTierDto>,
      materialComboDeals: null == materialComboDeals
          ? _value._materialComboDeals
          : materialComboDeals // ignore: cast_nullable_to_non_nullable
              as List<ComboDealMaterialSetDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 24, adapterName: 'ComboDealDtoAdapter')
class _$_ComboDealDto extends _ComboDealDto {
  const _$_ComboDealDto(
      {@JsonKey(name: 'groupDeal')
      @HiveField(0, defaultValue: ComboDealGroupDealDto.empty)
          this.groupDeal = ComboDealGroupDealDto.empty,
      @JsonKey(name: 'flexiSKUTier', defaultValue: [])
      @HiveField(1, defaultValue: [])
          required final List<ComboDealSKUTierDto> flexiSKUTier,
      @JsonKey(name: 'flexiQtyTier', defaultValue: [])
      @HiveField(2, defaultValue: [])
          required final List<ComboDealQtyTierDto> flexiQtyTier,
      @JsonKey(name: 'flexiAmmountTier', defaultValue: [])
      @HiveField(3, defaultValue: [])
          required final List<ComboDealAmountTierDto> flexiAmountTier,
      @JsonKey(name: 'materialComboDeals', defaultValue: [])
      @HiveField(4, defaultValue: [])
          required final List<ComboDealMaterialSetDto> materialComboDeals})
      : _flexiSKUTier = flexiSKUTier,
        _flexiQtyTier = flexiQtyTier,
        _flexiAmountTier = flexiAmountTier,
        _materialComboDeals = materialComboDeals,
        super._();

  factory _$_ComboDealDto.fromJson(Map<String, dynamic> json) =>
      _$$_ComboDealDtoFromJson(json);

  @override
  @JsonKey(name: 'groupDeal')
  @HiveField(0, defaultValue: ComboDealGroupDealDto.empty)
  final ComboDealGroupDealDto groupDeal;
  final List<ComboDealSKUTierDto> _flexiSKUTier;
  @override
  @JsonKey(name: 'flexiSKUTier', defaultValue: [])
  @HiveField(1, defaultValue: [])
  List<ComboDealSKUTierDto> get flexiSKUTier {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flexiSKUTier);
  }

  final List<ComboDealQtyTierDto> _flexiQtyTier;
  @override
  @JsonKey(name: 'flexiQtyTier', defaultValue: [])
  @HiveField(2, defaultValue: [])
  List<ComboDealQtyTierDto> get flexiQtyTier {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flexiQtyTier);
  }

  final List<ComboDealAmountTierDto> _flexiAmountTier;
  @override
  @JsonKey(name: 'flexiAmmountTier', defaultValue: [])
  @HiveField(3, defaultValue: [])
  List<ComboDealAmountTierDto> get flexiAmountTier {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flexiAmountTier);
  }

  final List<ComboDealMaterialSetDto> _materialComboDeals;
  @override
  @JsonKey(name: 'materialComboDeals', defaultValue: [])
  @HiveField(4, defaultValue: [])
  List<ComboDealMaterialSetDto> get materialComboDeals {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materialComboDeals);
  }

  @override
  String toString() {
    return 'ComboDealDto(groupDeal: $groupDeal, flexiSKUTier: $flexiSKUTier, flexiQtyTier: $flexiQtyTier, flexiAmountTier: $flexiAmountTier, materialComboDeals: $materialComboDeals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ComboDealDto &&
            (identical(other.groupDeal, groupDeal) ||
                other.groupDeal == groupDeal) &&
            const DeepCollectionEquality()
                .equals(other._flexiSKUTier, _flexiSKUTier) &&
            const DeepCollectionEquality()
                .equals(other._flexiQtyTier, _flexiQtyTier) &&
            const DeepCollectionEquality()
                .equals(other._flexiAmountTier, _flexiAmountTier) &&
            const DeepCollectionEquality()
                .equals(other._materialComboDeals, _materialComboDeals));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      groupDeal,
      const DeepCollectionEquality().hash(_flexiSKUTier),
      const DeepCollectionEquality().hash(_flexiQtyTier),
      const DeepCollectionEquality().hash(_flexiAmountTier),
      const DeepCollectionEquality().hash(_materialComboDeals));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ComboDealDtoCopyWith<_$_ComboDealDto> get copyWith =>
      __$$_ComboDealDtoCopyWithImpl<_$_ComboDealDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ComboDealDtoToJson(
      this,
    );
  }
}

abstract class _ComboDealDto extends ComboDealDto {
  const factory _ComboDealDto(
      {@JsonKey(name: 'groupDeal')
      @HiveField(0, defaultValue: ComboDealGroupDealDto.empty)
          final ComboDealGroupDealDto groupDeal,
      @JsonKey(name: 'flexiSKUTier', defaultValue: [])
      @HiveField(1, defaultValue: [])
          required final List<ComboDealSKUTierDto> flexiSKUTier,
      @JsonKey(name: 'flexiQtyTier', defaultValue: [])
      @HiveField(2, defaultValue: [])
          required final List<ComboDealQtyTierDto> flexiQtyTier,
      @JsonKey(name: 'flexiAmmountTier', defaultValue: [])
      @HiveField(3, defaultValue: [])
          required final List<ComboDealAmountTierDto> flexiAmountTier,
      @JsonKey(name: 'materialComboDeals', defaultValue: [])
      @HiveField(4, defaultValue: [])
          required final List<ComboDealMaterialSetDto>
              materialComboDeals}) = _$_ComboDealDto;
  const _ComboDealDto._() : super._();

  factory _ComboDealDto.fromJson(Map<String, dynamic> json) =
      _$_ComboDealDto.fromJson;

  @override
  @JsonKey(name: 'groupDeal')
  @HiveField(0, defaultValue: ComboDealGroupDealDto.empty)
  ComboDealGroupDealDto get groupDeal;
  @override
  @JsonKey(name: 'flexiSKUTier', defaultValue: [])
  @HiveField(1, defaultValue: [])
  List<ComboDealSKUTierDto> get flexiSKUTier;
  @override
  @JsonKey(name: 'flexiQtyTier', defaultValue: [])
  @HiveField(2, defaultValue: [])
  List<ComboDealQtyTierDto> get flexiQtyTier;
  @override
  @JsonKey(name: 'flexiAmmountTier', defaultValue: [])
  @HiveField(3, defaultValue: [])
  List<ComboDealAmountTierDto> get flexiAmountTier;
  @override
  @JsonKey(name: 'materialComboDeals', defaultValue: [])
  @HiveField(4, defaultValue: [])
  List<ComboDealMaterialSetDto> get materialComboDeals;
  @override
  @JsonKey(ignore: true)
  _$$_ComboDealDtoCopyWith<_$_ComboDealDto> get copyWith =>
      throw _privateConstructorUsedError;
}
