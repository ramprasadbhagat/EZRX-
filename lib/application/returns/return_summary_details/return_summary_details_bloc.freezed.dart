// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_summary_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReturnSummaryDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(ReturnRequestsId returnId) fetch,
    required TResult Function(ReturnRequestAttachment file) downloadFile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(ReturnRequestsId returnId)? fetch,
    TResult? Function(ReturnRequestAttachment file)? downloadFile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(ReturnRequestsId returnId)? fetch,
    TResult Function(ReturnRequestAttachment file)? downloadFile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_DownloadFile value) downloadFile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_DownloadFile value)? downloadFile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_DownloadFile value)? downloadFile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnSummaryDetailsEventCopyWith<$Res> {
  factory $ReturnSummaryDetailsEventCopyWith(ReturnSummaryDetailsEvent value,
          $Res Function(ReturnSummaryDetailsEvent) then) =
      _$ReturnSummaryDetailsEventCopyWithImpl<$Res, ReturnSummaryDetailsEvent>;
}

/// @nodoc
class _$ReturnSummaryDetailsEventCopyWithImpl<$Res,
        $Val extends ReturnSummaryDetailsEvent>
    implements $ReturnSummaryDetailsEventCopyWith<$Res> {
  _$ReturnSummaryDetailsEventCopyWithImpl(this._value, this._then);

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
    extends _$ReturnSummaryDetailsEventCopyWithImpl<$Res, _$_Initialized>
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
    return 'ReturnSummaryDetailsEvent.initialized()';
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
    required TResult Function(ReturnRequestsId returnId) fetch,
    required TResult Function(ReturnRequestAttachment file) downloadFile,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(ReturnRequestsId returnId)? fetch,
    TResult? Function(ReturnRequestAttachment file)? downloadFile,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(ReturnRequestsId returnId)? fetch,
    TResult Function(ReturnRequestAttachment file)? downloadFile,
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
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_DownloadFile value) downloadFile,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_DownloadFile value)? downloadFile,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_DownloadFile value)? downloadFile,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements ReturnSummaryDetailsEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call({ReturnRequestsId returnId});

  $ReturnRequestsIdCopyWith<$Res> get returnId;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$ReturnSummaryDetailsEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnId = null,
  }) {
    return _then(_$_Fetch(
      returnId: null == returnId
          ? _value.returnId
          : returnId // ignore: cast_nullable_to_non_nullable
              as ReturnRequestsId,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnRequestsIdCopyWith<$Res> get returnId {
    return $ReturnRequestsIdCopyWith<$Res>(_value.returnId, (value) {
      return _then(_value.copyWith(returnId: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch({required this.returnId});

  @override
  final ReturnRequestsId returnId;

  @override
  String toString() {
    return 'ReturnSummaryDetailsEvent.fetch(returnId: $returnId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.returnId, returnId) ||
                other.returnId == returnId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, returnId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(ReturnRequestsId returnId) fetch,
    required TResult Function(ReturnRequestAttachment file) downloadFile,
  }) {
    return fetch(returnId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(ReturnRequestsId returnId)? fetch,
    TResult? Function(ReturnRequestAttachment file)? downloadFile,
  }) {
    return fetch?.call(returnId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(ReturnRequestsId returnId)? fetch,
    TResult Function(ReturnRequestAttachment file)? downloadFile,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(returnId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_DownloadFile value) downloadFile,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_DownloadFile value)? downloadFile,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_DownloadFile value)? downloadFile,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements ReturnSummaryDetailsEvent {
  const factory _Fetch({required final ReturnRequestsId returnId}) = _$_Fetch;

  ReturnRequestsId get returnId;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DownloadFileCopyWith<$Res> {
  factory _$$_DownloadFileCopyWith(
          _$_DownloadFile value, $Res Function(_$_DownloadFile) then) =
      __$$_DownloadFileCopyWithImpl<$Res>;
  @useResult
  $Res call({ReturnRequestAttachment file});

  $ReturnRequestAttachmentCopyWith<$Res> get file;
}

/// @nodoc
class __$$_DownloadFileCopyWithImpl<$Res>
    extends _$ReturnSummaryDetailsEventCopyWithImpl<$Res, _$_DownloadFile>
    implements _$$_DownloadFileCopyWith<$Res> {
  __$$_DownloadFileCopyWithImpl(
      _$_DownloadFile _value, $Res Function(_$_DownloadFile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_$_DownloadFile(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as ReturnRequestAttachment,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnRequestAttachmentCopyWith<$Res> get file {
    return $ReturnRequestAttachmentCopyWith<$Res>(_value.file, (value) {
      return _then(_value.copyWith(file: value));
    });
  }
}

/// @nodoc

class _$_DownloadFile implements _DownloadFile {
  const _$_DownloadFile({required this.file});

  @override
  final ReturnRequestAttachment file;

  @override
  String toString() {
    return 'ReturnSummaryDetailsEvent.downloadFile(file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DownloadFile &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DownloadFileCopyWith<_$_DownloadFile> get copyWith =>
      __$$_DownloadFileCopyWithImpl<_$_DownloadFile>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(ReturnRequestsId returnId) fetch,
    required TResult Function(ReturnRequestAttachment file) downloadFile,
  }) {
    return downloadFile(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(ReturnRequestsId returnId)? fetch,
    TResult? Function(ReturnRequestAttachment file)? downloadFile,
  }) {
    return downloadFile?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(ReturnRequestsId returnId)? fetch,
    TResult Function(ReturnRequestAttachment file)? downloadFile,
    required TResult orElse(),
  }) {
    if (downloadFile != null) {
      return downloadFile(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_DownloadFile value) downloadFile,
  }) {
    return downloadFile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_DownloadFile value)? downloadFile,
  }) {
    return downloadFile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_DownloadFile value)? downloadFile,
    required TResult orElse(),
  }) {
    if (downloadFile != null) {
      return downloadFile(this);
    }
    return orElse();
  }
}

abstract class _DownloadFile implements ReturnSummaryDetailsEvent {
  const factory _DownloadFile({required final ReturnRequestAttachment file}) =
      _$_DownloadFile;

  ReturnRequestAttachment get file;
  @JsonKey(ignore: true)
  _$$_DownloadFileCopyWith<_$_DownloadFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReturnSummaryDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  ReturnRequestInformation get requestInformation =>
      throw _privateConstructorUsedError;
  ReturnRequestInformationHeader get requestInformationHeader =>
      throw _privateConstructorUsedError;
  List<ReturnRequestAttachment> get downloadingAttachments =>
      throw _privateConstructorUsedError;
  ReturnRequestAttachment get downloadedAttachment =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get downloadFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnSummaryDetailsStateCopyWith<ReturnSummaryDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnSummaryDetailsStateCopyWith<$Res> {
  factory $ReturnSummaryDetailsStateCopyWith(ReturnSummaryDetailsState value,
          $Res Function(ReturnSummaryDetailsState) then) =
      _$ReturnSummaryDetailsStateCopyWithImpl<$Res, ReturnSummaryDetailsState>;
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      ReturnRequestInformation requestInformation,
      ReturnRequestInformationHeader requestInformationHeader,
      List<ReturnRequestAttachment> downloadingAttachments,
      ReturnRequestAttachment downloadedAttachment,
      Option<Either<ApiFailure, dynamic>> downloadFailureOrSuccessOption});

  $ReturnRequestInformationCopyWith<$Res> get requestInformation;
  $ReturnRequestInformationHeaderCopyWith<$Res> get requestInformationHeader;
  $ReturnRequestAttachmentCopyWith<$Res> get downloadedAttachment;
}

/// @nodoc
class _$ReturnSummaryDetailsStateCopyWithImpl<$Res,
        $Val extends ReturnSummaryDetailsState>
    implements $ReturnSummaryDetailsStateCopyWith<$Res> {
  _$ReturnSummaryDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? failureOrSuccessOption = null,
    Object? requestInformation = null,
    Object? requestInformationHeader = null,
    Object? downloadingAttachments = null,
    Object? downloadedAttachment = null,
    Object? downloadFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      requestInformation: null == requestInformation
          ? _value.requestInformation
          : requestInformation // ignore: cast_nullable_to_non_nullable
              as ReturnRequestInformation,
      requestInformationHeader: null == requestInformationHeader
          ? _value.requestInformationHeader
          : requestInformationHeader // ignore: cast_nullable_to_non_nullable
              as ReturnRequestInformationHeader,
      downloadingAttachments: null == downloadingAttachments
          ? _value.downloadingAttachments
          : downloadingAttachments // ignore: cast_nullable_to_non_nullable
              as List<ReturnRequestAttachment>,
      downloadedAttachment: null == downloadedAttachment
          ? _value.downloadedAttachment
          : downloadedAttachment // ignore: cast_nullable_to_non_nullable
              as ReturnRequestAttachment,
      downloadFailureOrSuccessOption: null == downloadFailureOrSuccessOption
          ? _value.downloadFailureOrSuccessOption
          : downloadFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnRequestInformationCopyWith<$Res> get requestInformation {
    return $ReturnRequestInformationCopyWith<$Res>(_value.requestInformation,
        (value) {
      return _then(_value.copyWith(requestInformation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnRequestInformationHeaderCopyWith<$Res> get requestInformationHeader {
    return $ReturnRequestInformationHeaderCopyWith<$Res>(
        _value.requestInformationHeader, (value) {
      return _then(_value.copyWith(requestInformationHeader: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnRequestAttachmentCopyWith<$Res> get downloadedAttachment {
    return $ReturnRequestAttachmentCopyWith<$Res>(_value.downloadedAttachment,
        (value) {
      return _then(_value.copyWith(downloadedAttachment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReturnSummaryDetailsStateCopyWith<$Res>
    implements $ReturnSummaryDetailsStateCopyWith<$Res> {
  factory _$$_ReturnSummaryDetailsStateCopyWith(
          _$_ReturnSummaryDetailsState value,
          $Res Function(_$_ReturnSummaryDetailsState) then) =
      __$$_ReturnSummaryDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      ReturnRequestInformation requestInformation,
      ReturnRequestInformationHeader requestInformationHeader,
      List<ReturnRequestAttachment> downloadingAttachments,
      ReturnRequestAttachment downloadedAttachment,
      Option<Either<ApiFailure, dynamic>> downloadFailureOrSuccessOption});

  @override
  $ReturnRequestInformationCopyWith<$Res> get requestInformation;
  @override
  $ReturnRequestInformationHeaderCopyWith<$Res> get requestInformationHeader;
  @override
  $ReturnRequestAttachmentCopyWith<$Res> get downloadedAttachment;
}

/// @nodoc
class __$$_ReturnSummaryDetailsStateCopyWithImpl<$Res>
    extends _$ReturnSummaryDetailsStateCopyWithImpl<$Res,
        _$_ReturnSummaryDetailsState>
    implements _$$_ReturnSummaryDetailsStateCopyWith<$Res> {
  __$$_ReturnSummaryDetailsStateCopyWithImpl(
      _$_ReturnSummaryDetailsState _value,
      $Res Function(_$_ReturnSummaryDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? failureOrSuccessOption = null,
    Object? requestInformation = null,
    Object? requestInformationHeader = null,
    Object? downloadingAttachments = null,
    Object? downloadedAttachment = null,
    Object? downloadFailureOrSuccessOption = null,
  }) {
    return _then(_$_ReturnSummaryDetailsState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      requestInformation: null == requestInformation
          ? _value.requestInformation
          : requestInformation // ignore: cast_nullable_to_non_nullable
              as ReturnRequestInformation,
      requestInformationHeader: null == requestInformationHeader
          ? _value.requestInformationHeader
          : requestInformationHeader // ignore: cast_nullable_to_non_nullable
              as ReturnRequestInformationHeader,
      downloadingAttachments: null == downloadingAttachments
          ? _value._downloadingAttachments
          : downloadingAttachments // ignore: cast_nullable_to_non_nullable
              as List<ReturnRequestAttachment>,
      downloadedAttachment: null == downloadedAttachment
          ? _value.downloadedAttachment
          : downloadedAttachment // ignore: cast_nullable_to_non_nullable
              as ReturnRequestAttachment,
      downloadFailureOrSuccessOption: null == downloadFailureOrSuccessOption
          ? _value.downloadFailureOrSuccessOption
          : downloadFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_ReturnSummaryDetailsState implements _ReturnSummaryDetailsState {
  const _$_ReturnSummaryDetailsState(
      {required this.isLoading,
      required this.failureOrSuccessOption,
      required this.requestInformation,
      required this.requestInformationHeader,
      required final List<ReturnRequestAttachment> downloadingAttachments,
      required this.downloadedAttachment,
      required this.downloadFailureOrSuccessOption})
      : _downloadingAttachments = downloadingAttachments;

  @override
  final bool isLoading;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  @override
  final ReturnRequestInformation requestInformation;
  @override
  final ReturnRequestInformationHeader requestInformationHeader;
  final List<ReturnRequestAttachment> _downloadingAttachments;
  @override
  List<ReturnRequestAttachment> get downloadingAttachments {
    if (_downloadingAttachments is EqualUnmodifiableListView)
      return _downloadingAttachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_downloadingAttachments);
  }

  @override
  final ReturnRequestAttachment downloadedAttachment;
  @override
  final Option<Either<ApiFailure, dynamic>> downloadFailureOrSuccessOption;

  @override
  String toString() {
    return 'ReturnSummaryDetailsState(isLoading: $isLoading, failureOrSuccessOption: $failureOrSuccessOption, requestInformation: $requestInformation, requestInformationHeader: $requestInformationHeader, downloadingAttachments: $downloadingAttachments, downloadedAttachment: $downloadedAttachment, downloadFailureOrSuccessOption: $downloadFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnSummaryDetailsState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.requestInformation, requestInformation) ||
                other.requestInformation == requestInformation) &&
            (identical(
                    other.requestInformationHeader, requestInformationHeader) ||
                other.requestInformationHeader == requestInformationHeader) &&
            const DeepCollectionEquality().equals(
                other._downloadingAttachments, _downloadingAttachments) &&
            (identical(other.downloadedAttachment, downloadedAttachment) ||
                other.downloadedAttachment == downloadedAttachment) &&
            (identical(other.downloadFailureOrSuccessOption,
                    downloadFailureOrSuccessOption) ||
                other.downloadFailureOrSuccessOption ==
                    downloadFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      failureOrSuccessOption,
      requestInformation,
      requestInformationHeader,
      const DeepCollectionEquality().hash(_downloadingAttachments),
      downloadedAttachment,
      downloadFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnSummaryDetailsStateCopyWith<_$_ReturnSummaryDetailsState>
      get copyWith => __$$_ReturnSummaryDetailsStateCopyWithImpl<
          _$_ReturnSummaryDetailsState>(this, _$identity);
}

abstract class _ReturnSummaryDetailsState implements ReturnSummaryDetailsState {
  const factory _ReturnSummaryDetailsState(
      {required final bool isLoading,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final ReturnRequestInformation requestInformation,
      required final ReturnRequestInformationHeader requestInformationHeader,
      required final List<ReturnRequestAttachment> downloadingAttachments,
      required final ReturnRequestAttachment downloadedAttachment,
      required final Option<Either<ApiFailure, dynamic>>
          downloadFailureOrSuccessOption}) = _$_ReturnSummaryDetailsState;

  @override
  bool get isLoading;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  ReturnRequestInformation get requestInformation;
  @override
  ReturnRequestInformationHeader get requestInformationHeader;
  @override
  List<ReturnRequestAttachment> get downloadingAttachments;
  @override
  ReturnRequestAttachment get downloadedAttachment;
  @override
  Option<Either<ApiFailure, dynamic>> get downloadFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnSummaryDetailsStateCopyWith<_$_ReturnSummaryDetailsState>
      get copyWith => throw _privateConstructorUsedError;
}
