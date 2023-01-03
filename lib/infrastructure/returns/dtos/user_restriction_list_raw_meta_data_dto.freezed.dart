// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_restriction_list_raw_meta_data_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserRestrictionListRawMetaDataDto _$UserRestrictionListRawMetaDataDtoFromJson(
    Map<String, dynamic> json) {
  return _UserRestrictionRawMetaDataDto.fromJson(json);
}

/// @nodoc
mixin _$UserRestrictionListRawMetaDataDto {
  List<String> get usernames => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRestrictionListRawMetaDataDtoCopyWith<UserRestrictionListRawMetaDataDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRestrictionListRawMetaDataDtoCopyWith<$Res> {
  factory $UserRestrictionListRawMetaDataDtoCopyWith(
          UserRestrictionListRawMetaDataDto value,
          $Res Function(UserRestrictionListRawMetaDataDto) then) =
      _$UserRestrictionListRawMetaDataDtoCopyWithImpl<$Res,
          UserRestrictionListRawMetaDataDto>;
  @useResult
  $Res call({List<String> usernames});
}

/// @nodoc
class _$UserRestrictionListRawMetaDataDtoCopyWithImpl<$Res,
        $Val extends UserRestrictionListRawMetaDataDto>
    implements $UserRestrictionListRawMetaDataDtoCopyWith<$Res> {
  _$UserRestrictionListRawMetaDataDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernames = null,
  }) {
    return _then(_value.copyWith(
      usernames: null == usernames
          ? _value.usernames
          : usernames // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserRestrictionRawMetaDataDtoCopyWith<$Res>
    implements $UserRestrictionListRawMetaDataDtoCopyWith<$Res> {
  factory _$$_UserRestrictionRawMetaDataDtoCopyWith(
          _$_UserRestrictionRawMetaDataDto value,
          $Res Function(_$_UserRestrictionRawMetaDataDto) then) =
      __$$_UserRestrictionRawMetaDataDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> usernames});
}

/// @nodoc
class __$$_UserRestrictionRawMetaDataDtoCopyWithImpl<$Res>
    extends _$UserRestrictionListRawMetaDataDtoCopyWithImpl<$Res,
        _$_UserRestrictionRawMetaDataDto>
    implements _$$_UserRestrictionRawMetaDataDtoCopyWith<$Res> {
  __$$_UserRestrictionRawMetaDataDtoCopyWithImpl(
      _$_UserRestrictionRawMetaDataDto _value,
      $Res Function(_$_UserRestrictionRawMetaDataDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernames = null,
  }) {
    return _then(_$_UserRestrictionRawMetaDataDto(
      usernames: null == usernames
          ? _value._usernames
          : usernames // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserRestrictionRawMetaDataDto extends _UserRestrictionRawMetaDataDto {
  _$_UserRestrictionRawMetaDataDto({required final List<String> usernames})
      : _usernames = usernames,
        super._();

  factory _$_UserRestrictionRawMetaDataDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_UserRestrictionRawMetaDataDtoFromJson(json);

  final List<String> _usernames;
  @override
  List<String> get usernames {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usernames);
  }

  @override
  String toString() {
    return 'UserRestrictionListRawMetaDataDto(usernames: $usernames)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRestrictionRawMetaDataDto &&
            const DeepCollectionEquality()
                .equals(other._usernames, _usernames));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_usernames));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserRestrictionRawMetaDataDtoCopyWith<_$_UserRestrictionRawMetaDataDto>
      get copyWith => __$$_UserRestrictionRawMetaDataDtoCopyWithImpl<
          _$_UserRestrictionRawMetaDataDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserRestrictionRawMetaDataDtoToJson(
      this,
    );
  }
}

abstract class _UserRestrictionRawMetaDataDto
    extends UserRestrictionListRawMetaDataDto {
  factory _UserRestrictionRawMetaDataDto(
          {required final List<String> usernames}) =
      _$_UserRestrictionRawMetaDataDto;
  _UserRestrictionRawMetaDataDto._() : super._();

  factory _UserRestrictionRawMetaDataDto.fromJson(Map<String, dynamic> json) =
      _$_UserRestrictionRawMetaDataDto.fromJson;

  @override
  List<String> get usernames;
  @override
  @JsonKey(ignore: true)
  _$$_UserRestrictionRawMetaDataDtoCopyWith<_$_UserRestrictionRawMetaDataDto>
      get copyWith => throw _privateConstructorUsedError;
}
