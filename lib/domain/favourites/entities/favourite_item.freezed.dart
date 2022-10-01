// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favourite_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Favourite {
  String get id => throw _privateConstructorUsedError;
  MaterialNumber get materialNumber => throw _privateConstructorUsedError;
  bool get isFOC => throw _privateConstructorUsedError;
  bool get isTenderContract => throw _privateConstructorUsedError;
  String get materialDescription => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavouriteCopyWith<Favourite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouriteCopyWith<$Res> {
  factory $FavouriteCopyWith(Favourite value, $Res Function(Favourite) then) =
      _$FavouriteCopyWithImpl<$Res>;
  $Res call(
      {String id,
      MaterialNumber materialNumber,
      bool isFOC,
      bool isTenderContract,
      String materialDescription});
}

/// @nodoc
class _$FavouriteCopyWithImpl<$Res> implements $FavouriteCopyWith<$Res> {
  _$FavouriteCopyWithImpl(this._value, this._then);

  final Favourite _value;
  // ignore: unused_field
  final $Res Function(Favourite) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? materialNumber = freezed,
    Object? isFOC = freezed,
    Object? isTenderContract = freezed,
    Object? materialDescription = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      materialNumber: materialNumber == freezed
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      isFOC: isFOC == freezed
          ? _value.isFOC
          : isFOC // ignore: cast_nullable_to_non_nullable
              as bool,
      isTenderContract: isTenderContract == freezed
          ? _value.isTenderContract
          : isTenderContract // ignore: cast_nullable_to_non_nullable
              as bool,
      materialDescription: materialDescription == freezed
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_FavouriteCopyWith<$Res> implements $FavouriteCopyWith<$Res> {
  factory _$$_FavouriteCopyWith(
          _$_Favourite value, $Res Function(_$_Favourite) then) =
      __$$_FavouriteCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      MaterialNumber materialNumber,
      bool isFOC,
      bool isTenderContract,
      String materialDescription});
}

/// @nodoc
class __$$_FavouriteCopyWithImpl<$Res> extends _$FavouriteCopyWithImpl<$Res>
    implements _$$_FavouriteCopyWith<$Res> {
  __$$_FavouriteCopyWithImpl(
      _$_Favourite _value, $Res Function(_$_Favourite) _then)
      : super(_value, (v) => _then(v as _$_Favourite));

  @override
  _$_Favourite get _value => super._value as _$_Favourite;

  @override
  $Res call({
    Object? id = freezed,
    Object? materialNumber = freezed,
    Object? isFOC = freezed,
    Object? isTenderContract = freezed,
    Object? materialDescription = freezed,
  }) {
    return _then(_$_Favourite(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      materialNumber: materialNumber == freezed
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      isFOC: isFOC == freezed
          ? _value.isFOC
          : isFOC // ignore: cast_nullable_to_non_nullable
              as bool,
      isTenderContract: isTenderContract == freezed
          ? _value.isTenderContract
          : isTenderContract // ignore: cast_nullable_to_non_nullable
              as bool,
      materialDescription: materialDescription == freezed
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Favourite extends _Favourite {
  const _$_Favourite(
      {required this.id,
      required this.materialNumber,
      required this.isFOC,
      required this.isTenderContract,
      required this.materialDescription})
      : super._();

  @override
  final String id;
  @override
  final MaterialNumber materialNumber;
  @override
  final bool isFOC;
  @override
  final bool isTenderContract;
  @override
  final String materialDescription;

  @override
  String toString() {
    return 'Favourite(id: $id, materialNumber: $materialNumber, isFOC: $isFOC, isTenderContract: $isTenderContract, materialDescription: $materialDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Favourite &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.materialNumber, materialNumber) &&
            const DeepCollectionEquality().equals(other.isFOC, isFOC) &&
            const DeepCollectionEquality()
                .equals(other.isTenderContract, isTenderContract) &&
            const DeepCollectionEquality()
                .equals(other.materialDescription, materialDescription));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(materialNumber),
      const DeepCollectionEquality().hash(isFOC),
      const DeepCollectionEquality().hash(isTenderContract),
      const DeepCollectionEquality().hash(materialDescription));

  @JsonKey(ignore: true)
  @override
  _$$_FavouriteCopyWith<_$_Favourite> get copyWith =>
      __$$_FavouriteCopyWithImpl<_$_Favourite>(this, _$identity);
}

abstract class _Favourite extends Favourite {
  const factory _Favourite(
      {required final String id,
      required final MaterialNumber materialNumber,
      required final bool isFOC,
      required final bool isTenderContract,
      required final String materialDescription}) = _$_Favourite;
  const _Favourite._() : super._();

  @override
  String get id;
  @override
  MaterialNumber get materialNumber;
  @override
  bool get isFOC;
  @override
  bool get isTenderContract;
  @override
  String get materialDescription;
  @override
  @JsonKey(ignore: true)
  _$$_FavouriteCopyWith<_$_Favourite> get copyWith =>
      throw _privateConstructorUsedError;
}
