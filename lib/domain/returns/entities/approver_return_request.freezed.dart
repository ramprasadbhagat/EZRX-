// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'approver_return_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApproverReturnRequest {
  ApproverReturnRequestInformationHeader get requestHeader =>
      throw _privateConstructorUsedError;
  List<ApproverReturnRequestInformation> get requestInformation =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApproverReturnRequestCopyWith<ApproverReturnRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApproverReturnRequestCopyWith<$Res> {
  factory $ApproverReturnRequestCopyWith(ApproverReturnRequest value,
          $Res Function(ApproverReturnRequest) then) =
      _$ApproverReturnRequestCopyWithImpl<$Res, ApproverReturnRequest>;
  @useResult
  $Res call(
      {ApproverReturnRequestInformationHeader requestHeader,
      List<ApproverReturnRequestInformation> requestInformation});

  $ApproverReturnRequestInformationHeaderCopyWith<$Res> get requestHeader;
}

/// @nodoc
class _$ApproverReturnRequestCopyWithImpl<$Res,
        $Val extends ApproverReturnRequest>
    implements $ApproverReturnRequestCopyWith<$Res> {
  _$ApproverReturnRequestCopyWithImpl(this._value, this._then);

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
              as ApproverReturnRequestInformationHeader,
      requestInformation: null == requestInformation
          ? _value.requestInformation
          : requestInformation // ignore: cast_nullable_to_non_nullable
              as List<ApproverReturnRequestInformation>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ApproverReturnRequestInformationHeaderCopyWith<$Res> get requestHeader {
    return $ApproverReturnRequestInformationHeaderCopyWith<$Res>(
        _value.requestHeader, (value) {
      return _then(_value.copyWith(requestHeader: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ApproverReturnRequestCopyWith<$Res>
    implements $ApproverReturnRequestCopyWith<$Res> {
  factory _$$_ApproverReturnRequestCopyWith(_$_ApproverReturnRequest value,
          $Res Function(_$_ApproverReturnRequest) then) =
      __$$_ApproverReturnRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ApproverReturnRequestInformationHeader requestHeader,
      List<ApproverReturnRequestInformation> requestInformation});

  @override
  $ApproverReturnRequestInformationHeaderCopyWith<$Res> get requestHeader;
}

/// @nodoc
class __$$_ApproverReturnRequestCopyWithImpl<$Res>
    extends _$ApproverReturnRequestCopyWithImpl<$Res, _$_ApproverReturnRequest>
    implements _$$_ApproverReturnRequestCopyWith<$Res> {
  __$$_ApproverReturnRequestCopyWithImpl(_$_ApproverReturnRequest _value,
      $Res Function(_$_ApproverReturnRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestHeader = null,
    Object? requestInformation = null,
  }) {
    return _then(_$_ApproverReturnRequest(
      requestHeader: null == requestHeader
          ? _value.requestHeader
          : requestHeader // ignore: cast_nullable_to_non_nullable
              as ApproverReturnRequestInformationHeader,
      requestInformation: null == requestInformation
          ? _value._requestInformation
          : requestInformation // ignore: cast_nullable_to_non_nullable
              as List<ApproverReturnRequestInformation>,
    ));
  }
}

/// @nodoc

class _$_ApproverReturnRequest extends _ApproverReturnRequest {
  _$_ApproverReturnRequest(
      {required this.requestHeader,
      required final List<ApproverReturnRequestInformation> requestInformation})
      : _requestInformation = requestInformation,
        super._();

  @override
  final ApproverReturnRequestInformationHeader requestHeader;
  final List<ApproverReturnRequestInformation> _requestInformation;
  @override
  List<ApproverReturnRequestInformation> get requestInformation {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requestInformation);
  }

  @override
  String toString() {
    return 'ApproverReturnRequest(requestHeader: $requestHeader, requestInformation: $requestInformation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApproverReturnRequest &&
            (identical(other.requestHeader, requestHeader) ||
                other.requestHeader == requestHeader) &&
            const DeepCollectionEquality()
                .equals(other._requestInformation, _requestInformation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestHeader,
      const DeepCollectionEquality().hash(_requestInformation));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApproverReturnRequestCopyWith<_$_ApproverReturnRequest> get copyWith =>
      __$$_ApproverReturnRequestCopyWithImpl<_$_ApproverReturnRequest>(
          this, _$identity);
}

abstract class _ApproverReturnRequest extends ApproverReturnRequest {
  factory _ApproverReturnRequest(
      {required final ApproverReturnRequestInformationHeader requestHeader,
      required final List<ApproverReturnRequestInformation>
          requestInformation}) = _$_ApproverReturnRequest;
  _ApproverReturnRequest._() : super._();

  @override
  ApproverReturnRequestInformationHeader get requestHeader;
  @override
  List<ApproverReturnRequestInformation> get requestInformation;
  @override
  @JsonKey(ignore: true)
  _$$_ApproverReturnRequestCopyWith<_$_ApproverReturnRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
