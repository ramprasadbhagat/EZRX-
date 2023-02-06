// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'return_summary_request_information_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReturnSummaryRequestInformationDto _$ReturnSummaryRequestInformationDtoFromJson(
    Map<String, dynamic> json) {
  return _ReturnSummaryRequestInformationDto.fromJson(json);
}

/// @nodoc
mixin _$ReturnSummaryRequestInformationDto {
  @JsonKey(name: 'requestHeader', readValue: requestHeaderOverride)
  RequestHeaderDto get requestHeaderDto => throw _privateConstructorUsedError;
  @JsonKey(name: 'requestInformationV2', defaultValue: [])
  List<RequestInfoDto> get requestInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReturnSummaryRequestInformationDtoCopyWith<
          ReturnSummaryRequestInformationDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnSummaryRequestInformationDtoCopyWith<$Res> {
  factory $ReturnSummaryRequestInformationDtoCopyWith(
          ReturnSummaryRequestInformationDto value,
          $Res Function(ReturnSummaryRequestInformationDto) then) =
      _$ReturnSummaryRequestInformationDtoCopyWithImpl<$Res,
          ReturnSummaryRequestInformationDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'requestHeader', readValue: requestHeaderOverride)
          RequestHeaderDto requestHeaderDto,
      @JsonKey(name: 'requestInformationV2', defaultValue: [])
          List<RequestInfoDto> requestInfo});

  $RequestHeaderDtoCopyWith<$Res> get requestHeaderDto;
}

/// @nodoc
class _$ReturnSummaryRequestInformationDtoCopyWithImpl<$Res,
        $Val extends ReturnSummaryRequestInformationDto>
    implements $ReturnSummaryRequestInformationDtoCopyWith<$Res> {
  _$ReturnSummaryRequestInformationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestHeaderDto = null,
    Object? requestInfo = null,
  }) {
    return _then(_value.copyWith(
      requestHeaderDto: null == requestHeaderDto
          ? _value.requestHeaderDto
          : requestHeaderDto // ignore: cast_nullable_to_non_nullable
              as RequestHeaderDto,
      requestInfo: null == requestInfo
          ? _value.requestInfo
          : requestInfo // ignore: cast_nullable_to_non_nullable
              as List<RequestInfoDto>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RequestHeaderDtoCopyWith<$Res> get requestHeaderDto {
    return $RequestHeaderDtoCopyWith<$Res>(_value.requestHeaderDto, (value) {
      return _then(_value.copyWith(requestHeaderDto: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReturnSummaryRequestInformationDtoCopyWith<$Res>
    implements $ReturnSummaryRequestInformationDtoCopyWith<$Res> {
  factory _$$_ReturnSummaryRequestInformationDtoCopyWith(
          _$_ReturnSummaryRequestInformationDto value,
          $Res Function(_$_ReturnSummaryRequestInformationDto) then) =
      __$$_ReturnSummaryRequestInformationDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'requestHeader', readValue: requestHeaderOverride)
          RequestHeaderDto requestHeaderDto,
      @JsonKey(name: 'requestInformationV2', defaultValue: [])
          List<RequestInfoDto> requestInfo});

  @override
  $RequestHeaderDtoCopyWith<$Res> get requestHeaderDto;
}

/// @nodoc
class __$$_ReturnSummaryRequestInformationDtoCopyWithImpl<$Res>
    extends _$ReturnSummaryRequestInformationDtoCopyWithImpl<$Res,
        _$_ReturnSummaryRequestInformationDto>
    implements _$$_ReturnSummaryRequestInformationDtoCopyWith<$Res> {
  __$$_ReturnSummaryRequestInformationDtoCopyWithImpl(
      _$_ReturnSummaryRequestInformationDto _value,
      $Res Function(_$_ReturnSummaryRequestInformationDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestHeaderDto = null,
    Object? requestInfo = null,
  }) {
    return _then(_$_ReturnSummaryRequestInformationDto(
      requestHeaderDto: null == requestHeaderDto
          ? _value.requestHeaderDto
          : requestHeaderDto // ignore: cast_nullable_to_non_nullable
              as RequestHeaderDto,
      requestInfo: null == requestInfo
          ? _value._requestInfo
          : requestInfo // ignore: cast_nullable_to_non_nullable
              as List<RequestInfoDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReturnSummaryRequestInformationDto
    extends _ReturnSummaryRequestInformationDto {
  const _$_ReturnSummaryRequestInformationDto(
      {@JsonKey(name: 'requestHeader', readValue: requestHeaderOverride)
          required this.requestHeaderDto,
      @JsonKey(name: 'requestInformationV2', defaultValue: [])
          required final List<RequestInfoDto> requestInfo})
      : _requestInfo = requestInfo,
        super._();

  factory _$_ReturnSummaryRequestInformationDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_ReturnSummaryRequestInformationDtoFromJson(json);

  @override
  @JsonKey(name: 'requestHeader', readValue: requestHeaderOverride)
  final RequestHeaderDto requestHeaderDto;
  final List<RequestInfoDto> _requestInfo;
  @override
  @JsonKey(name: 'requestInformationV2', defaultValue: [])
  List<RequestInfoDto> get requestInfo {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requestInfo);
  }

  @override
  String toString() {
    return 'ReturnSummaryRequestInformationDto(requestHeaderDto: $requestHeaderDto, requestInfo: $requestInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnSummaryRequestInformationDto &&
            (identical(other.requestHeaderDto, requestHeaderDto) ||
                other.requestHeaderDto == requestHeaderDto) &&
            const DeepCollectionEquality()
                .equals(other._requestInfo, _requestInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, requestHeaderDto,
      const DeepCollectionEquality().hash(_requestInfo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnSummaryRequestInformationDtoCopyWith<
          _$_ReturnSummaryRequestInformationDto>
      get copyWith => __$$_ReturnSummaryRequestInformationDtoCopyWithImpl<
          _$_ReturnSummaryRequestInformationDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReturnSummaryRequestInformationDtoToJson(
      this,
    );
  }
}

abstract class _ReturnSummaryRequestInformationDto
    extends ReturnSummaryRequestInformationDto {
  const factory _ReturnSummaryRequestInformationDto(
          {@JsonKey(name: 'requestHeader', readValue: requestHeaderOverride)
              required final RequestHeaderDto requestHeaderDto,
          @JsonKey(name: 'requestInformationV2', defaultValue: [])
              required final List<RequestInfoDto> requestInfo}) =
      _$_ReturnSummaryRequestInformationDto;
  const _ReturnSummaryRequestInformationDto._() : super._();

  factory _ReturnSummaryRequestInformationDto.fromJson(
          Map<String, dynamic> json) =
      _$_ReturnSummaryRequestInformationDto.fromJson;

  @override
  @JsonKey(name: 'requestHeader', readValue: requestHeaderOverride)
  RequestHeaderDto get requestHeaderDto;
  @override
  @JsonKey(name: 'requestInformationV2', defaultValue: [])
  List<RequestInfoDto> get requestInfo;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnSummaryRequestInformationDtoCopyWith<
          _$_ReturnSummaryRequestInformationDto>
      get copyWith => throw _privateConstructorUsedError;
}
