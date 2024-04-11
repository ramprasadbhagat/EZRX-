// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about_us_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AboutUsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) initialize,
    required TResult Function() fetchAboutUsInfo,
    required TResult Function() fetchAboutUsStaticInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? initialize,
    TResult? Function()? fetchAboutUsInfo,
    TResult? Function()? fetchAboutUsStaticInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? initialize,
    TResult Function()? fetchAboutUsInfo,
    TResult Function()? fetchAboutUsStaticInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_FetchAboutUsInfo value) fetchAboutUsInfo,
    required TResult Function(_FetchAboutUsStaticInfo value)
        fetchAboutUsStaticInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_FetchAboutUsInfo value)? fetchAboutUsInfo,
    TResult? Function(_FetchAboutUsStaticInfo value)? fetchAboutUsStaticInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_FetchAboutUsInfo value)? fetchAboutUsInfo,
    TResult Function(_FetchAboutUsStaticInfo value)? fetchAboutUsStaticInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutUsEventCopyWith<$Res> {
  factory $AboutUsEventCopyWith(
          AboutUsEvent value, $Res Function(AboutUsEvent) then) =
      _$AboutUsEventCopyWithImpl<$Res, AboutUsEvent>;
}

/// @nodoc
class _$AboutUsEventCopyWithImpl<$Res, $Val extends AboutUsEvent>
    implements $AboutUsEventCopyWith<$Res> {
  _$AboutUsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitializeCopyWith<$Res> {
  factory _$$_InitializeCopyWith(
          _$_Initialize value, $Res Function(_$_Initialize) then) =
      __$$_InitializeCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrg salesOrg});
}

/// @nodoc
class __$$_InitializeCopyWithImpl<$Res>
    extends _$AboutUsEventCopyWithImpl<$Res, _$_Initialize>
    implements _$$_InitializeCopyWith<$Res> {
  __$$_InitializeCopyWithImpl(
      _$_Initialize _value, $Res Function(_$_Initialize) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
  }) {
    return _then(_$_Initialize(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ));
  }
}

/// @nodoc

class _$_Initialize implements _Initialize {
  const _$_Initialize({required this.salesOrg});

  @override
  final SalesOrg salesOrg;

  @override
  String toString() {
    return 'AboutUsEvent.initialize(salesOrg: $salesOrg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initialize &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitializeCopyWith<_$_Initialize> get copyWith =>
      __$$_InitializeCopyWithImpl<_$_Initialize>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) initialize,
    required TResult Function() fetchAboutUsInfo,
    required TResult Function() fetchAboutUsStaticInfo,
  }) {
    return initialize(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? initialize,
    TResult? Function()? fetchAboutUsInfo,
    TResult? Function()? fetchAboutUsStaticInfo,
  }) {
    return initialize?.call(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? initialize,
    TResult Function()? fetchAboutUsInfo,
    TResult Function()? fetchAboutUsStaticInfo,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(salesOrg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_FetchAboutUsInfo value) fetchAboutUsInfo,
    required TResult Function(_FetchAboutUsStaticInfo value)
        fetchAboutUsStaticInfo,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_FetchAboutUsInfo value)? fetchAboutUsInfo,
    TResult? Function(_FetchAboutUsStaticInfo value)? fetchAboutUsStaticInfo,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_FetchAboutUsInfo value)? fetchAboutUsInfo,
    TResult Function(_FetchAboutUsStaticInfo value)? fetchAboutUsStaticInfo,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements AboutUsEvent {
  const factory _Initialize({required final SalesOrg salesOrg}) = _$_Initialize;

  SalesOrg get salesOrg;
  @JsonKey(ignore: true)
  _$$_InitializeCopyWith<_$_Initialize> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchAboutUsInfoCopyWith<$Res> {
  factory _$$_FetchAboutUsInfoCopyWith(
          _$_FetchAboutUsInfo value, $Res Function(_$_FetchAboutUsInfo) then) =
      __$$_FetchAboutUsInfoCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchAboutUsInfoCopyWithImpl<$Res>
    extends _$AboutUsEventCopyWithImpl<$Res, _$_FetchAboutUsInfo>
    implements _$$_FetchAboutUsInfoCopyWith<$Res> {
  __$$_FetchAboutUsInfoCopyWithImpl(
      _$_FetchAboutUsInfo _value, $Res Function(_$_FetchAboutUsInfo) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_FetchAboutUsInfo implements _FetchAboutUsInfo {
  const _$_FetchAboutUsInfo();

  @override
  String toString() {
    return 'AboutUsEvent.fetchAboutUsInfo()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_FetchAboutUsInfo);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) initialize,
    required TResult Function() fetchAboutUsInfo,
    required TResult Function() fetchAboutUsStaticInfo,
  }) {
    return fetchAboutUsInfo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? initialize,
    TResult? Function()? fetchAboutUsInfo,
    TResult? Function()? fetchAboutUsStaticInfo,
  }) {
    return fetchAboutUsInfo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? initialize,
    TResult Function()? fetchAboutUsInfo,
    TResult Function()? fetchAboutUsStaticInfo,
    required TResult orElse(),
  }) {
    if (fetchAboutUsInfo != null) {
      return fetchAboutUsInfo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_FetchAboutUsInfo value) fetchAboutUsInfo,
    required TResult Function(_FetchAboutUsStaticInfo value)
        fetchAboutUsStaticInfo,
  }) {
    return fetchAboutUsInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_FetchAboutUsInfo value)? fetchAboutUsInfo,
    TResult? Function(_FetchAboutUsStaticInfo value)? fetchAboutUsStaticInfo,
  }) {
    return fetchAboutUsInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_FetchAboutUsInfo value)? fetchAboutUsInfo,
    TResult Function(_FetchAboutUsStaticInfo value)? fetchAboutUsStaticInfo,
    required TResult orElse(),
  }) {
    if (fetchAboutUsInfo != null) {
      return fetchAboutUsInfo(this);
    }
    return orElse();
  }
}

abstract class _FetchAboutUsInfo implements AboutUsEvent {
  const factory _FetchAboutUsInfo() = _$_FetchAboutUsInfo;
}

/// @nodoc
abstract class _$$_FetchAboutUsStaticInfoCopyWith<$Res> {
  factory _$$_FetchAboutUsStaticInfoCopyWith(_$_FetchAboutUsStaticInfo value,
          $Res Function(_$_FetchAboutUsStaticInfo) then) =
      __$$_FetchAboutUsStaticInfoCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchAboutUsStaticInfoCopyWithImpl<$Res>
    extends _$AboutUsEventCopyWithImpl<$Res, _$_FetchAboutUsStaticInfo>
    implements _$$_FetchAboutUsStaticInfoCopyWith<$Res> {
  __$$_FetchAboutUsStaticInfoCopyWithImpl(_$_FetchAboutUsStaticInfo _value,
      $Res Function(_$_FetchAboutUsStaticInfo) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_FetchAboutUsStaticInfo implements _FetchAboutUsStaticInfo {
  const _$_FetchAboutUsStaticInfo();

  @override
  String toString() {
    return 'AboutUsEvent.fetchAboutUsStaticInfo()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchAboutUsStaticInfo);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) initialize,
    required TResult Function() fetchAboutUsInfo,
    required TResult Function() fetchAboutUsStaticInfo,
  }) {
    return fetchAboutUsStaticInfo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? initialize,
    TResult? Function()? fetchAboutUsInfo,
    TResult? Function()? fetchAboutUsStaticInfo,
  }) {
    return fetchAboutUsStaticInfo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? initialize,
    TResult Function()? fetchAboutUsInfo,
    TResult Function()? fetchAboutUsStaticInfo,
    required TResult orElse(),
  }) {
    if (fetchAboutUsStaticInfo != null) {
      return fetchAboutUsStaticInfo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_FetchAboutUsInfo value) fetchAboutUsInfo,
    required TResult Function(_FetchAboutUsStaticInfo value)
        fetchAboutUsStaticInfo,
  }) {
    return fetchAboutUsStaticInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_FetchAboutUsInfo value)? fetchAboutUsInfo,
    TResult? Function(_FetchAboutUsStaticInfo value)? fetchAboutUsStaticInfo,
  }) {
    return fetchAboutUsStaticInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_FetchAboutUsInfo value)? fetchAboutUsInfo,
    TResult Function(_FetchAboutUsStaticInfo value)? fetchAboutUsStaticInfo,
    required TResult orElse(),
  }) {
    if (fetchAboutUsStaticInfo != null) {
      return fetchAboutUsStaticInfo(this);
    }
    return orElse();
  }
}

abstract class _FetchAboutUsStaticInfo implements AboutUsEvent {
  const factory _FetchAboutUsStaticInfo() = _$_FetchAboutUsStaticInfo;
}

/// @nodoc
mixin _$AboutUsState {
  SalesOrg get salesOrg => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  AboutUs get aboutUsInfo => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AboutUsStateCopyWith<AboutUsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutUsStateCopyWith<$Res> {
  factory $AboutUsStateCopyWith(
          AboutUsState value, $Res Function(AboutUsState) then) =
      _$AboutUsStateCopyWithImpl<$Res, AboutUsState>;
  @useResult
  $Res call(
      {SalesOrg salesOrg,
      bool isFetching,
      AboutUs aboutUsInfo,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});

  $AboutUsCopyWith<$Res> get aboutUsInfo;
}

/// @nodoc
class _$AboutUsStateCopyWithImpl<$Res, $Val extends AboutUsState>
    implements $AboutUsStateCopyWith<$Res> {
  _$AboutUsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? isFetching = null,
    Object? aboutUsInfo = null,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      aboutUsInfo: null == aboutUsInfo
          ? _value.aboutUsInfo
          : aboutUsInfo // ignore: cast_nullable_to_non_nullable
              as AboutUs,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AboutUsCopyWith<$Res> get aboutUsInfo {
    return $AboutUsCopyWith<$Res>(_value.aboutUsInfo, (value) {
      return _then(_value.copyWith(aboutUsInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AboutUsStateCopyWith<$Res>
    implements $AboutUsStateCopyWith<$Res> {
  factory _$$_AboutUsStateCopyWith(
          _$_AboutUsState value, $Res Function(_$_AboutUsState) then) =
      __$$_AboutUsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SalesOrg salesOrg,
      bool isFetching,
      AboutUs aboutUsInfo,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});

  @override
  $AboutUsCopyWith<$Res> get aboutUsInfo;
}

/// @nodoc
class __$$_AboutUsStateCopyWithImpl<$Res>
    extends _$AboutUsStateCopyWithImpl<$Res, _$_AboutUsState>
    implements _$$_AboutUsStateCopyWith<$Res> {
  __$$_AboutUsStateCopyWithImpl(
      _$_AboutUsState _value, $Res Function(_$_AboutUsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? isFetching = null,
    Object? aboutUsInfo = null,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_$_AboutUsState(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      aboutUsInfo: null == aboutUsInfo
          ? _value.aboutUsInfo
          : aboutUsInfo // ignore: cast_nullable_to_non_nullable
              as AboutUs,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_AboutUsState implements _AboutUsState {
  const _$_AboutUsState(
      {required this.salesOrg,
      required this.isFetching,
      required this.aboutUsInfo,
      required this.apiFailureOrSuccessOption});

  @override
  final SalesOrg salesOrg;
  @override
  final bool isFetching;
  @override
  final AboutUs aboutUsInfo;
  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;

  @override
  String toString() {
    return 'AboutUsState(salesOrg: $salesOrg, isFetching: $isFetching, aboutUsInfo: $aboutUsInfo, apiFailureOrSuccessOption: $apiFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AboutUsState &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.aboutUsInfo, aboutUsInfo) ||
                other.aboutUsInfo == aboutUsInfo) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg, isFetching,
      aboutUsInfo, apiFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AboutUsStateCopyWith<_$_AboutUsState> get copyWith =>
      __$$_AboutUsStateCopyWithImpl<_$_AboutUsState>(this, _$identity);
}

abstract class _AboutUsState implements AboutUsState {
  const factory _AboutUsState(
      {required final SalesOrg salesOrg,
      required final bool isFetching,
      required final AboutUs aboutUsInfo,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption}) = _$_AboutUsState;

  @override
  SalesOrg get salesOrg;
  @override
  bool get isFetching;
  @override
  AboutUs get aboutUsInfo;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_AboutUsStateCopyWith<_$_AboutUsState> get copyWith =>
      throw _privateConstructorUsedError;
}
