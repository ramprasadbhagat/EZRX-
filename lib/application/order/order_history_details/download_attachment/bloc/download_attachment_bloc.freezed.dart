// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'download_attachment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DownloadAttachmentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            Map<String, String> files, FileFetchMode fetchMode)
        downloadFile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(Map<String, String> files, FileFetchMode fetchMode)?
        downloadFile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(Map<String, String> files, FileFetchMode fetchMode)?
        downloadFile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_DownloadFile value) downloadFile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_DownloadFile value)? downloadFile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_DownloadFile value)? downloadFile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadAttachmentEventCopyWith<$Res> {
  factory $DownloadAttachmentEventCopyWith(DownloadAttachmentEvent value,
          $Res Function(DownloadAttachmentEvent) then) =
      _$DownloadAttachmentEventCopyWithImpl<$Res, DownloadAttachmentEvent>;
}

/// @nodoc
class _$DownloadAttachmentEventCopyWithImpl<$Res,
        $Val extends DownloadAttachmentEvent>
    implements $DownloadAttachmentEventCopyWith<$Res> {
  _$DownloadAttachmentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$DownloadAttachmentEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized();

  @override
  String toString() {
    return 'DownloadAttachmentEvent.initialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            Map<String, String> files, FileFetchMode fetchMode)
        downloadFile,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(Map<String, String> files, FileFetchMode fetchMode)?
        downloadFile,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(Map<String, String> files, FileFetchMode fetchMode)?
        downloadFile,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_DownloadFile value) downloadFile,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_DownloadFile value)? downloadFile,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_DownloadFile value)? downloadFile,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements DownloadAttachmentEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_DownloadFileCopyWith<$Res> {
  factory _$$_DownloadFileCopyWith(
          _$_DownloadFile value, $Res Function(_$_DownloadFile) then) =
      __$$_DownloadFileCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, String> files, FileFetchMode fetchMode});
}

/// @nodoc
class __$$_DownloadFileCopyWithImpl<$Res>
    extends _$DownloadAttachmentEventCopyWithImpl<$Res, _$_DownloadFile>
    implements _$$_DownloadFileCopyWith<$Res> {
  __$$_DownloadFileCopyWithImpl(
      _$_DownloadFile _value, $Res Function(_$_DownloadFile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? files = null,
    Object? fetchMode = null,
  }) {
    return _then(_$_DownloadFile(
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      fetchMode: null == fetchMode
          ? _value.fetchMode
          : fetchMode // ignore: cast_nullable_to_non_nullable
              as FileFetchMode,
    ));
  }
}

/// @nodoc

class _$_DownloadFile implements _DownloadFile {
  const _$_DownloadFile(
      {required final Map<String, String> files, required this.fetchMode})
      : _files = files;

  final Map<String, String> _files;
  @override
  Map<String, String> get files {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_files);
  }

  @override
  final FileFetchMode fetchMode;

  @override
  String toString() {
    return 'DownloadAttachmentEvent.downloadFile(files: $files, fetchMode: $fetchMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DownloadFile &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.fetchMode, fetchMode) ||
                other.fetchMode == fetchMode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_files), fetchMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DownloadFileCopyWith<_$_DownloadFile> get copyWith =>
      __$$_DownloadFileCopyWithImpl<_$_DownloadFile>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            Map<String, String> files, FileFetchMode fetchMode)
        downloadFile,
  }) {
    return downloadFile(files, fetchMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(Map<String, String> files, FileFetchMode fetchMode)?
        downloadFile,
  }) {
    return downloadFile?.call(files, fetchMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(Map<String, String> files, FileFetchMode fetchMode)?
        downloadFile,
    required TResult orElse(),
  }) {
    if (downloadFile != null) {
      return downloadFile(files, fetchMode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_DownloadFile value) downloadFile,
  }) {
    return downloadFile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_DownloadFile value)? downloadFile,
  }) {
    return downloadFile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_DownloadFile value)? downloadFile,
    required TResult orElse(),
  }) {
    if (downloadFile != null) {
      return downloadFile(this);
    }
    return orElse();
  }
}

abstract class _DownloadFile implements DownloadAttachmentEvent {
  const factory _DownloadFile(
      {required final Map<String, String> files,
      required final FileFetchMode fetchMode}) = _$_DownloadFile;

  Map<String, String> get files;
  FileFetchMode get fetchMode;
  @JsonKey(ignore: true)
  _$$_DownloadFileCopyWith<_$_DownloadFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DownloadAttachmentState {
  List<OrderHistoryDetailsPoDocumentsBuffer> get fileData =>
      throw _privateConstructorUsedError;
  FileFetchMode get fileFetchMode => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DownloadAttachmentStateCopyWith<DownloadAttachmentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadAttachmentStateCopyWith<$Res> {
  factory $DownloadAttachmentStateCopyWith(DownloadAttachmentState value,
          $Res Function(DownloadAttachmentState) then) =
      _$DownloadAttachmentStateCopyWithImpl<$Res, DownloadAttachmentState>;
  @useResult
  $Res call(
      {List<OrderHistoryDetailsPoDocumentsBuffer> fileData,
      FileFetchMode fileFetchMode,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});
}

/// @nodoc
class _$DownloadAttachmentStateCopyWithImpl<$Res,
        $Val extends DownloadAttachmentState>
    implements $DownloadAttachmentStateCopyWith<$Res> {
  _$DownloadAttachmentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileData = null,
    Object? fileFetchMode = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      fileData: null == fileData
          ? _value.fileData
          : fileData // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsPoDocumentsBuffer>,
      fileFetchMode: null == fileFetchMode
          ? _value.fileFetchMode
          : fileFetchMode // ignore: cast_nullable_to_non_nullable
              as FileFetchMode,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DownloadAttachmentStateCopyWith<$Res>
    implements $DownloadAttachmentStateCopyWith<$Res> {
  factory _$$_DownloadAttachmentStateCopyWith(_$_DownloadAttachmentState value,
          $Res Function(_$_DownloadAttachmentState) then) =
      __$$_DownloadAttachmentStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<OrderHistoryDetailsPoDocumentsBuffer> fileData,
      FileFetchMode fileFetchMode,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});
}

/// @nodoc
class __$$_DownloadAttachmentStateCopyWithImpl<$Res>
    extends _$DownloadAttachmentStateCopyWithImpl<$Res,
        _$_DownloadAttachmentState>
    implements _$$_DownloadAttachmentStateCopyWith<$Res> {
  __$$_DownloadAttachmentStateCopyWithImpl(_$_DownloadAttachmentState _value,
      $Res Function(_$_DownloadAttachmentState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileData = null,
    Object? fileFetchMode = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_$_DownloadAttachmentState(
      fileData: null == fileData
          ? _value._fileData
          : fileData // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsPoDocumentsBuffer>,
      fileFetchMode: null == fileFetchMode
          ? _value.fileFetchMode
          : fileFetchMode // ignore: cast_nullable_to_non_nullable
              as FileFetchMode,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_DownloadAttachmentState implements _DownloadAttachmentState {
  const _$_DownloadAttachmentState(
      {required final List<OrderHistoryDetailsPoDocumentsBuffer> fileData,
      required this.fileFetchMode,
      required this.failureOrSuccessOption})
      : _fileData = fileData;

  final List<OrderHistoryDetailsPoDocumentsBuffer> _fileData;
  @override
  List<OrderHistoryDetailsPoDocumentsBuffer> get fileData {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fileData);
  }

  @override
  final FileFetchMode fileFetchMode;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;

  @override
  String toString() {
    return 'DownloadAttachmentState(fileData: $fileData, fileFetchMode: $fileFetchMode, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DownloadAttachmentState &&
            const DeepCollectionEquality().equals(other._fileData, _fileData) &&
            (identical(other.fileFetchMode, fileFetchMode) ||
                other.fileFetchMode == fileFetchMode) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_fileData),
      fileFetchMode,
      failureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DownloadAttachmentStateCopyWith<_$_DownloadAttachmentState>
      get copyWith =>
          __$$_DownloadAttachmentStateCopyWithImpl<_$_DownloadAttachmentState>(
              this, _$identity);
}

abstract class _DownloadAttachmentState implements DownloadAttachmentState {
  const factory _DownloadAttachmentState(
      {required final List<OrderHistoryDetailsPoDocumentsBuffer> fileData,
      required final FileFetchMode fileFetchMode,
      required final Option<Either<ApiFailure, dynamic>>
          failureOrSuccessOption}) = _$_DownloadAttachmentState;

  @override
  List<OrderHistoryDetailsPoDocumentsBuffer> get fileData;
  @override
  FileFetchMode get fileFetchMode;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_DownloadAttachmentStateCopyWith<_$_DownloadAttachmentState>
      get copyWith => throw _privateConstructorUsedError;
}
