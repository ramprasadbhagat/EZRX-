// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'return_summary_request_information.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReturnSummaryRequestInformation {
  RequestHeader get requestHeader => throw _privateConstructorUsedError;
  List<RequestInfo> get requestInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnSummaryRequestInformationCopyWith<ReturnSummaryRequestInformation>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnSummaryRequestInformationCopyWith<$Res> {
  factory $ReturnSummaryRequestInformationCopyWith(
          ReturnSummaryRequestInformation value,
          $Res Function(ReturnSummaryRequestInformation) then) =
      _$ReturnSummaryRequestInformationCopyWithImpl<$Res,
          ReturnSummaryRequestInformation>;
  @useResult
  $Res call({RequestHeader requestHeader, List<RequestInfo> requestInfo});

  $RequestHeaderCopyWith<$Res> get requestHeader;
}

/// @nodoc
class _$ReturnSummaryRequestInformationCopyWithImpl<$Res,
        $Val extends ReturnSummaryRequestInformation>
    implements $ReturnSummaryRequestInformationCopyWith<$Res> {
  _$ReturnSummaryRequestInformationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestHeader = null,
    Object? requestInfo = null,
  }) {
    return _then(_value.copyWith(
      requestHeader: null == requestHeader
          ? _value.requestHeader
          : requestHeader // ignore: cast_nullable_to_non_nullable
              as RequestHeader,
      requestInfo: null == requestInfo
          ? _value.requestInfo
          : requestInfo // ignore: cast_nullable_to_non_nullable
              as List<RequestInfo>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RequestHeaderCopyWith<$Res> get requestHeader {
    return $RequestHeaderCopyWith<$Res>(_value.requestHeader, (value) {
      return _then(_value.copyWith(requestHeader: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReturnSummaryRequestInformationCopyWith<$Res>
    implements $ReturnSummaryRequestInformationCopyWith<$Res> {
  factory _$$_ReturnSummaryRequestInformationCopyWith(
          _$_ReturnSummaryRequestInformation value,
          $Res Function(_$_ReturnSummaryRequestInformation) then) =
      __$$_ReturnSummaryRequestInformationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RequestHeader requestHeader, List<RequestInfo> requestInfo});

  @override
  $RequestHeaderCopyWith<$Res> get requestHeader;
}

/// @nodoc
class __$$_ReturnSummaryRequestInformationCopyWithImpl<$Res>
    extends _$ReturnSummaryRequestInformationCopyWithImpl<$Res,
        _$_ReturnSummaryRequestInformation>
    implements _$$_ReturnSummaryRequestInformationCopyWith<$Res> {
  __$$_ReturnSummaryRequestInformationCopyWithImpl(
      _$_ReturnSummaryRequestInformation _value,
      $Res Function(_$_ReturnSummaryRequestInformation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestHeader = null,
    Object? requestInfo = null,
  }) {
    return _then(_$_ReturnSummaryRequestInformation(
      requestHeader: null == requestHeader
          ? _value.requestHeader
          : requestHeader // ignore: cast_nullable_to_non_nullable
              as RequestHeader,
      requestInfo: null == requestInfo
          ? _value._requestInfo
          : requestInfo // ignore: cast_nullable_to_non_nullable
              as List<RequestInfo>,
    ));
  }
}

/// @nodoc

class _$_ReturnSummaryRequestInformation
    extends _ReturnSummaryRequestInformation {
  const _$_ReturnSummaryRequestInformation(
      {required this.requestHeader,
      required final List<RequestInfo> requestInfo})
      : _requestInfo = requestInfo,
        super._();

  @override
  final RequestHeader requestHeader;
  final List<RequestInfo> _requestInfo;
  @override
  List<RequestInfo> get requestInfo {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requestInfo);
  }

  @override
  String toString() {
    return 'ReturnSummaryRequestInformation(requestHeader: $requestHeader, requestInfo: $requestInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnSummaryRequestInformation &&
            (identical(other.requestHeader, requestHeader) ||
                other.requestHeader == requestHeader) &&
            const DeepCollectionEquality()
                .equals(other._requestInfo, _requestInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestHeader,
      const DeepCollectionEquality().hash(_requestInfo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnSummaryRequestInformationCopyWith<
          _$_ReturnSummaryRequestInformation>
      get copyWith => __$$_ReturnSummaryRequestInformationCopyWithImpl<
          _$_ReturnSummaryRequestInformation>(this, _$identity);
}

abstract class _ReturnSummaryRequestInformation
    extends ReturnSummaryRequestInformation {
  const factory _ReturnSummaryRequestInformation(
          {required final RequestHeader requestHeader,
          required final List<RequestInfo> requestInfo}) =
      _$_ReturnSummaryRequestInformation;
  const _ReturnSummaryRequestInformation._() : super._();

  @override
  RequestHeader get requestHeader;
  @override
  List<RequestInfo> get requestInfo;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnSummaryRequestInformationCopyWith<
          _$_ReturnSummaryRequestInformation>
      get copyWith => throw _privateConstructorUsedError;
}
