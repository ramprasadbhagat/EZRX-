// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'return_schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReturnSchedule {
  String get scheduledLine => throw _privateConstructorUsedError;
  SimpleDate get requestDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnScheduleCopyWith<ReturnSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnScheduleCopyWith<$Res> {
  factory $ReturnScheduleCopyWith(
          ReturnSchedule value, $Res Function(ReturnSchedule) then) =
      _$ReturnScheduleCopyWithImpl<$Res, ReturnSchedule>;
  @useResult
  $Res call({String scheduledLine, SimpleDate requestDate});
}

/// @nodoc
class _$ReturnScheduleCopyWithImpl<$Res, $Val extends ReturnSchedule>
    implements $ReturnScheduleCopyWith<$Res> {
  _$ReturnScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduledLine = null,
    Object? requestDate = null,
  }) {
    return _then(_value.copyWith(
      scheduledLine: null == scheduledLine
          ? _value.scheduledLine
          : scheduledLine // ignore: cast_nullable_to_non_nullable
              as String,
      requestDate: null == requestDate
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as SimpleDate,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReturnScheduleCopyWith<$Res>
    implements $ReturnScheduleCopyWith<$Res> {
  factory _$$_ReturnScheduleCopyWith(
          _$_ReturnSchedule value, $Res Function(_$_ReturnSchedule) then) =
      __$$_ReturnScheduleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String scheduledLine, SimpleDate requestDate});
}

/// @nodoc
class __$$_ReturnScheduleCopyWithImpl<$Res>
    extends _$ReturnScheduleCopyWithImpl<$Res, _$_ReturnSchedule>
    implements _$$_ReturnScheduleCopyWith<$Res> {
  __$$_ReturnScheduleCopyWithImpl(
      _$_ReturnSchedule _value, $Res Function(_$_ReturnSchedule) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduledLine = null,
    Object? requestDate = null,
  }) {
    return _then(_$_ReturnSchedule(
      scheduledLine: null == scheduledLine
          ? _value.scheduledLine
          : scheduledLine // ignore: cast_nullable_to_non_nullable
              as String,
      requestDate: null == requestDate
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as SimpleDate,
    ));
  }
}

/// @nodoc

class _$_ReturnSchedule extends _ReturnSchedule {
  const _$_ReturnSchedule(
      {required this.scheduledLine, required this.requestDate})
      : super._();

  @override
  final String scheduledLine;
  @override
  final SimpleDate requestDate;

  @override
  String toString() {
    return 'ReturnSchedule(scheduledLine: $scheduledLine, requestDate: $requestDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnSchedule &&
            (identical(other.scheduledLine, scheduledLine) ||
                other.scheduledLine == scheduledLine) &&
            (identical(other.requestDate, requestDate) ||
                other.requestDate == requestDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, scheduledLine, requestDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnScheduleCopyWith<_$_ReturnSchedule> get copyWith =>
      __$$_ReturnScheduleCopyWithImpl<_$_ReturnSchedule>(this, _$identity);
}

abstract class _ReturnSchedule extends ReturnSchedule {
  const factory _ReturnSchedule(
      {required final String scheduledLine,
      required final SimpleDate requestDate}) = _$_ReturnSchedule;
  const _ReturnSchedule._() : super._();

  @override
  String get scheduledLine;
  @override
  SimpleDate get requestDate;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnScheduleCopyWith<_$_ReturnSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}
