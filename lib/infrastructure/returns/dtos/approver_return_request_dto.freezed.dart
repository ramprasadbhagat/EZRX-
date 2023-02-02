// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'approver_return_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApproverReturnRequestDto _$ApproverReturnRequestDtoFromJson(
    Map<String, dynamic> json) {
  return _ApproverReturnRequestDto.fromJson(json);
}

/// @nodoc
mixin _$ApproverReturnRequestDto {
  @JsonKey(name: 'requestHeader')
  ApproverReturnRequestInformationHeaderDto get requestHeader =>
      throw _privateConstructorUsedError;
  @JsonKey(
      name: 'requestInformationV2',
      defaultValue: <ApproverReturnRequestInformationDto>[])
  List<ApproverReturnRequestInformationDto> get requestInformation =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApproverReturnRequestDtoCopyWith<ApproverReturnRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApproverReturnRequestDtoCopyWith<$Res> {
  factory $ApproverReturnRequestDtoCopyWith(ApproverReturnRequestDto value,
          $Res Function(ApproverReturnRequestDto) then) =
      _$ApproverReturnRequestDtoCopyWithImpl<$Res, ApproverReturnRequestDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'requestHeader')
          ApproverReturnRequestInformationHeaderDto requestHeader,
      @JsonKey(
          name: 'requestInformationV2', defaultValue: <
              ApproverReturnRequestInformationDto>[])
          List<ApproverReturnRequestInformationDto> requestInformation});

  $ApproverReturnRequestInformationHeaderDtoCopyWith<$Res> get requestHeader;
}

/// @nodoc
class _$ApproverReturnRequestDtoCopyWithImpl<$Res,
        $Val extends ApproverReturnRequestDto>
    implements $ApproverReturnRequestDtoCopyWith<$Res> {
  _$ApproverReturnRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestHeader = null,
    Object? requestInformation = null,
  }) {
    return _then(_value.copyWith(
      requestHeader: null == requestHeader
          ? _value.requestHeader
          : requestHeader // ignore: cast_nullable_to_non_nullable
              as ApproverReturnRequestInformationHeaderDto,
      requestInformation: null == requestInformation
          ? _value.requestInformation
          : requestInformation // ignore: cast_nullable_to_non_nullable
              as List<ApproverReturnRequestInformationDto>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ApproverReturnRequestInformationHeaderDtoCopyWith<$Res> get requestHeader {
    return $ApproverReturnRequestInformationHeaderDtoCopyWith<$Res>(
        _value.requestHeader, (value) {
      return _then(_value.copyWith(requestHeader: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ApproverReturnRequestDtoCopyWith<$Res>
    implements $ApproverReturnRequestDtoCopyWith<$Res> {
  factory _$$_ApproverReturnRequestDtoCopyWith(
          _$_ApproverReturnRequestDto value,
          $Res Function(_$_ApproverReturnRequestDto) then) =
      __$$_ApproverReturnRequestDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'requestHeader')
          ApproverReturnRequestInformationHeaderDto requestHeader,
      @JsonKey(
          name: 'requestInformationV2', defaultValue: <
              ApproverReturnRequestInformationDto>[])
          List<ApproverReturnRequestInformationDto> requestInformation});

  @override
  $ApproverReturnRequestInformationHeaderDtoCopyWith<$Res> get requestHeader;
}

/// @nodoc
class __$$_ApproverReturnRequestDtoCopyWithImpl<$Res>
    extends _$ApproverReturnRequestDtoCopyWithImpl<$Res,
        _$_ApproverReturnRequestDto>
    implements _$$_ApproverReturnRequestDtoCopyWith<$Res> {
  __$$_ApproverReturnRequestDtoCopyWithImpl(_$_ApproverReturnRequestDto _value,
      $Res Function(_$_ApproverReturnRequestDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestHeader = null,
    Object? requestInformation = null,
  }) {
    return _then(_$_ApproverReturnRequestDto(
      requestHeader: null == requestHeader
          ? _value.requestHeader
          : requestHeader // ignore: cast_nullable_to_non_nullable
              as ApproverReturnRequestInformationHeaderDto,
      requestInformation: null == requestInformation
          ? _value._requestInformation
          : requestInformation // ignore: cast_nullable_to_non_nullable
              as List<ApproverReturnRequestInformationDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApproverReturnRequestDto extends _ApproverReturnRequestDto {
  _$_ApproverReturnRequestDto(
      {@JsonKey(name: 'requestHeader')
          required this.requestHeader,
      @JsonKey(
          name: 'requestInformationV2', defaultValue: <
              ApproverReturnRequestInformationDto>[])
          required final List<ApproverReturnRequestInformationDto>
              requestInformation})
      : _requestInformation = requestInformation,
        super._();

  factory _$_ApproverReturnRequestDto.fromJson(Map<String, dynamic> json) =>
      _$$_ApproverReturnRequestDtoFromJson(json);

  @override
  @JsonKey(name: 'requestHeader')
  final ApproverReturnRequestInformationHeaderDto requestHeader;
  final List<ApproverReturnRequestInformationDto> _requestInformation;
  @override
  @JsonKey(
      name: 'requestInformationV2',
      defaultValue: <ApproverReturnRequestInformationDto>[])
  List<ApproverReturnRequestInformationDto> get requestInformation {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requestInformation);
  }

  @override
  String toString() {
    return 'ApproverReturnRequestDto(requestHeader: $requestHeader, requestInformation: $requestInformation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApproverReturnRequestDto &&
            (identical(other.requestHeader, requestHeader) ||
                other.requestHeader == requestHeader) &&
            const DeepCollectionEquality()
                .equals(other._requestInformation, _requestInformation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, requestHeader,
      const DeepCollectionEquality().hash(_requestInformation));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApproverReturnRequestDtoCopyWith<_$_ApproverReturnRequestDto>
      get copyWith => __$$_ApproverReturnRequestDtoCopyWithImpl<
          _$_ApproverReturnRequestDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApproverReturnRequestDtoToJson(
      this,
    );
  }
}

abstract class _ApproverReturnRequestDto extends ApproverReturnRequestDto {
  factory _ApproverReturnRequestDto(
      {@JsonKey(name: 'requestHeader')
          required final ApproverReturnRequestInformationHeaderDto
              requestHeader,
      @JsonKey(
          name: 'requestInformationV2', defaultValue: <
              ApproverReturnRequestInformationDto>[])
          required final List<ApproverReturnRequestInformationDto>
              requestInformation}) = _$_ApproverReturnRequestDto;
  _ApproverReturnRequestDto._() : super._();

  factory _ApproverReturnRequestDto.fromJson(Map<String, dynamic> json) =
      _$_ApproverReturnRequestDto.fromJson;

  @override
  @JsonKey(name: 'requestHeader')
  ApproverReturnRequestInformationHeaderDto get requestHeader;
  @override
  @JsonKey(
      name: 'requestInformationV2',
      defaultValue: <ApproverReturnRequestInformationDto>[])
  List<ApproverReturnRequestInformationDto> get requestInformation;
  @override
  @JsonKey(ignore: true)
  _$$_ApproverReturnRequestDtoCopyWith<_$_ApproverReturnRequestDto>
      get copyWith => throw _privateConstructorUsedError;
}
