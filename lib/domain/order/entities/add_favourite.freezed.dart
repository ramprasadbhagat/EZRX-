// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_favourite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddFavourite {
  FavouriteResponse get addFavouriteMaterial =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddFavouriteCopyWith<AddFavourite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddFavouriteCopyWith<$Res> {
  factory $AddFavouriteCopyWith(
          AddFavourite value, $Res Function(AddFavourite) then) =
      _$AddFavouriteCopyWithImpl<$Res, AddFavourite>;
  @useResult
  $Res call({FavouriteResponse addFavouriteMaterial});
}

/// @nodoc
class _$AddFavouriteCopyWithImpl<$Res, $Val extends AddFavourite>
    implements $AddFavouriteCopyWith<$Res> {
  _$AddFavouriteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addFavouriteMaterial = null,
  }) {
    return _then(_value.copyWith(
      addFavouriteMaterial: null == addFavouriteMaterial
          ? _value.addFavouriteMaterial
          : addFavouriteMaterial // ignore: cast_nullable_to_non_nullable
              as FavouriteResponse,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddFavouriteCopyWith<$Res>
    implements $AddFavouriteCopyWith<$Res> {
  factory _$$_AddFavouriteCopyWith(
          _$_AddFavourite value, $Res Function(_$_AddFavourite) then) =
      __$$_AddFavouriteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FavouriteResponse addFavouriteMaterial});
}

/// @nodoc
class __$$_AddFavouriteCopyWithImpl<$Res>
    extends _$AddFavouriteCopyWithImpl<$Res, _$_AddFavourite>
    implements _$$_AddFavouriteCopyWith<$Res> {
  __$$_AddFavouriteCopyWithImpl(
      _$_AddFavourite _value, $Res Function(_$_AddFavourite) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addFavouriteMaterial = null,
  }) {
    return _then(_$_AddFavourite(
      addFavouriteMaterial: null == addFavouriteMaterial
          ? _value.addFavouriteMaterial
          : addFavouriteMaterial // ignore: cast_nullable_to_non_nullable
              as FavouriteResponse,
    ));
  }
}

/// @nodoc

class _$_AddFavourite extends _AddFavourite {
  const _$_AddFavourite({required this.addFavouriteMaterial}) : super._();

  @override
  final FavouriteResponse addFavouriteMaterial;

  @override
  String toString() {
    return 'AddFavourite(addFavouriteMaterial: $addFavouriteMaterial)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddFavourite &&
            (identical(other.addFavouriteMaterial, addFavouriteMaterial) ||
                other.addFavouriteMaterial == addFavouriteMaterial));
  }

  @override
  int get hashCode => Object.hash(runtimeType, addFavouriteMaterial);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddFavouriteCopyWith<_$_AddFavourite> get copyWith =>
      __$$_AddFavouriteCopyWithImpl<_$_AddFavourite>(this, _$identity);
}

abstract class _AddFavourite extends AddFavourite {
  const factory _AddFavourite(
          {required final FavouriteResponse addFavouriteMaterial}) =
      _$_AddFavourite;
  const _AddFavourite._() : super._();

  @override
  FavouriteResponse get addFavouriteMaterial;
  @override
  @JsonKey(ignore: true)
  _$$_AddFavouriteCopyWith<_$_AddFavourite> get copyWith =>
      throw _privateConstructorUsedError;
}
