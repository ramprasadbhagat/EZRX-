// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'request_information.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RequestInformation {
  ReturnRequestInformationHeader get requestHeader =>
      throw _privateConstructorUsedError;
  List<ReturnRequestInformation> get requestInformation =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RequestInformationCopyWith<RequestInformation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestInformationCopyWith<$Res> {
  factory $RequestInformationCopyWith(
          RequestInformation value, $Res Function(RequestInformation) then) =
      _$RequestInformationCopyWithImpl<$Res, RequestInformation>;
  @useResult
  $Res call(
      {ReturnRequestInformationHeader requestHeader,
      List<ReturnRequestInformation> requestInformation});

  $ReturnRequestInformationHeaderCopyWith<$Res> get requestHeader;
}

/// @nodoc
class _$RequestInformationCopyWithImpl<$Res, $Val extends RequestInformation>
    implements $RequestInformationCopyWith<$Res> {
  _$RequestInformationCopyWithImpl(this._value, this._then);

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
              as ReturnRequestInformationHeader,
      requestInformation: null == requestInformation
          ? _value.requestInformation
          : requestInformation // ignore: cast_nullable_to_non_nullable
              as List<ReturnRequestInformation>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnRequestInformationHeaderCopyWith<$Res> get requestHeader {
    return $ReturnRequestInformationHeaderCopyWith<$Res>(_value.requestHeader,
        (value) {
      return _then(_value.copyWith(requestHeader: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RequestInformationCopyWith<$Res>
    implements $RequestInformationCopyWith<$Res> {
  factory _$$_RequestInformationCopyWith(_$_RequestInformation value,
          $Res Function(_$_RequestInformation) then) =
      __$$_RequestInformationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ReturnRequestInformationHeader requestHeader,
      List<ReturnRequestInformation> requestInformation});

  @override
  $ReturnRequestInformationHeaderCopyWith<$Res> get requestHeader;
}

/// @nodoc
class __$$_RequestInformationCopyWithImpl<$Res>
    extends _$RequestInformationCopyWithImpl<$Res, _$_RequestInformation>
    implements _$$_RequestInformationCopyWith<$Res> {
  __$$_RequestInformationCopyWithImpl(
      _$_RequestInformation _value, $Res Function(_$_RequestInformation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestHeader = null,
    Object? requestInformation = null,
  }) {
    return _then(_$_RequestInformation(
      requestHeader: null == requestHeader
          ? _value.requestHeader
          : requestHeader // ignore: cast_nullable_to_non_nullable
              as ReturnRequestInformationHeader,
      requestInformation: null == requestInformation
          ? _value._requestInformation
          : requestInformation // ignore: cast_nullable_to_non_nullable
              as List<ReturnRequestInformation>,
    ));
  }
}

/// @nodoc

class _$_RequestInformation extends _RequestInformation {
  _$_RequestInformation(
      {required this.requestHeader,
      required final List<ReturnRequestInformation> requestInformation})
      : _requestInformation = requestInformation,
        super._();

  @override
  final ReturnRequestInformationHeader requestHeader;
  final List<ReturnRequestInformation> _requestInformation;
  @override
  List<ReturnRequestInformation> get requestInformation {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requestInformation);
  }

  @override
  String toString() {
    return 'RequestInformation(requestHeader: $requestHeader, requestInformation: $requestInformation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RequestInformation &&
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
  _$$_RequestInformationCopyWith<_$_RequestInformation> get copyWith =>
      __$$_RequestInformationCopyWithImpl<_$_RequestInformation>(
          this, _$identity);
}

abstract class _RequestInformation extends RequestInformation {
  factory _RequestInformation(
          {required final ReturnRequestInformationHeader requestHeader,
          required final List<ReturnRequestInformation> requestInformation}) =
      _$_RequestInformation;
  _RequestInformation._() : super._();

  @override
  ReturnRequestInformationHeader get requestHeader;
  @override
  List<ReturnRequestInformation> get requestInformation;
  @override
  @JsonKey(ignore: true)
  _$$_RequestInformationCopyWith<_$_RequestInformation> get copyWith =>
      throw _privateConstructorUsedError;
}
