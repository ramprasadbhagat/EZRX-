// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'returns_overview_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReturnsOverviewDto _$ReturnsOverviewDtoFromJson(Map<String, dynamic> json) {
  return _ReturnsOverviewDto.fromJson(json);
}

/// @nodoc
mixin _$ReturnsOverviewDto {
  @JsonKey(name: 'requestSubmitted', defaultValue: 0)
  int get requestSubmitted => throw _privateConstructorUsedError;
  @JsonKey(name: 'requestPendingApproval', defaultValue: 0)
  int get requestPendingApproval => throw _privateConstructorUsedError;
  @JsonKey(name: 'requestRejected', defaultValue: 0)
  int get requestRejected => throw _privateConstructorUsedError;
  @JsonKey(name: 'requestForApproval', defaultValue: 0)
  int get requestForApproval => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReturnsOverviewDtoCopyWith<ReturnsOverviewDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnsOverviewDtoCopyWith<$Res> {
  factory $ReturnsOverviewDtoCopyWith(
          ReturnsOverviewDto value, $Res Function(ReturnsOverviewDto) then) =
      _$ReturnsOverviewDtoCopyWithImpl<$Res, ReturnsOverviewDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'requestSubmitted', defaultValue: 0)
          int requestSubmitted,
      @JsonKey(name: 'requestPendingApproval', defaultValue: 0)
          int requestPendingApproval,
      @JsonKey(name: 'requestRejected', defaultValue: 0)
          int requestRejected,
      @JsonKey(name: 'requestForApproval', defaultValue: 0)
          int requestForApproval});
}

/// @nodoc
class _$ReturnsOverviewDtoCopyWithImpl<$Res, $Val extends ReturnsOverviewDto>
    implements $ReturnsOverviewDtoCopyWith<$Res> {
  _$ReturnsOverviewDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestSubmitted = null,
    Object? requestPendingApproval = null,
    Object? requestRejected = null,
    Object? requestForApproval = null,
  }) {
    return _then(_value.copyWith(
      requestSubmitted: null == requestSubmitted
          ? _value.requestSubmitted
          : requestSubmitted // ignore: cast_nullable_to_non_nullable
              as int,
      requestPendingApproval: null == requestPendingApproval
          ? _value.requestPendingApproval
          : requestPendingApproval // ignore: cast_nullable_to_non_nullable
              as int,
      requestRejected: null == requestRejected
          ? _value.requestRejected
          : requestRejected // ignore: cast_nullable_to_non_nullable
              as int,
      requestForApproval: null == requestForApproval
          ? _value.requestForApproval
          : requestForApproval // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReturnsOverviewDtoCopyWith<$Res>
    implements $ReturnsOverviewDtoCopyWith<$Res> {
  factory _$$_ReturnsOverviewDtoCopyWith(_$_ReturnsOverviewDto value,
          $Res Function(_$_ReturnsOverviewDto) then) =
      __$$_ReturnsOverviewDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'requestSubmitted', defaultValue: 0)
          int requestSubmitted,
      @JsonKey(name: 'requestPendingApproval', defaultValue: 0)
          int requestPendingApproval,
      @JsonKey(name: 'requestRejected', defaultValue: 0)
          int requestRejected,
      @JsonKey(name: 'requestForApproval', defaultValue: 0)
          int requestForApproval});
}

/// @nodoc
class __$$_ReturnsOverviewDtoCopyWithImpl<$Res>
    extends _$ReturnsOverviewDtoCopyWithImpl<$Res, _$_ReturnsOverviewDto>
    implements _$$_ReturnsOverviewDtoCopyWith<$Res> {
  __$$_ReturnsOverviewDtoCopyWithImpl(
      _$_ReturnsOverviewDto _value, $Res Function(_$_ReturnsOverviewDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestSubmitted = null,
    Object? requestPendingApproval = null,
    Object? requestRejected = null,
    Object? requestForApproval = null,
  }) {
    return _then(_$_ReturnsOverviewDto(
      requestSubmitted: null == requestSubmitted
          ? _value.requestSubmitted
          : requestSubmitted // ignore: cast_nullable_to_non_nullable
              as int,
      requestPendingApproval: null == requestPendingApproval
          ? _value.requestPendingApproval
          : requestPendingApproval // ignore: cast_nullable_to_non_nullable
              as int,
      requestRejected: null == requestRejected
          ? _value.requestRejected
          : requestRejected // ignore: cast_nullable_to_non_nullable
              as int,
      requestForApproval: null == requestForApproval
          ? _value.requestForApproval
          : requestForApproval // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReturnsOverviewDto extends _ReturnsOverviewDto {
  const _$_ReturnsOverviewDto(
      {@JsonKey(name: 'requestSubmitted', defaultValue: 0)
          required this.requestSubmitted,
      @JsonKey(name: 'requestPendingApproval', defaultValue: 0)
          required this.requestPendingApproval,
      @JsonKey(name: 'requestRejected', defaultValue: 0)
          required this.requestRejected,
      @JsonKey(name: 'requestForApproval', defaultValue: 0)
          required this.requestForApproval})
      : super._();

  factory _$_ReturnsOverviewDto.fromJson(Map<String, dynamic> json) =>
      _$$_ReturnsOverviewDtoFromJson(json);

  @override
  @JsonKey(name: 'requestSubmitted', defaultValue: 0)
  final int requestSubmitted;
  @override
  @JsonKey(name: 'requestPendingApproval', defaultValue: 0)
  final int requestPendingApproval;
  @override
  @JsonKey(name: 'requestRejected', defaultValue: 0)
  final int requestRejected;
  @override
  @JsonKey(name: 'requestForApproval', defaultValue: 0)
  final int requestForApproval;

  @override
  String toString() {
    return 'ReturnsOverviewDto(requestSubmitted: $requestSubmitted, requestPendingApproval: $requestPendingApproval, requestRejected: $requestRejected, requestForApproval: $requestForApproval)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnsOverviewDto &&
            (identical(other.requestSubmitted, requestSubmitted) ||
                other.requestSubmitted == requestSubmitted) &&
            (identical(other.requestPendingApproval, requestPendingApproval) ||
                other.requestPendingApproval == requestPendingApproval) &&
            (identical(other.requestRejected, requestRejected) ||
                other.requestRejected == requestRejected) &&
            (identical(other.requestForApproval, requestForApproval) ||
                other.requestForApproval == requestForApproval));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, requestSubmitted,
      requestPendingApproval, requestRejected, requestForApproval);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnsOverviewDtoCopyWith<_$_ReturnsOverviewDto> get copyWith =>
      __$$_ReturnsOverviewDtoCopyWithImpl<_$_ReturnsOverviewDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReturnsOverviewDtoToJson(
      this,
    );
  }
}

abstract class _ReturnsOverviewDto extends ReturnsOverviewDto {
  const factory _ReturnsOverviewDto(
      {@JsonKey(name: 'requestSubmitted', defaultValue: 0)
          required final int requestSubmitted,
      @JsonKey(name: 'requestPendingApproval', defaultValue: 0)
          required final int requestPendingApproval,
      @JsonKey(name: 'requestRejected', defaultValue: 0)
          required final int requestRejected,
      @JsonKey(name: 'requestForApproval', defaultValue: 0)
          required final int requestForApproval}) = _$_ReturnsOverviewDto;
  const _ReturnsOverviewDto._() : super._();

  factory _ReturnsOverviewDto.fromJson(Map<String, dynamic> json) =
      _$_ReturnsOverviewDto.fromJson;

  @override
  @JsonKey(name: 'requestSubmitted', defaultValue: 0)
  int get requestSubmitted;
  @override
  @JsonKey(name: 'requestPendingApproval', defaultValue: 0)
  int get requestPendingApproval;
  @override
  @JsonKey(name: 'requestRejected', defaultValue: 0)
  int get requestRejected;
  @override
  @JsonKey(name: 'requestForApproval', defaultValue: 0)
  int get requestForApproval;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnsOverviewDtoCopyWith<_$_ReturnsOverviewDto> get copyWith =>
      throw _privateConstructorUsedError;
}
