// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recent_order_favourite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecentOrderFavouriteStatus {
  bool get isFavourite => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecentOrderFavouriteStatusCopyWith<RecentOrderFavouriteStatus>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentOrderFavouriteStatusCopyWith<$Res> {
  factory $RecentOrderFavouriteStatusCopyWith(RecentOrderFavouriteStatus value,
          $Res Function(RecentOrderFavouriteStatus) then) =
      _$RecentOrderFavouriteStatusCopyWithImpl<$Res,
          RecentOrderFavouriteStatus>;
  @useResult
  $Res call({bool isFavourite});
}

/// @nodoc
class _$RecentOrderFavouriteStatusCopyWithImpl<$Res,
        $Val extends RecentOrderFavouriteStatus>
    implements $RecentOrderFavouriteStatusCopyWith<$Res> {
  _$RecentOrderFavouriteStatusCopyWithImpl(this._value, this._then);

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
abstract class _$$_RecentOrderFavouriteStatusCopyWith<$Res>
    implements $RecentOrderFavouriteStatusCopyWith<$Res> {
  factory _$$_RecentOrderFavouriteStatusCopyWith(
          _$_RecentOrderFavouriteStatus value,
          $Res Function(_$_RecentOrderFavouriteStatus) then) =
      __$$_RecentOrderFavouriteStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isFavourite});
}

/// @nodoc
class __$$_RecentOrderFavouriteStatusCopyWithImpl<$Res>
    extends _$RecentOrderFavouriteStatusCopyWithImpl<$Res,
        _$_RecentOrderFavouriteStatus>
    implements _$$_RecentOrderFavouriteStatusCopyWith<$Res> {
  __$$_RecentOrderFavouriteStatusCopyWithImpl(
      _$_RecentOrderFavouriteStatus _value,
      $Res Function(_$_RecentOrderFavouriteStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFavourite = null,
  }) {
    return _then(_$_RecentOrderFavouriteStatus(
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_RecentOrderFavouriteStatus extends _RecentOrderFavouriteStatus {
  const _$_RecentOrderFavouriteStatus({required this.isFavourite}) : super._();

  @override
  final bool isFavourite;

  @override
  String toString() {
    return 'RecentOrderFavouriteStatus(isFavourite: $isFavourite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecentOrderFavouriteStatus &&
            (identical(other.isFavourite, isFavourite) ||
                other.isFavourite == isFavourite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFavourite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecentOrderFavouriteStatusCopyWith<_$_RecentOrderFavouriteStatus>
      get copyWith => __$$_RecentOrderFavouriteStatusCopyWithImpl<
          _$_RecentOrderFavouriteStatus>(this, _$identity);
}

abstract class _RecentOrderFavouriteStatus extends RecentOrderFavouriteStatus {
  const factory _RecentOrderFavouriteStatus({required final bool isFavourite}) =
      _$_RecentOrderFavouriteStatus;
  const _RecentOrderFavouriteStatus._() : super._();

  @override
  bool get isFavourite;
  @override
  @JsonKey(ignore: true)
  _$$_RecentOrderFavouriteStatusCopyWith<_$_RecentOrderFavouriteStatus>
      get copyWith => throw _privateConstructorUsedError;
}
