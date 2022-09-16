// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'announcement_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnnouncementEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAnnouncement,
    required TResult Function() close,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getAnnouncement,
    TResult Function()? close,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAnnouncement,
    TResult Function()? close,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAnnouncement value) getAnnouncement,
    required TResult Function(_Close value) close,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetAnnouncement value)? getAnnouncement,
    TResult Function(_Close value)? close,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAnnouncement value)? getAnnouncement,
    TResult Function(_Close value)? close,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementEventCopyWith<$Res> {
  factory $AnnouncementEventCopyWith(
          AnnouncementEvent value, $Res Function(AnnouncementEvent) then) =
      _$AnnouncementEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AnnouncementEventCopyWithImpl<$Res>
    implements $AnnouncementEventCopyWith<$Res> {
  _$AnnouncementEventCopyWithImpl(this._value, this._then);

  final AnnouncementEvent _value;
  // ignore: unused_field
  final $Res Function(AnnouncementEvent) _then;
}

/// @nodoc
abstract class _$$_GetAnnouncementCopyWith<$Res> {
  factory _$$_GetAnnouncementCopyWith(
          _$_GetAnnouncement value, $Res Function(_$_GetAnnouncement) then) =
      __$$_GetAnnouncementCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetAnnouncementCopyWithImpl<$Res>
    extends _$AnnouncementEventCopyWithImpl<$Res>
    implements _$$_GetAnnouncementCopyWith<$Res> {
  __$$_GetAnnouncementCopyWithImpl(
      _$_GetAnnouncement _value, $Res Function(_$_GetAnnouncement) _then)
      : super(_value, (v) => _then(v as _$_GetAnnouncement));

  @override
  _$_GetAnnouncement get _value => super._value as _$_GetAnnouncement;
}

/// @nodoc

class _$_GetAnnouncement implements _GetAnnouncement {
  const _$_GetAnnouncement();

  @override
  String toString() {
    return 'AnnouncementEvent.getAnnouncement()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetAnnouncement);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAnnouncement,
    required TResult Function() close,
  }) {
    return getAnnouncement();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getAnnouncement,
    TResult Function()? close,
  }) {
    return getAnnouncement?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAnnouncement,
    TResult Function()? close,
    required TResult orElse(),
  }) {
    if (getAnnouncement != null) {
      return getAnnouncement();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAnnouncement value) getAnnouncement,
    required TResult Function(_Close value) close,
  }) {
    return getAnnouncement(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetAnnouncement value)? getAnnouncement,
    TResult Function(_Close value)? close,
  }) {
    return getAnnouncement?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAnnouncement value)? getAnnouncement,
    TResult Function(_Close value)? close,
    required TResult orElse(),
  }) {
    if (getAnnouncement != null) {
      return getAnnouncement(this);
    }
    return orElse();
  }
}

abstract class _GetAnnouncement implements AnnouncementEvent {
  const factory _GetAnnouncement() = _$_GetAnnouncement;
}

/// @nodoc
abstract class _$$_CloseCopyWith<$Res> {
  factory _$$_CloseCopyWith(_$_Close value, $Res Function(_$_Close) then) =
      __$$_CloseCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CloseCopyWithImpl<$Res> extends _$AnnouncementEventCopyWithImpl<$Res>
    implements _$$_CloseCopyWith<$Res> {
  __$$_CloseCopyWithImpl(_$_Close _value, $Res Function(_$_Close) _then)
      : super(_value, (v) => _then(v as _$_Close));

  @override
  _$_Close get _value => super._value as _$_Close;
}

/// @nodoc

class _$_Close implements _Close {
  const _$_Close();

  @override
  String toString() {
    return 'AnnouncementEvent.close()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Close);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAnnouncement,
    required TResult Function() close,
  }) {
    return close();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getAnnouncement,
    TResult Function()? close,
  }) {
    return close?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAnnouncement,
    TResult Function()? close,
    required TResult orElse(),
  }) {
    if (close != null) {
      return close();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAnnouncement value) getAnnouncement,
    required TResult Function(_Close value) close,
  }) {
    return close(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetAnnouncement value)? getAnnouncement,
    TResult Function(_Close value)? close,
  }) {
    return close?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAnnouncement value)? getAnnouncement,
    TResult Function(_Close value)? close,
    required TResult orElse(),
  }) {
    if (close != null) {
      return close(this);
    }
    return orElse();
  }
}

abstract class _Close implements AnnouncementEvent {
  const factory _Close() = _$_Close;
}

/// @nodoc
mixin _$AnnouncementState {
  Announcement get announcement => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isClosed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnnouncementStateCopyWith<AnnouncementState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementStateCopyWith<$Res> {
  factory $AnnouncementStateCopyWith(
          AnnouncementState value, $Res Function(AnnouncementState) then) =
      _$AnnouncementStateCopyWithImpl<$Res>;
  $Res call({Announcement announcement, bool isLoading, bool isClosed});

  $AnnouncementCopyWith<$Res> get announcement;
}

/// @nodoc
class _$AnnouncementStateCopyWithImpl<$Res>
    implements $AnnouncementStateCopyWith<$Res> {
  _$AnnouncementStateCopyWithImpl(this._value, this._then);

  final AnnouncementState _value;
  // ignore: unused_field
  final $Res Function(AnnouncementState) _then;

  @override
  $Res call({
    Object? announcement = freezed,
    Object? isLoading = freezed,
    Object? isClosed = freezed,
  }) {
    return _then(_value.copyWith(
      announcement: announcement == freezed
          ? _value.announcement
          : announcement // ignore: cast_nullable_to_non_nullable
              as Announcement,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isClosed: isClosed == freezed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $AnnouncementCopyWith<$Res> get announcement {
    return $AnnouncementCopyWith<$Res>(_value.announcement, (value) {
      return _then(_value.copyWith(announcement: value));
    });
  }
}

/// @nodoc
abstract class _$$_AnnouncementStateCopyWith<$Res>
    implements $AnnouncementStateCopyWith<$Res> {
  factory _$$_AnnouncementStateCopyWith(_$_AnnouncementState value,
          $Res Function(_$_AnnouncementState) then) =
      __$$_AnnouncementStateCopyWithImpl<$Res>;
  @override
  $Res call({Announcement announcement, bool isLoading, bool isClosed});

  @override
  $AnnouncementCopyWith<$Res> get announcement;
}

/// @nodoc
class __$$_AnnouncementStateCopyWithImpl<$Res>
    extends _$AnnouncementStateCopyWithImpl<$Res>
    implements _$$_AnnouncementStateCopyWith<$Res> {
  __$$_AnnouncementStateCopyWithImpl(
      _$_AnnouncementState _value, $Res Function(_$_AnnouncementState) _then)
      : super(_value, (v) => _then(v as _$_AnnouncementState));

  @override
  _$_AnnouncementState get _value => super._value as _$_AnnouncementState;

  @override
  $Res call({
    Object? announcement = freezed,
    Object? isLoading = freezed,
    Object? isClosed = freezed,
  }) {
    return _then(_$_AnnouncementState(
      announcement: announcement == freezed
          ? _value.announcement
          : announcement // ignore: cast_nullable_to_non_nullable
              as Announcement,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isClosed: isClosed == freezed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AnnouncementState implements _AnnouncementState {
  const _$_AnnouncementState(
      {required this.announcement,
      required this.isLoading,
      required this.isClosed});

  @override
  final Announcement announcement;
  @override
  final bool isLoading;
  @override
  final bool isClosed;

  @override
  String toString() {
    return 'AnnouncementState(announcement: $announcement, isLoading: $isLoading, isClosed: $isClosed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnnouncementState &&
            const DeepCollectionEquality()
                .equals(other.announcement, announcement) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isClosed, isClosed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(announcement),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isClosed));

  @JsonKey(ignore: true)
  @override
  _$$_AnnouncementStateCopyWith<_$_AnnouncementState> get copyWith =>
      __$$_AnnouncementStateCopyWithImpl<_$_AnnouncementState>(
          this, _$identity);
}

abstract class _AnnouncementState implements AnnouncementState {
  const factory _AnnouncementState(
      {required final Announcement announcement,
      required final bool isLoading,
      required final bool isClosed}) = _$_AnnouncementState;

  @override
  Announcement get announcement;
  @override
  bool get isLoading;
  @override
  bool get isClosed;
  @override
  @JsonKey(ignore: true)
  _$$_AnnouncementStateCopyWith<_$_AnnouncementState> get copyWith =>
      throw _privateConstructorUsedError;
}
