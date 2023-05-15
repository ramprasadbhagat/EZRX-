// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'available_statuses_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AvailableStatusesDto _$AvailableStatusesDtoFromJson(Map<String, dynamic> json) {
  return _AvailableStatusesDto.fromJson(json);
}

/// @nodoc
mixin _$AvailableStatusesDto {
  @JsonKey(name: 'statuses', defaultValue: <String>[])
  List<String> get statuses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AvailableStatusesDtoCopyWith<AvailableStatusesDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableStatusesDtoCopyWith<$Res> {
  factory $AvailableStatusesDtoCopyWith(AvailableStatusesDto value,
          $Res Function(AvailableStatusesDto) then) =
      _$AvailableStatusesDtoCopyWithImpl<$Res, AvailableStatusesDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'statuses', defaultValue: <String>[])
          List<String> statuses});
}

/// @nodoc
class _$AvailableStatusesDtoCopyWithImpl<$Res,
        $Val extends AvailableStatusesDto>
    implements $AvailableStatusesDtoCopyWith<$Res> {
  _$AvailableStatusesDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statuses = null,
  }) {
    return _then(_value.copyWith(
      statuses: null == statuses
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AvailableStatusesDtoCopyWith<$Res>
    implements $AvailableStatusesDtoCopyWith<$Res> {
  factory _$$_AvailableStatusesDtoCopyWith(_$_AvailableStatusesDto value,
          $Res Function(_$_AvailableStatusesDto) then) =
      __$$_AvailableStatusesDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'statuses', defaultValue: <String>[])
          List<String> statuses});
}

/// @nodoc
class __$$_AvailableStatusesDtoCopyWithImpl<$Res>
    extends _$AvailableStatusesDtoCopyWithImpl<$Res, _$_AvailableStatusesDto>
    implements _$$_AvailableStatusesDtoCopyWith<$Res> {
  __$$_AvailableStatusesDtoCopyWithImpl(_$_AvailableStatusesDto _value,
      $Res Function(_$_AvailableStatusesDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statuses = null,
  }) {
    return _then(_$_AvailableStatusesDto(
      statuses: null == statuses
          ? _value._statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AvailableStatusesDto extends _AvailableStatusesDto {
  _$_AvailableStatusesDto(
      {@JsonKey(name: 'statuses', defaultValue: <String>[])
          required final List<String> statuses})
      : _statuses = statuses,
        super._();

  factory _$_AvailableStatusesDto.fromJson(Map<String, dynamic> json) =>
      _$$_AvailableStatusesDtoFromJson(json);

  final List<String> _statuses;
  @override
  @JsonKey(name: 'statuses', defaultValue: <String>[])
  List<String> get statuses {
    if (_statuses is EqualUnmodifiableListView) return _statuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statuses);
  }

  @override
  String toString() {
    return 'AvailableStatusesDto(statuses: $statuses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AvailableStatusesDto &&
            const DeepCollectionEquality().equals(other._statuses, _statuses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_statuses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AvailableStatusesDtoCopyWith<_$_AvailableStatusesDto> get copyWith =>
      __$$_AvailableStatusesDtoCopyWithImpl<_$_AvailableStatusesDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AvailableStatusesDtoToJson(
      this,
    );
  }
}

abstract class _AvailableStatusesDto extends AvailableStatusesDto {
  factory _AvailableStatusesDto(
      {@JsonKey(name: 'statuses', defaultValue: <String>[])
          required final List<String> statuses}) = _$_AvailableStatusesDto;
  _AvailableStatusesDto._() : super._();

  factory _AvailableStatusesDto.fromJson(Map<String, dynamic> json) =
      _$_AvailableStatusesDto.fromJson;

  @override
  @JsonKey(name: 'statuses', defaultValue: <String>[])
  List<String> get statuses;
  @override
  @JsonKey(ignore: true)
  _$$_AvailableStatusesDtoCopyWith<_$_AvailableStatusesDto> get copyWith =>
      throw _privateConstructorUsedError;
}
