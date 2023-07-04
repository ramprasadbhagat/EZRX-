// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favourite_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavouriteStatus {
  bool get isFavourite => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavouriteStatusCopyWith<FavouriteStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouriteStatusCopyWith<$Res> {
  factory $FavouriteStatusCopyWith(
          FavouriteStatus value, $Res Function(FavouriteStatus) then) =
      _$FavouriteStatusCopyWithImpl<$Res, FavouriteStatus>;
  @useResult
  $Res call({bool isFavourite});
}

/// @nodoc
class _$FavouriteStatusCopyWithImpl<$Res, $Val extends FavouriteStatus>
    implements $FavouriteStatusCopyWith<$Res> {
  _$FavouriteStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFavourite = null,
  }) {
    return _then(_value.copyWith(
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavouriteStatusCopyWith<$Res>
    implements $FavouriteStatusCopyWith<$Res> {
  factory _$$_FavouriteStatusCopyWith(
          _$_FavouriteStatus value, $Res Function(_$_FavouriteStatus) then) =
      __$$_FavouriteStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isFavourite});
}

/// @nodoc
class __$$_FavouriteStatusCopyWithImpl<$Res>
    extends _$FavouriteStatusCopyWithImpl<$Res, _$_FavouriteStatus>
    implements _$$_FavouriteStatusCopyWith<$Res> {
  __$$_FavouriteStatusCopyWithImpl(
      _$_FavouriteStatus _value, $Res Function(_$_FavouriteStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFavourite = null,
  }) {
    return _then(_$_FavouriteStatus(
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FavouriteStatus extends _FavouriteStatus {
  const _$_FavouriteStatus({required this.isFavourite}) : super._();

  @override
  final bool isFavourite;

  @override
  String toString() {
    return 'FavouriteStatus(isFavourite: $isFavourite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavouriteStatus &&
            (identical(other.isFavourite, isFavourite) ||
                other.isFavourite == isFavourite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFavourite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavouriteStatusCopyWith<_$_FavouriteStatus> get copyWith =>
      __$$_FavouriteStatusCopyWithImpl<_$_FavouriteStatus>(this, _$identity);
}

abstract class _FavouriteStatus extends FavouriteStatus {
  const factory _FavouriteStatus({required final bool isFavourite}) =
      _$_FavouriteStatus;
  const _FavouriteStatus._() : super._();

  @override
  bool get isFavourite;
  @override
  @JsonKey(ignore: true)
  _$$_FavouriteStatusCopyWith<_$_FavouriteStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
