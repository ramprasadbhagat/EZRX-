// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_restriction_list_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserRestrictionListDto _$UserRestrictionListDtoFromJson(
    Map<String, dynamic> json) {
  return _UserRestrictionListDto.fromJson(json);
}

/// @nodoc
mixin _$UserRestrictionListDto {
  @JsonKey(name: 'rawMetaData')
  UserRestrictionListRawMetaDataDto get rawMetaData =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRestrictionListDtoCopyWith<UserRestrictionListDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRestrictionListDtoCopyWith<$Res> {
  factory $UserRestrictionListDtoCopyWith(UserRestrictionListDto value,
          $Res Function(UserRestrictionListDto) then) =
      _$UserRestrictionListDtoCopyWithImpl<$Res, UserRestrictionListDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'rawMetaData')
          UserRestrictionListRawMetaDataDto rawMetaData});

  $UserRestrictionListRawMetaDataDtoCopyWith<$Res> get rawMetaData;
}

/// @nodoc
class _$UserRestrictionListDtoCopyWithImpl<$Res,
        $Val extends UserRestrictionListDto>
    implements $UserRestrictionListDtoCopyWith<$Res> {
  _$UserRestrictionListDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawMetaData = null,
  }) {
    return _then(_value.copyWith(
      rawMetaData: null == rawMetaData
          ? _value.rawMetaData
          : rawMetaData // ignore: cast_nullable_to_non_nullable
              as UserRestrictionListRawMetaDataDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserRestrictionListRawMetaDataDtoCopyWith<$Res> get rawMetaData {
    return $UserRestrictionListRawMetaDataDtoCopyWith<$Res>(_value.rawMetaData,
        (value) {
      return _then(_value.copyWith(rawMetaData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserRestrictionListDtoCopyWith<$Res>
    implements $UserRestrictionListDtoCopyWith<$Res> {
  factory _$$_UserRestrictionListDtoCopyWith(_$_UserRestrictionListDto value,
          $Res Function(_$_UserRestrictionListDto) then) =
      __$$_UserRestrictionListDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'rawMetaData')
          UserRestrictionListRawMetaDataDto rawMetaData});

  @override
  $UserRestrictionListRawMetaDataDtoCopyWith<$Res> get rawMetaData;
}

/// @nodoc
class __$$_UserRestrictionListDtoCopyWithImpl<$Res>
    extends _$UserRestrictionListDtoCopyWithImpl<$Res,
        _$_UserRestrictionListDto>
    implements _$$_UserRestrictionListDtoCopyWith<$Res> {
  __$$_UserRestrictionListDtoCopyWithImpl(_$_UserRestrictionListDto _value,
      $Res Function(_$_UserRestrictionListDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawMetaData = null,
  }) {
    return _then(_$_UserRestrictionListDto(
      rawMetaData: null == rawMetaData
          ? _value.rawMetaData
          : rawMetaData // ignore: cast_nullable_to_non_nullable
              as UserRestrictionListRawMetaDataDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserRestrictionListDto extends _UserRestrictionListDto {
  _$_UserRestrictionListDto(
      {@JsonKey(name: 'rawMetaData') required this.rawMetaData})
      : super._();

  factory _$_UserRestrictionListDto.fromJson(Map<String, dynamic> json) =>
      _$$_UserRestrictionListDtoFromJson(json);

  @override
  @JsonKey(name: 'rawMetaData')
  final UserRestrictionListRawMetaDataDto rawMetaData;

  @override
  String toString() {
    return 'UserRestrictionListDto(rawMetaData: $rawMetaData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRestrictionListDto &&
            (identical(other.rawMetaData, rawMetaData) ||
                other.rawMetaData == rawMetaData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rawMetaData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserRestrictionListDtoCopyWith<_$_UserRestrictionListDto> get copyWith =>
      __$$_UserRestrictionListDtoCopyWithImpl<_$_UserRestrictionListDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserRestrictionListDtoToJson(
      this,
    );
  }
}

abstract class _UserRestrictionListDto extends UserRestrictionListDto {
  factory _UserRestrictionListDto(
          {@JsonKey(name: 'rawMetaData')
              required final UserRestrictionListRawMetaDataDto rawMetaData}) =
      _$_UserRestrictionListDto;
  _UserRestrictionListDto._() : super._();

  factory _UserRestrictionListDto.fromJson(Map<String, dynamic> json) =
      _$_UserRestrictionListDto.fromJson;

  @override
  @JsonKey(name: 'rawMetaData')
  UserRestrictionListRawMetaDataDto get rawMetaData;
  @override
  @JsonKey(ignore: true)
  _$$_UserRestrictionListDtoCopyWith<_$_UserRestrictionListDto> get copyWith =>
      throw _privateConstructorUsedError;
}
