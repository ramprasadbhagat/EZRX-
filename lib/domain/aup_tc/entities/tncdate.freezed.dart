// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tncdate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TncDate {
  DateTime get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TncDateCopyWith<TncDate> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TncDateCopyWith<$Res> {
  factory $TncDateCopyWith(TncDate value, $Res Function(TncDate) then) =
      _$TncDateCopyWithImpl<$Res, TncDate>;
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class _$TncDateCopyWithImpl<$Res, $Val extends TncDate>
    implements $TncDateCopyWith<$Res> {
  _$TncDateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TncDateCopyWith<$Res> implements $TncDateCopyWith<$Res> {
  factory _$$_TncDateCopyWith(
          _$_TncDate value, $Res Function(_$_TncDate) then) =
      __$$_TncDateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class __$$_TncDateCopyWithImpl<$Res>
    extends _$TncDateCopyWithImpl<$Res, _$_TncDate>
    implements _$$_TncDateCopyWith<$Res> {
  __$$_TncDateCopyWithImpl(_$_TncDate _value, $Res Function(_$_TncDate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_$_TncDate(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_TncDate extends _TncDate {
  const _$_TncDate({required this.date}) : super._();

  @override
  final DateTime date;

  @override
  String toString() {
    return 'TncDate(date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TncDate &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TncDateCopyWith<_$_TncDate> get copyWith =>
      __$$_TncDateCopyWithImpl<_$_TncDate>(this, _$identity);
}

abstract class _TncDate extends TncDate {
  const factory _TncDate({required final DateTime date}) = _$_TncDate;
  const _TncDate._() : super._();

  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$_TncDateCopyWith<_$_TncDate> get copyWith =>
      throw _privateConstructorUsedError;
}
