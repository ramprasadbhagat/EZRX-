// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mp_remote_config_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MPRemoteConfigDto _$MPRemoteConfigDtoFromJson(Map<String, dynamic> json) {
  return _MPRemoteConfigDto.fromJson(json);
}

/// @nodoc
mixin _$MPRemoteConfigDto {
  @JsonKey(name: 'marketplaceConfig')
  MPRemoteConfigValueDto get marketplaceConfig =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MPRemoteConfigDtoCopyWith<MPRemoteConfigDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MPRemoteConfigDtoCopyWith<$Res> {
  factory $MPRemoteConfigDtoCopyWith(
          MPRemoteConfigDto value, $Res Function(MPRemoteConfigDto) then) =
      _$MPRemoteConfigDtoCopyWithImpl<$Res, MPRemoteConfigDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'marketplaceConfig')
      MPRemoteConfigValueDto marketplaceConfig});

  $MPRemoteConfigValueDtoCopyWith<$Res> get marketplaceConfig;
}

/// @nodoc
class _$MPRemoteConfigDtoCopyWithImpl<$Res, $Val extends MPRemoteConfigDto>
    implements $MPRemoteConfigDtoCopyWith<$Res> {
  _$MPRemoteConfigDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marketplaceConfig = null,
  }) {
    return _then(_value.copyWith(
      marketplaceConfig: null == marketplaceConfig
          ? _value.marketplaceConfig
          : marketplaceConfig // ignore: cast_nullable_to_non_nullable
              as MPRemoteConfigValueDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MPRemoteConfigValueDtoCopyWith<$Res> get marketplaceConfig {
    return $MPRemoteConfigValueDtoCopyWith<$Res>(_value.marketplaceConfig,
        (value) {
      return _then(_value.copyWith(marketplaceConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MPRemoteConfigDtoCopyWith<$Res>
    implements $MPRemoteConfigDtoCopyWith<$Res> {
  factory _$$_MPRemoteConfigDtoCopyWith(_$_MPRemoteConfigDto value,
          $Res Function(_$_MPRemoteConfigDto) then) =
      __$$_MPRemoteConfigDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'marketplaceConfig')
      MPRemoteConfigValueDto marketplaceConfig});

  @override
  $MPRemoteConfigValueDtoCopyWith<$Res> get marketplaceConfig;
}

/// @nodoc
class __$$_MPRemoteConfigDtoCopyWithImpl<$Res>
    extends _$MPRemoteConfigDtoCopyWithImpl<$Res, _$_MPRemoteConfigDto>
    implements _$$_MPRemoteConfigDtoCopyWith<$Res> {
  __$$_MPRemoteConfigDtoCopyWithImpl(
      _$_MPRemoteConfigDto _value, $Res Function(_$_MPRemoteConfigDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marketplaceConfig = null,
  }) {
    return _then(_$_MPRemoteConfigDto(
      marketplaceConfig: null == marketplaceConfig
          ? _value.marketplaceConfig
          : marketplaceConfig // ignore: cast_nullable_to_non_nullable
              as MPRemoteConfigValueDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MPRemoteConfigDto extends _MPRemoteConfigDto {
  const _$_MPRemoteConfigDto(
      {@JsonKey(name: 'marketplaceConfig') required this.marketplaceConfig})
      : super._();

  factory _$_MPRemoteConfigDto.fromJson(Map<String, dynamic> json) =>
      _$$_MPRemoteConfigDtoFromJson(json);

  @override
  @JsonKey(name: 'marketplaceConfig')
  final MPRemoteConfigValueDto marketplaceConfig;

  @override
  String toString() {
    return 'MPRemoteConfigDto(marketplaceConfig: $marketplaceConfig)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MPRemoteConfigDto &&
            (identical(other.marketplaceConfig, marketplaceConfig) ||
                other.marketplaceConfig == marketplaceConfig));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, marketplaceConfig);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MPRemoteConfigDtoCopyWith<_$_MPRemoteConfigDto> get copyWith =>
      __$$_MPRemoteConfigDtoCopyWithImpl<_$_MPRemoteConfigDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MPRemoteConfigDtoToJson(
      this,
    );
  }
}

abstract class _MPRemoteConfigDto extends MPRemoteConfigDto {
  const factory _MPRemoteConfigDto(
          {@JsonKey(name: 'marketplaceConfig')
          required final MPRemoteConfigValueDto marketplaceConfig}) =
      _$_MPRemoteConfigDto;
  const _MPRemoteConfigDto._() : super._();

  factory _MPRemoteConfigDto.fromJson(Map<String, dynamic> json) =
      _$_MPRemoteConfigDto.fromJson;

  @override
  @JsonKey(name: 'marketplaceConfig')
  MPRemoteConfigValueDto get marketplaceConfig;
  @override
  @JsonKey(ignore: true)
  _$$_MPRemoteConfigDtoCopyWith<_$_MPRemoteConfigDto> get copyWith =>
      throw _privateConstructorUsedError;
}

MPRemoteConfigValueDto _$MPRemoteConfigValueDtoFromJson(
    Map<String, dynamic> json) {
  return _MPRemoteConfigValueDto.fromJson(json);
}

/// @nodoc
mixin _$MPRemoteConfigValueDto {
  @JsonKey(name: 'whitelist')
  List<String> get whiteList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MPRemoteConfigValueDtoCopyWith<MPRemoteConfigValueDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MPRemoteConfigValueDtoCopyWith<$Res> {
  factory $MPRemoteConfigValueDtoCopyWith(MPRemoteConfigValueDto value,
          $Res Function(MPRemoteConfigValueDto) then) =
      _$MPRemoteConfigValueDtoCopyWithImpl<$Res, MPRemoteConfigValueDto>;
  @useResult
  $Res call({@JsonKey(name: 'whitelist') List<String> whiteList});
}

/// @nodoc
class _$MPRemoteConfigValueDtoCopyWithImpl<$Res,
        $Val extends MPRemoteConfigValueDto>
    implements $MPRemoteConfigValueDtoCopyWith<$Res> {
  _$MPRemoteConfigValueDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? whiteList = null,
  }) {
    return _then(_value.copyWith(
      whiteList: null == whiteList
          ? _value.whiteList
          : whiteList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MPRemoteConfigValueDtoCopyWith<$Res>
    implements $MPRemoteConfigValueDtoCopyWith<$Res> {
  factory _$$_MPRemoteConfigValueDtoCopyWith(_$_MPRemoteConfigValueDto value,
          $Res Function(_$_MPRemoteConfigValueDto) then) =
      __$$_MPRemoteConfigValueDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'whitelist') List<String> whiteList});
}

/// @nodoc
class __$$_MPRemoteConfigValueDtoCopyWithImpl<$Res>
    extends _$MPRemoteConfigValueDtoCopyWithImpl<$Res,
        _$_MPRemoteConfigValueDto>
    implements _$$_MPRemoteConfigValueDtoCopyWith<$Res> {
  __$$_MPRemoteConfigValueDtoCopyWithImpl(_$_MPRemoteConfigValueDto _value,
      $Res Function(_$_MPRemoteConfigValueDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? whiteList = null,
  }) {
    return _then(_$_MPRemoteConfigValueDto(
      whiteList: null == whiteList
          ? _value._whiteList
          : whiteList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MPRemoteConfigValueDto extends _MPRemoteConfigValueDto {
  const _$_MPRemoteConfigValueDto(
      {@JsonKey(name: 'whitelist') required final List<String> whiteList})
      : _whiteList = whiteList,
        super._();

  factory _$_MPRemoteConfigValueDto.fromJson(Map<String, dynamic> json) =>
      _$$_MPRemoteConfigValueDtoFromJson(json);

  final List<String> _whiteList;
  @override
  @JsonKey(name: 'whitelist')
  List<String> get whiteList {
    if (_whiteList is EqualUnmodifiableListView) return _whiteList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_whiteList);
  }

  @override
  String toString() {
    return 'MPRemoteConfigValueDto(whiteList: $whiteList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MPRemoteConfigValueDto &&
            const DeepCollectionEquality()
                .equals(other._whiteList, _whiteList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_whiteList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MPRemoteConfigValueDtoCopyWith<_$_MPRemoteConfigValueDto> get copyWith =>
      __$$_MPRemoteConfigValueDtoCopyWithImpl<_$_MPRemoteConfigValueDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MPRemoteConfigValueDtoToJson(
      this,
    );
  }
}

abstract class _MPRemoteConfigValueDto extends MPRemoteConfigValueDto {
  const factory _MPRemoteConfigValueDto(
          {@JsonKey(name: 'whitelist') required final List<String> whiteList}) =
      _$_MPRemoteConfigValueDto;
  const _MPRemoteConfigValueDto._() : super._();

  factory _MPRemoteConfigValueDto.fromJson(Map<String, dynamic> json) =
      _$_MPRemoteConfigValueDto.fromJson;

  @override
  @JsonKey(name: 'whitelist')
  List<String> get whiteList;
  @override
  @JsonKey(ignore: true)
  _$$_MPRemoteConfigValueDtoCopyWith<_$_MPRemoteConfigValueDto> get copyWith =>
      throw _privateConstructorUsedError;
}
