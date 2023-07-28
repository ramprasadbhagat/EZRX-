// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_combo_deal_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PriceComboDealDto _$PriceComboDealDtoFromJson(Map<String, dynamic> json) {
  return _PriceComboDealDto.fromJson(json);
}

/// @nodoc
mixin _$PriceComboDealDto {
  @JsonKey(name: 'Eligible', defaultValue: false)
  @HiveField(0, defaultValue: false)
  bool get isEligible => throw _privateConstructorUsedError;
  @JsonKey(name: 'FlexibleGroup', defaultValue: '')
  @HiveField(1, defaultValue: '')
  String get flexibleGroup => throw _privateConstructorUsedError;
  @JsonKey(name: 'SalesDeal', defaultValue: '')
  @HiveField(2, defaultValue: '')
  String get salesDeal => throw _privateConstructorUsedError;
  @JsonKey(name: 'Category')
  @HiveField(3, defaultValue: PriceComboDealCategoryDto.empty)
  PriceComboDealCategoryDto get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceComboDealDtoCopyWith<PriceComboDealDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceComboDealDtoCopyWith<$Res> {
  factory $PriceComboDealDtoCopyWith(
          PriceComboDealDto value, $Res Function(PriceComboDealDto) then) =
      _$PriceComboDealDtoCopyWithImpl<$Res, PriceComboDealDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Eligible', defaultValue: false)
      @HiveField(0, defaultValue: false)
      bool isEligible,
      @JsonKey(name: 'FlexibleGroup', defaultValue: '')
      @HiveField(1, defaultValue: '')
      String flexibleGroup,
      @JsonKey(name: 'SalesDeal', defaultValue: '')
      @HiveField(2, defaultValue: '')
      String salesDeal,
      @JsonKey(name: 'Category')
      @HiveField(3, defaultValue: PriceComboDealCategoryDto.empty)
      PriceComboDealCategoryDto category});

  $PriceComboDealCategoryDtoCopyWith<$Res> get category;
}

/// @nodoc
class _$PriceComboDealDtoCopyWithImpl<$Res, $Val extends PriceComboDealDto>
    implements $PriceComboDealDtoCopyWith<$Res> {
  _$PriceComboDealDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEligible = null,
    Object? flexibleGroup = null,
    Object? salesDeal = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      isEligible: null == isEligible
          ? _value.isEligible
          : isEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      flexibleGroup: null == flexibleGroup
          ? _value.flexibleGroup
          : flexibleGroup // ignore: cast_nullable_to_non_nullable
              as String,
      salesDeal: null == salesDeal
          ? _value.salesDeal
          : salesDeal // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as PriceComboDealCategoryDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceComboDealCategoryDtoCopyWith<$Res> get category {
    return $PriceComboDealCategoryDtoCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PriceComboDealDtoCopyWith<$Res>
    implements $PriceComboDealDtoCopyWith<$Res> {
  factory _$$_PriceComboDealDtoCopyWith(_$_PriceComboDealDto value,
          $Res Function(_$_PriceComboDealDto) then) =
      __$$_PriceComboDealDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Eligible', defaultValue: false)
      @HiveField(0, defaultValue: false)
      bool isEligible,
      @JsonKey(name: 'FlexibleGroup', defaultValue: '')
      @HiveField(1, defaultValue: '')
      String flexibleGroup,
      @JsonKey(name: 'SalesDeal', defaultValue: '')
      @HiveField(2, defaultValue: '')
      String salesDeal,
      @JsonKey(name: 'Category')
      @HiveField(3, defaultValue: PriceComboDealCategoryDto.empty)
      PriceComboDealCategoryDto category});

  @override
  $PriceComboDealCategoryDtoCopyWith<$Res> get category;
}

/// @nodoc
class __$$_PriceComboDealDtoCopyWithImpl<$Res>
    extends _$PriceComboDealDtoCopyWithImpl<$Res, _$_PriceComboDealDto>
    implements _$$_PriceComboDealDtoCopyWith<$Res> {
  __$$_PriceComboDealDtoCopyWithImpl(
      _$_PriceComboDealDto _value, $Res Function(_$_PriceComboDealDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEligible = null,
    Object? flexibleGroup = null,
    Object? salesDeal = null,
    Object? category = null,
  }) {
    return _then(_$_PriceComboDealDto(
      isEligible: null == isEligible
          ? _value.isEligible
          : isEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      flexibleGroup: null == flexibleGroup
          ? _value.flexibleGroup
          : flexibleGroup // ignore: cast_nullable_to_non_nullable
              as String,
      salesDeal: null == salesDeal
          ? _value.salesDeal
          : salesDeal // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as PriceComboDealCategoryDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 17, adapterName: 'PriceComboDealDtoAdapter')
class _$_PriceComboDealDto extends _PriceComboDealDto {
  const _$_PriceComboDealDto(
      {@JsonKey(name: 'Eligible', defaultValue: false)
      @HiveField(0, defaultValue: false)
      required this.isEligible,
      @JsonKey(name: 'FlexibleGroup', defaultValue: '')
      @HiveField(1, defaultValue: '')
      required this.flexibleGroup,
      @JsonKey(name: 'SalesDeal', defaultValue: '')
      @HiveField(2, defaultValue: '')
      required this.salesDeal,
      @JsonKey(name: 'Category')
      @HiveField(3, defaultValue: PriceComboDealCategoryDto.empty)
      this.category = PriceComboDealCategoryDto.empty})
      : super._();

  factory _$_PriceComboDealDto.fromJson(Map<String, dynamic> json) =>
      _$$_PriceComboDealDtoFromJson(json);

  @override
  @JsonKey(name: 'Eligible', defaultValue: false)
  @HiveField(0, defaultValue: false)
  final bool isEligible;
  @override
  @JsonKey(name: 'FlexibleGroup', defaultValue: '')
  @HiveField(1, defaultValue: '')
  final String flexibleGroup;
  @override
  @JsonKey(name: 'SalesDeal', defaultValue: '')
  @HiveField(2, defaultValue: '')
  final String salesDeal;
  @override
  @JsonKey(name: 'Category')
  @HiveField(3, defaultValue: PriceComboDealCategoryDto.empty)
  final PriceComboDealCategoryDto category;

  @override
  String toString() {
    return 'PriceComboDealDto(isEligible: $isEligible, flexibleGroup: $flexibleGroup, salesDeal: $salesDeal, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceComboDealDto &&
            (identical(other.isEligible, isEligible) ||
                other.isEligible == isEligible) &&
            (identical(other.flexibleGroup, flexibleGroup) ||
                other.flexibleGroup == flexibleGroup) &&
            (identical(other.salesDeal, salesDeal) ||
                other.salesDeal == salesDeal) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isEligible, flexibleGroup, salesDeal, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PriceComboDealDtoCopyWith<_$_PriceComboDealDto> get copyWith =>
      __$$_PriceComboDealDtoCopyWithImpl<_$_PriceComboDealDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PriceComboDealDtoToJson(
      this,
    );
  }
}

abstract class _PriceComboDealDto extends PriceComboDealDto {
  const factory _PriceComboDealDto(
      {@JsonKey(name: 'Eligible', defaultValue: false)
      @HiveField(0, defaultValue: false)
      required final bool isEligible,
      @JsonKey(name: 'FlexibleGroup', defaultValue: '')
      @HiveField(1, defaultValue: '')
      required final String flexibleGroup,
      @JsonKey(name: 'SalesDeal', defaultValue: '')
      @HiveField(2, defaultValue: '')
      required final String salesDeal,
      @JsonKey(name: 'Category')
      @HiveField(3, defaultValue: PriceComboDealCategoryDto.empty)
      final PriceComboDealCategoryDto category}) = _$_PriceComboDealDto;
  const _PriceComboDealDto._() : super._();

  factory _PriceComboDealDto.fromJson(Map<String, dynamic> json) =
      _$_PriceComboDealDto.fromJson;

  @override
  @JsonKey(name: 'Eligible', defaultValue: false)
  @HiveField(0, defaultValue: false)
  bool get isEligible;
  @override
  @JsonKey(name: 'FlexibleGroup', defaultValue: '')
  @HiveField(1, defaultValue: '')
  String get flexibleGroup;
  @override
  @JsonKey(name: 'SalesDeal', defaultValue: '')
  @HiveField(2, defaultValue: '')
  String get salesDeal;
  @override
  @JsonKey(name: 'Category')
  @HiveField(3, defaultValue: PriceComboDealCategoryDto.empty)
  PriceComboDealCategoryDto get category;
  @override
  @JsonKey(ignore: true)
  _$$_PriceComboDealDtoCopyWith<_$_PriceComboDealDto> get copyWith =>
      throw _privateConstructorUsedError;
}

PriceComboDealCategoryDto _$PriceComboDealCategoryDtoFromJson(
    Map<String, dynamic> json) {
  return _PriceComboDealCategoryDto.fromJson(json);
}

/// @nodoc
mixin _$PriceComboDealCategoryDto {
  @JsonKey(name: 'Type', defaultValue: '')
  @HiveField(0, defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'Value', defaultValue: [])
  @HiveField(1, defaultValue: [])
  List<String> get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceComboDealCategoryDtoCopyWith<PriceComboDealCategoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceComboDealCategoryDtoCopyWith<$Res> {
  factory $PriceComboDealCategoryDtoCopyWith(PriceComboDealCategoryDto value,
          $Res Function(PriceComboDealCategoryDto) then) =
      _$PriceComboDealCategoryDtoCopyWithImpl<$Res, PriceComboDealCategoryDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Type', defaultValue: '')
      @HiveField(0, defaultValue: '')
      String type,
      @JsonKey(name: 'Value', defaultValue: [])
      @HiveField(1, defaultValue: [])
      List<String> value});
}

/// @nodoc
class _$PriceComboDealCategoryDtoCopyWithImpl<$Res,
        $Val extends PriceComboDealCategoryDto>
    implements $PriceComboDealCategoryDtoCopyWith<$Res> {
  _$PriceComboDealCategoryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PriceComboDealCategoryDtoCopyWith<$Res>
    implements $PriceComboDealCategoryDtoCopyWith<$Res> {
  factory _$$_PriceComboDealCategoryDtoCopyWith(
          _$_PriceComboDealCategoryDto value,
          $Res Function(_$_PriceComboDealCategoryDto) then) =
      __$$_PriceComboDealCategoryDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Type', defaultValue: '')
      @HiveField(0, defaultValue: '')
      String type,
      @JsonKey(name: 'Value', defaultValue: [])
      @HiveField(1, defaultValue: [])
      List<String> value});
}

/// @nodoc
class __$$_PriceComboDealCategoryDtoCopyWithImpl<$Res>
    extends _$PriceComboDealCategoryDtoCopyWithImpl<$Res,
        _$_PriceComboDealCategoryDto>
    implements _$$_PriceComboDealCategoryDtoCopyWith<$Res> {
  __$$_PriceComboDealCategoryDtoCopyWithImpl(
      _$_PriceComboDealCategoryDto _value,
      $Res Function(_$_PriceComboDealCategoryDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? value = null,
  }) {
    return _then(_$_PriceComboDealCategoryDto(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value._value
          : value // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 23, adapterName: 'PriceComboDealCategoryDtoAdapter')
class _$_PriceComboDealCategoryDto extends _PriceComboDealCategoryDto {
  const _$_PriceComboDealCategoryDto(
      {@JsonKey(name: 'Type', defaultValue: '')
      @HiveField(0, defaultValue: '')
      required this.type,
      @JsonKey(name: 'Value', defaultValue: [])
      @HiveField(1, defaultValue: [])
      required final List<String> value})
      : _value = value,
        super._();

  factory _$_PriceComboDealCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$$_PriceComboDealCategoryDtoFromJson(json);

  @override
  @JsonKey(name: 'Type', defaultValue: '')
  @HiveField(0, defaultValue: '')
  final String type;
  final List<String> _value;
  @override
  @JsonKey(name: 'Value', defaultValue: [])
  @HiveField(1, defaultValue: [])
  List<String> get value {
    if (_value is EqualUnmodifiableListView) return _value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_value);
  }

  @override
  String toString() {
    return 'PriceComboDealCategoryDto(type: $type, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceComboDealCategoryDto &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._value, _value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(_value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PriceComboDealCategoryDtoCopyWith<_$_PriceComboDealCategoryDto>
      get copyWith => __$$_PriceComboDealCategoryDtoCopyWithImpl<
          _$_PriceComboDealCategoryDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PriceComboDealCategoryDtoToJson(
      this,
    );
  }
}

abstract class _PriceComboDealCategoryDto extends PriceComboDealCategoryDto {
  const factory _PriceComboDealCategoryDto(
      {@JsonKey(name: 'Type', defaultValue: '')
      @HiveField(0, defaultValue: '')
      required final String type,
      @JsonKey(name: 'Value', defaultValue: [])
      @HiveField(1, defaultValue: [])
      required final List<String> value}) = _$_PriceComboDealCategoryDto;
  const _PriceComboDealCategoryDto._() : super._();

  factory _PriceComboDealCategoryDto.fromJson(Map<String, dynamic> json) =
      _$_PriceComboDealCategoryDto.fromJson;

  @override
  @JsonKey(name: 'Type', defaultValue: '')
  @HiveField(0, defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'Value', defaultValue: [])
  @HiveField(1, defaultValue: [])
  List<String> get value;
  @override
  @JsonKey(ignore: true)
  _$$_PriceComboDealCategoryDtoCopyWith<_$_PriceComboDealCategoryDto>
      get copyWith => throw _privateConstructorUsedError;
}
