// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'combo_deal_material_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ComboDealMaterialSetDto _$ComboDealMaterialSetDtoFromJson(
    Map<String, dynamic> json) {
  return _ComboDealMaterialSetDto.fromJson(json);
}

/// @nodoc
mixin _$ComboDealMaterialSetDto {
  @JsonKey(name: 'setNo', defaultValue: '')
  String get setNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'materials', defaultValue: [])
  List<ComboDealMaterialDto> get materials =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComboDealMaterialSetDtoCopyWith<ComboDealMaterialSetDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComboDealMaterialSetDtoCopyWith<$Res> {
  factory $ComboDealMaterialSetDtoCopyWith(ComboDealMaterialSetDto value,
          $Res Function(ComboDealMaterialSetDto) then) =
      _$ComboDealMaterialSetDtoCopyWithImpl<$Res, ComboDealMaterialSetDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'setNo', defaultValue: '') String setNo,
      @JsonKey(name: 'materials', defaultValue: [])
      List<ComboDealMaterialDto> materials});
}

/// @nodoc
class _$ComboDealMaterialSetDtoCopyWithImpl<$Res,
        $Val extends ComboDealMaterialSetDto>
    implements $ComboDealMaterialSetDtoCopyWith<$Res> {
  _$ComboDealMaterialSetDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? setNo = null,
    Object? materials = null,
  }) {
    return _then(_value.copyWith(
      setNo: null == setNo
          ? _value.setNo
          : setNo // ignore: cast_nullable_to_non_nullable
              as String,
      materials: null == materials
          ? _value.materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<ComboDealMaterialDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ComboDealMaterialSetDtoCopyWith<$Res>
    implements $ComboDealMaterialSetDtoCopyWith<$Res> {
  factory _$$_ComboDealMaterialSetDtoCopyWith(_$_ComboDealMaterialSetDto value,
          $Res Function(_$_ComboDealMaterialSetDto) then) =
      __$$_ComboDealMaterialSetDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'setNo', defaultValue: '') String setNo,
      @JsonKey(name: 'materials', defaultValue: [])
      List<ComboDealMaterialDto> materials});
}

/// @nodoc
class __$$_ComboDealMaterialSetDtoCopyWithImpl<$Res>
    extends _$ComboDealMaterialSetDtoCopyWithImpl<$Res,
        _$_ComboDealMaterialSetDto>
    implements _$$_ComboDealMaterialSetDtoCopyWith<$Res> {
  __$$_ComboDealMaterialSetDtoCopyWithImpl(_$_ComboDealMaterialSetDto _value,
      $Res Function(_$_ComboDealMaterialSetDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? setNo = null,
    Object? materials = null,
  }) {
    return _then(_$_ComboDealMaterialSetDto(
      setNo: null == setNo
          ? _value.setNo
          : setNo // ignore: cast_nullable_to_non_nullable
              as String,
      materials: null == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<ComboDealMaterialDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ComboDealMaterialSetDto extends _ComboDealMaterialSetDto {
  const _$_ComboDealMaterialSetDto(
      {@JsonKey(name: 'setNo', defaultValue: '') required this.setNo,
      @JsonKey(name: 'materials', defaultValue: [])
      required final List<ComboDealMaterialDto> materials})
      : _materials = materials,
        super._();

  factory _$_ComboDealMaterialSetDto.fromJson(Map<String, dynamic> json) =>
      _$$_ComboDealMaterialSetDtoFromJson(json);

  @override
  @JsonKey(name: 'setNo', defaultValue: '')
  final String setNo;
  final List<ComboDealMaterialDto> _materials;
  @override
  @JsonKey(name: 'materials', defaultValue: [])
  List<ComboDealMaterialDto> get materials {
    if (_materials is EqualUnmodifiableListView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materials);
  }

  @override
  String toString() {
    return 'ComboDealMaterialSetDto(setNo: $setNo, materials: $materials)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ComboDealMaterialSetDto &&
            (identical(other.setNo, setNo) || other.setNo == setNo) &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, setNo, const DeepCollectionEquality().hash(_materials));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ComboDealMaterialSetDtoCopyWith<_$_ComboDealMaterialSetDto>
      get copyWith =>
          __$$_ComboDealMaterialSetDtoCopyWithImpl<_$_ComboDealMaterialSetDto>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ComboDealMaterialSetDtoToJson(
      this,
    );
  }
}

abstract class _ComboDealMaterialSetDto extends ComboDealMaterialSetDto {
  const factory _ComboDealMaterialSetDto(
      {@JsonKey(name: 'setNo', defaultValue: '') required final String setNo,
      @JsonKey(name: 'materials', defaultValue: [])
      required final List<ComboDealMaterialDto>
          materials}) = _$_ComboDealMaterialSetDto;
  const _ComboDealMaterialSetDto._() : super._();

  factory _ComboDealMaterialSetDto.fromJson(Map<String, dynamic> json) =
      _$_ComboDealMaterialSetDto.fromJson;

  @override
  @JsonKey(name: 'setNo', defaultValue: '')
  String get setNo;
  @override
  @JsonKey(name: 'materials', defaultValue: [])
  List<ComboDealMaterialDto> get materials;
  @override
  @JsonKey(ignore: true)
  _$$_ComboDealMaterialSetDtoCopyWith<_$_ComboDealMaterialSetDto>
      get copyWith => throw _privateConstructorUsedError;
}

ComboDealMaterialDto _$ComboDealMaterialDtoFromJson(Map<String, dynamic> json) {
  return _ComboDealMaterialDto.fromJson(json);
}

/// @nodoc
mixin _$ComboDealMaterialDto {
  @StringToIntConverter()
  @JsonKey(name: 'minQty', defaultValue: 0)
  int get minQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @StringToDoubleConverter()
  @JsonKey(name: 'rate', defaultValue: 0)
  double get rate => throw _privateConstructorUsedError;
  @JsonKey(name: 'type', defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'conditionNumber', defaultValue: '')
  String get conditionNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'mandatory', defaultValue: false)
  bool get mandatory => throw _privateConstructorUsedError;
  @JsonKey(name: 'suffix', defaultValue: '')
  String get suffix => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComboDealMaterialDtoCopyWith<ComboDealMaterialDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComboDealMaterialDtoCopyWith<$Res> {
  factory $ComboDealMaterialDtoCopyWith(ComboDealMaterialDto value,
          $Res Function(ComboDealMaterialDto) then) =
      _$ComboDealMaterialDtoCopyWithImpl<$Res, ComboDealMaterialDto>;
  @useResult
  $Res call(
      {@StringToIntConverter()
      @JsonKey(name: 'minQty', defaultValue: 0)
      int minQty,
      @JsonKey(name: 'materialNumber', defaultValue: '') String materialNumber,
      @StringToDoubleConverter()
      @JsonKey(name: 'rate', defaultValue: 0)
      double rate,
      @JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'conditionNumber', defaultValue: '')
      String conditionNumber,
      @JsonKey(name: 'mandatory', defaultValue: false) bool mandatory,
      @JsonKey(name: 'suffix', defaultValue: '') String suffix});
}

/// @nodoc
class _$ComboDealMaterialDtoCopyWithImpl<$Res,
        $Val extends ComboDealMaterialDto>
    implements $ComboDealMaterialDtoCopyWith<$Res> {
  _$ComboDealMaterialDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minQty = null,
    Object? materialNumber = null,
    Object? rate = null,
    Object? type = null,
    Object? conditionNumber = null,
    Object? mandatory = null,
    Object? suffix = null,
  }) {
    return _then(_value.copyWith(
      minQty: null == minQty
          ? _value.minQty
          : minQty // ignore: cast_nullable_to_non_nullable
              as int,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      conditionNumber: null == conditionNumber
          ? _value.conditionNumber
          : conditionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      mandatory: null == mandatory
          ? _value.mandatory
          : mandatory // ignore: cast_nullable_to_non_nullable
              as bool,
      suffix: null == suffix
          ? _value.suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ComboDealMaterialDtoCopyWith<$Res>
    implements $ComboDealMaterialDtoCopyWith<$Res> {
  factory _$$_ComboDealMaterialDtoCopyWith(_$_ComboDealMaterialDto value,
          $Res Function(_$_ComboDealMaterialDto) then) =
      __$$_ComboDealMaterialDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@StringToIntConverter()
      @JsonKey(name: 'minQty', defaultValue: 0)
      int minQty,
      @JsonKey(name: 'materialNumber', defaultValue: '') String materialNumber,
      @StringToDoubleConverter()
      @JsonKey(name: 'rate', defaultValue: 0)
      double rate,
      @JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'conditionNumber', defaultValue: '')
      String conditionNumber,
      @JsonKey(name: 'mandatory', defaultValue: false) bool mandatory,
      @JsonKey(name: 'suffix', defaultValue: '') String suffix});
}

/// @nodoc
class __$$_ComboDealMaterialDtoCopyWithImpl<$Res>
    extends _$ComboDealMaterialDtoCopyWithImpl<$Res, _$_ComboDealMaterialDto>
    implements _$$_ComboDealMaterialDtoCopyWith<$Res> {
  __$$_ComboDealMaterialDtoCopyWithImpl(_$_ComboDealMaterialDto _value,
      $Res Function(_$_ComboDealMaterialDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minQty = null,
    Object? materialNumber = null,
    Object? rate = null,
    Object? type = null,
    Object? conditionNumber = null,
    Object? mandatory = null,
    Object? suffix = null,
  }) {
    return _then(_$_ComboDealMaterialDto(
      minQty: null == minQty
          ? _value.minQty
          : minQty // ignore: cast_nullable_to_non_nullable
              as int,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      conditionNumber: null == conditionNumber
          ? _value.conditionNumber
          : conditionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      mandatory: null == mandatory
          ? _value.mandatory
          : mandatory // ignore: cast_nullable_to_non_nullable
              as bool,
      suffix: null == suffix
          ? _value.suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ComboDealMaterialDto extends _ComboDealMaterialDto {
  const _$_ComboDealMaterialDto(
      {@StringToIntConverter()
      @JsonKey(name: 'minQty', defaultValue: 0)
      required this.minQty,
      @JsonKey(name: 'materialNumber', defaultValue: '')
      required this.materialNumber,
      @StringToDoubleConverter()
      @JsonKey(name: 'rate', defaultValue: 0)
      required this.rate,
      @JsonKey(name: 'type', defaultValue: '') required this.type,
      @JsonKey(name: 'conditionNumber', defaultValue: '')
      required this.conditionNumber,
      @JsonKey(name: 'mandatory', defaultValue: false) required this.mandatory,
      @JsonKey(name: 'suffix', defaultValue: '') required this.suffix})
      : super._();

  factory _$_ComboDealMaterialDto.fromJson(Map<String, dynamic> json) =>
      _$$_ComboDealMaterialDtoFromJson(json);

  @override
  @StringToIntConverter()
  @JsonKey(name: 'minQty', defaultValue: 0)
  final int minQty;
  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  final String materialNumber;
  @override
  @StringToDoubleConverter()
  @JsonKey(name: 'rate', defaultValue: 0)
  final double rate;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  final String type;
  @override
  @JsonKey(name: 'conditionNumber', defaultValue: '')
  final String conditionNumber;
  @override
  @JsonKey(name: 'mandatory', defaultValue: false)
  final bool mandatory;
  @override
  @JsonKey(name: 'suffix', defaultValue: '')
  final String suffix;

  @override
  String toString() {
    return 'ComboDealMaterialDto(minQty: $minQty, materialNumber: $materialNumber, rate: $rate, type: $type, conditionNumber: $conditionNumber, mandatory: $mandatory, suffix: $suffix)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ComboDealMaterialDto &&
            (identical(other.minQty, minQty) || other.minQty == minQty) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.conditionNumber, conditionNumber) ||
                other.conditionNumber == conditionNumber) &&
            (identical(other.mandatory, mandatory) ||
                other.mandatory == mandatory) &&
            (identical(other.suffix, suffix) || other.suffix == suffix));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, minQty, materialNumber, rate,
      type, conditionNumber, mandatory, suffix);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ComboDealMaterialDtoCopyWith<_$_ComboDealMaterialDto> get copyWith =>
      __$$_ComboDealMaterialDtoCopyWithImpl<_$_ComboDealMaterialDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ComboDealMaterialDtoToJson(
      this,
    );
  }
}

abstract class _ComboDealMaterialDto extends ComboDealMaterialDto {
  const factory _ComboDealMaterialDto(
      {@StringToIntConverter()
      @JsonKey(name: 'minQty', defaultValue: 0)
      required final int minQty,
      @JsonKey(name: 'materialNumber', defaultValue: '')
      required final String materialNumber,
      @StringToDoubleConverter()
      @JsonKey(name: 'rate', defaultValue: 0)
      required final double rate,
      @JsonKey(name: 'type', defaultValue: '') required final String type,
      @JsonKey(name: 'conditionNumber', defaultValue: '')
      required final String conditionNumber,
      @JsonKey(name: 'mandatory', defaultValue: false)
      required final bool mandatory,
      @JsonKey(name: 'suffix', defaultValue: '')
      required final String suffix}) = _$_ComboDealMaterialDto;
  const _ComboDealMaterialDto._() : super._();

  factory _ComboDealMaterialDto.fromJson(Map<String, dynamic> json) =
      _$_ComboDealMaterialDto.fromJson;

  @override
  @StringToIntConverter()
  @JsonKey(name: 'minQty', defaultValue: 0)
  int get minQty;
  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber;
  @override
  @StringToDoubleConverter()
  @JsonKey(name: 'rate', defaultValue: 0)
  double get rate;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'conditionNumber', defaultValue: '')
  String get conditionNumber;
  @override
  @JsonKey(name: 'mandatory', defaultValue: false)
  bool get mandatory;
  @override
  @JsonKey(name: 'suffix', defaultValue: '')
  String get suffix;
  @override
  @JsonKey(ignore: true)
  _$$_ComboDealMaterialDtoCopyWith<_$_ComboDealMaterialDto> get copyWith =>
      throw _privateConstructorUsedError;
}
