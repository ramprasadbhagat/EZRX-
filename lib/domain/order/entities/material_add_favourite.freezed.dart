// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_add_favourite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MaterialAddFavourite {
  int get addFavouriteMaterial => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaterialAddFavouriteCopyWith<MaterialAddFavourite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialAddFavouriteCopyWith<$Res> {
  factory $MaterialAddFavouriteCopyWith(MaterialAddFavourite value,
          $Res Function(MaterialAddFavourite) then) =
      _$MaterialAddFavouriteCopyWithImpl<$Res, MaterialAddFavourite>;
  @useResult
  $Res call({int addFavouriteMaterial});
}

/// @nodoc
class _$MaterialAddFavouriteCopyWithImpl<$Res,
        $Val extends MaterialAddFavourite>
    implements $MaterialAddFavouriteCopyWith<$Res> {
  _$MaterialAddFavouriteCopyWithImpl(this._value, this._then);

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
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MaterialAddFavouriteCopyWith<$Res>
    implements $MaterialAddFavouriteCopyWith<$Res> {
  factory _$$_MaterialAddFavouriteCopyWith(_$_MaterialAddFavourite value,
          $Res Function(_$_MaterialAddFavourite) then) =
      __$$_MaterialAddFavouriteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int addFavouriteMaterial});
}

/// @nodoc
class __$$_MaterialAddFavouriteCopyWithImpl<$Res>
    extends _$MaterialAddFavouriteCopyWithImpl<$Res, _$_MaterialAddFavourite>
    implements _$$_MaterialAddFavouriteCopyWith<$Res> {
  __$$_MaterialAddFavouriteCopyWithImpl(_$_MaterialAddFavourite _value,
      $Res Function(_$_MaterialAddFavourite) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addFavouriteMaterial = null,
  }) {
    return _then(_$_MaterialAddFavourite(
      addFavouriteMaterial: null == addFavouriteMaterial
          ? _value.addFavouriteMaterial
          : addFavouriteMaterial // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_MaterialAddFavourite extends _MaterialAddFavourite {
  const _$_MaterialAddFavourite({required this.addFavouriteMaterial})
      : super._();

  @override
  final int addFavouriteMaterial;

  @override
  String toString() {
    return 'MaterialAddFavourite(addFavouriteMaterial: $addFavouriteMaterial)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialAddFavourite &&
            (identical(other.addFavouriteMaterial, addFavouriteMaterial) ||
                other.addFavouriteMaterial == addFavouriteMaterial));
  }

  @override
  int get hashCode => Object.hash(runtimeType, addFavouriteMaterial);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaterialAddFavouriteCopyWith<_$_MaterialAddFavourite> get copyWith =>
      __$$_MaterialAddFavouriteCopyWithImpl<_$_MaterialAddFavourite>(
          this, _$identity);
}

abstract class _MaterialAddFavourite extends MaterialAddFavourite {
  const factory _MaterialAddFavourite(
      {required final int addFavouriteMaterial}) = _$_MaterialAddFavourite;
  const _MaterialAddFavourite._() : super._();

  @override
  int get addFavouriteMaterial;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialAddFavouriteCopyWith<_$_MaterialAddFavourite> get copyWith =>
      throw _privateConstructorUsedError;
}
