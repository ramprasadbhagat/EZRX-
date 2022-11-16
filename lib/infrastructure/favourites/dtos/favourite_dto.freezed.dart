// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favourite_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FavouriteDto _$FavouriteDtoFromJson(Map<String, dynamic> json) {
  return _FavouriteDto.fromJson(json);
}

/// @nodoc
mixin _$FavouriteDto {
  @JsonKey(name: 'id', defaultValue: '')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'isTenderContract', defaultValue: false)
  bool get isTenderContract => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialDescription', defaultValue: '')
  String get materialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'isFOC', defaultValue: false)
  bool get isFOC => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavouriteDtoCopyWith<FavouriteDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouriteDtoCopyWith<$Res> {
  factory $FavouriteDtoCopyWith(
          FavouriteDto value, $Res Function(FavouriteDto) then) =
      _$FavouriteDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '')
          String id,
      @JsonKey(name: 'isTenderContract', defaultValue: false)
          bool isTenderContract,
      @JsonKey(name: 'materialDescription', defaultValue: '')
          String materialDescription,
      @JsonKey(name: 'materialNumber', defaultValue: '')
          String materialNumber,
      @JsonKey(name: 'isFOC', defaultValue: false)
          bool isFOC});
}

/// @nodoc
class _$FavouriteDtoCopyWithImpl<$Res> implements $FavouriteDtoCopyWith<$Res> {
  _$FavouriteDtoCopyWithImpl(this._value, this._then);

  final FavouriteDto _value;
  // ignore: unused_field
  final $Res Function(FavouriteDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? isTenderContract = freezed,
    Object? materialDescription = freezed,
    Object? materialNumber = freezed,
    Object? isFOC = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isTenderContract: isTenderContract == freezed
          ? _value.isTenderContract
          : isTenderContract // ignore: cast_nullable_to_non_nullable
              as bool,
      materialDescription: materialDescription == freezed
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      materialNumber: materialNumber == freezed
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isFOC: isFOC == freezed
          ? _value.isFOC
          : isFOC // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_FavouriteDtoCopyWith<$Res>
    implements $FavouriteDtoCopyWith<$Res> {
  factory _$$_FavouriteDtoCopyWith(
          _$_FavouriteDto value, $Res Function(_$_FavouriteDto) then) =
      __$$_FavouriteDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '')
          String id,
      @JsonKey(name: 'isTenderContract', defaultValue: false)
          bool isTenderContract,
      @JsonKey(name: 'materialDescription', defaultValue: '')
          String materialDescription,
      @JsonKey(name: 'materialNumber', defaultValue: '')
          String materialNumber,
      @JsonKey(name: 'isFOC', defaultValue: false)
          bool isFOC});
}

/// @nodoc
class __$$_FavouriteDtoCopyWithImpl<$Res>
    extends _$FavouriteDtoCopyWithImpl<$Res>
    implements _$$_FavouriteDtoCopyWith<$Res> {
  __$$_FavouriteDtoCopyWithImpl(
      _$_FavouriteDto _value, $Res Function(_$_FavouriteDto) _then)
      : super(_value, (v) => _then(v as _$_FavouriteDto));

  @override
  _$_FavouriteDto get _value => super._value as _$_FavouriteDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? isTenderContract = freezed,
    Object? materialDescription = freezed,
    Object? materialNumber = freezed,
    Object? isFOC = freezed,
  }) {
    return _then(_$_FavouriteDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isTenderContract: isTenderContract == freezed
          ? _value.isTenderContract
          : isTenderContract // ignore: cast_nullable_to_non_nullable
              as bool,
      materialDescription: materialDescription == freezed
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      materialNumber: materialNumber == freezed
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isFOC: isFOC == freezed
          ? _value.isFOC
          : isFOC // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FavouriteDto extends _FavouriteDto {
  const _$_FavouriteDto(
      {@JsonKey(name: 'id', defaultValue: '')
          required this.id,
      @JsonKey(name: 'isTenderContract', defaultValue: false)
          required this.isTenderContract,
      @JsonKey(name: 'materialDescription', defaultValue: '')
          required this.materialDescription,
      @JsonKey(name: 'materialNumber', defaultValue: '')
          required this.materialNumber,
      @JsonKey(name: 'isFOC', defaultValue: false)
          required this.isFOC})
      : super._();

  factory _$_FavouriteDto.fromJson(Map<String, dynamic> json) =>
      _$$_FavouriteDtoFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: '')
  final String id;
  @override
  @JsonKey(name: 'isTenderContract', defaultValue: false)
  final bool isTenderContract;
  @override
  @JsonKey(name: 'materialDescription', defaultValue: '')
  final String materialDescription;
  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  final String materialNumber;
  @override
  @JsonKey(name: 'isFOC', defaultValue: false)
  final bool isFOC;

  @override
  String toString() {
    return 'FavouriteDto(id: $id, isTenderContract: $isTenderContract, materialDescription: $materialDescription, materialNumber: $materialNumber, isFOC: $isFOC)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavouriteDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.isTenderContract, isTenderContract) &&
            const DeepCollectionEquality()
                .equals(other.materialDescription, materialDescription) &&
            const DeepCollectionEquality()
                .equals(other.materialNumber, materialNumber) &&
            const DeepCollectionEquality().equals(other.isFOC, isFOC));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(isTenderContract),
      const DeepCollectionEquality().hash(materialDescription),
      const DeepCollectionEquality().hash(materialNumber),
      const DeepCollectionEquality().hash(isFOC));

  @JsonKey(ignore: true)
  @override
  _$$_FavouriteDtoCopyWith<_$_FavouriteDto> get copyWith =>
      __$$_FavouriteDtoCopyWithImpl<_$_FavouriteDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavouriteDtoToJson(
      this,
    );
  }
}

abstract class _FavouriteDto extends FavouriteDto {
  const factory _FavouriteDto(
      {@JsonKey(name: 'id', defaultValue: '')
          required final String id,
      @JsonKey(name: 'isTenderContract', defaultValue: false)
          required final bool isTenderContract,
      @JsonKey(name: 'materialDescription', defaultValue: '')
          required final String materialDescription,
      @JsonKey(name: 'materialNumber', defaultValue: '')
          required final String materialNumber,
      @JsonKey(name: 'isFOC', defaultValue: false)
          required final bool isFOC}) = _$_FavouriteDto;
  const _FavouriteDto._() : super._();

  factory _FavouriteDto.fromJson(Map<String, dynamic> json) =
      _$_FavouriteDto.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: '')
  String get id;
  @override
  @JsonKey(name: 'isTenderContract', defaultValue: false)
  bool get isTenderContract;
  @override
  @JsonKey(name: 'materialDescription', defaultValue: '')
  String get materialDescription;
  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'isFOC', defaultValue: false)
  bool get isFOC;
  @override
  @JsonKey(ignore: true)
  _$$_FavouriteDtoCopyWith<_$_FavouriteDto> get copyWith =>
      throw _privateConstructorUsedError;
}
