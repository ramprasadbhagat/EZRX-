// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aup_tc_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AupTcEvent {
  User get user => throw _privateConstructorUsedError;
  SalesOrg get salesOrg => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user, SalesOrg salesOrg) show,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, SalesOrg salesOrg)? show,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, SalesOrg salesOrg)? show,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Show value) show,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Show value)? show,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Show value)? show,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AupTcEventCopyWith<AupTcEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AupTcEventCopyWith<$Res> {
  factory $AupTcEventCopyWith(
          AupTcEvent value, $Res Function(AupTcEvent) then) =
      _$AupTcEventCopyWithImpl<$Res, AupTcEvent>;
  @useResult
  $Res call({User user, SalesOrg salesOrg});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$AupTcEventCopyWithImpl<$Res, $Val extends AupTcEvent>
    implements $AupTcEventCopyWith<$Res> {
  _$AupTcEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? salesOrg = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ShowCopyWith<$Res> implements $AupTcEventCopyWith<$Res> {
  factory _$$_ShowCopyWith(_$_Show value, $Res Function(_$_Show) then) =
      __$$_ShowCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User user, SalesOrg salesOrg});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_ShowCopyWithImpl<$Res>
    extends _$AupTcEventCopyWithImpl<$Res, _$_Show>
    implements _$$_ShowCopyWith<$Res> {
  __$$_ShowCopyWithImpl(_$_Show _value, $Res Function(_$_Show) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? salesOrg = null,
  }) {
    return _then(_$_Show(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ));
  }
}

/// @nodoc

class _$_Show implements _Show {
  const _$_Show(this.user, this.salesOrg);

  @override
  final User user;
  @override
  final SalesOrg salesOrg;

  @override
  String toString() {
    return 'AupTcEvent.show(user: $user, salesOrg: $salesOrg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Show &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, salesOrg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShowCopyWith<_$_Show> get copyWith =>
      __$$_ShowCopyWithImpl<_$_Show>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user, SalesOrg salesOrg) show,
  }) {
    return show(user, salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, SalesOrg salesOrg)? show,
  }) {
    return show?.call(user, salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, SalesOrg salesOrg)? show,
    required TResult orElse(),
  }) {
    if (show != null) {
      return show(user, salesOrg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Show value) show,
  }) {
    return show(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Show value)? show,
  }) {
    return show?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Show value)? show,
    required TResult orElse(),
  }) {
    if (show != null) {
      return show(this);
    }
    return orElse();
  }
}

abstract class _Show implements AupTcEvent {
  const factory _Show(final User user, final SalesOrg salesOrg) = _$_Show;

  @override
  User get user;
  @override
  SalesOrg get salesOrg;
  @override
  @JsonKey(ignore: true)
  _$$_ShowCopyWith<_$_Show> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AupTcState {
  bool get showTermsAndConditon => throw _privateConstructorUsedError;
  String? get initialFile => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AupTcStateCopyWith<AupTcState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AupTcStateCopyWith<$Res> {
  factory $AupTcStateCopyWith(
          AupTcState value, $Res Function(AupTcState) then) =
      _$AupTcStateCopyWithImpl<$Res, AupTcState>;
  @useResult
  $Res call({bool showTermsAndConditon, String? initialFile, String url});
}

/// @nodoc
class _$AupTcStateCopyWithImpl<$Res, $Val extends AupTcState>
    implements $AupTcStateCopyWith<$Res> {
  _$AupTcStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showTermsAndConditon = null,
    Object? initialFile = freezed,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      showTermsAndConditon: null == showTermsAndConditon
          ? _value.showTermsAndConditon
          : showTermsAndConditon // ignore: cast_nullable_to_non_nullable
              as bool,
      initialFile: freezed == initialFile
          ? _value.initialFile
          : initialFile // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AupTcStateCopyWith<$Res>
    implements $AupTcStateCopyWith<$Res> {
  factory _$$_AupTcStateCopyWith(
          _$_AupTcState value, $Res Function(_$_AupTcState) then) =
      __$$_AupTcStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool showTermsAndConditon, String? initialFile, String url});
}

/// @nodoc
class __$$_AupTcStateCopyWithImpl<$Res>
    extends _$AupTcStateCopyWithImpl<$Res, _$_AupTcState>
    implements _$$_AupTcStateCopyWith<$Res> {
  __$$_AupTcStateCopyWithImpl(
      _$_AupTcState _value, $Res Function(_$_AupTcState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showTermsAndConditon = null,
    Object? initialFile = freezed,
    Object? url = null,
  }) {
    return _then(_$_AupTcState(
      showTermsAndConditon: null == showTermsAndConditon
          ? _value.showTermsAndConditon
          : showTermsAndConditon // ignore: cast_nullable_to_non_nullable
              as bool,
      initialFile: freezed == initialFile
          ? _value.initialFile
          : initialFile // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AupTcState implements _AupTcState {
  const _$_AupTcState(
      {required this.showTermsAndConditon,
      this.initialFile,
      required this.url});

  @override
  final bool showTermsAndConditon;
  @override
  final String? initialFile;
  @override
  final String url;

  @override
  String toString() {
    return 'AupTcState(showTermsAndConditon: $showTermsAndConditon, initialFile: $initialFile, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AupTcState &&
            (identical(other.showTermsAndConditon, showTermsAndConditon) ||
                other.showTermsAndConditon == showTermsAndConditon) &&
            (identical(other.initialFile, initialFile) ||
                other.initialFile == initialFile) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, showTermsAndConditon, initialFile, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AupTcStateCopyWith<_$_AupTcState> get copyWith =>
      __$$_AupTcStateCopyWithImpl<_$_AupTcState>(this, _$identity);
}

abstract class _AupTcState implements AupTcState {
  const factory _AupTcState(
      {required final bool showTermsAndConditon,
      final String? initialFile,
      required final String url}) = _$_AupTcState;

  @override
  bool get showTermsAndConditon;
  @override
  String? get initialFile;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_AupTcStateCopyWith<_$_AupTcState> get copyWith =>
      throw _privateConstructorUsedError;
}
