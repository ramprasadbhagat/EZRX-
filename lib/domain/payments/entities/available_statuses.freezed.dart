// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'available_statuses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AvailableStatuses {
  List<String> get statuses => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AvailableStatusesCopyWith<AvailableStatuses> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableStatusesCopyWith<$Res> {
  factory $AvailableStatusesCopyWith(
          AvailableStatuses value, $Res Function(AvailableStatuses) then) =
      _$AvailableStatusesCopyWithImpl<$Res, AvailableStatuses>;
  @useResult
  $Res call({List<String> statuses});
}

/// @nodoc
class _$AvailableStatusesCopyWithImpl<$Res, $Val extends AvailableStatuses>
    implements $AvailableStatusesCopyWith<$Res> {
  _$AvailableStatusesCopyWithImpl(this._value, this._then);

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
abstract class _$$_AvailableStatusesCopyWith<$Res>
    implements $AvailableStatusesCopyWith<$Res> {
  factory _$$_AvailableStatusesCopyWith(_$_AvailableStatuses value,
          $Res Function(_$_AvailableStatuses) then) =
      __$$_AvailableStatusesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> statuses});
}

/// @nodoc
class __$$_AvailableStatusesCopyWithImpl<$Res>
    extends _$AvailableStatusesCopyWithImpl<$Res, _$_AvailableStatuses>
    implements _$$_AvailableStatusesCopyWith<$Res> {
  __$$_AvailableStatusesCopyWithImpl(
      _$_AvailableStatuses _value, $Res Function(_$_AvailableStatuses) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statuses = null,
  }) {
    return _then(_$_AvailableStatuses(
      statuses: null == statuses
          ? _value._statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_AvailableStatuses extends _AvailableStatuses {
  _$_AvailableStatuses({required final List<String> statuses})
      : _statuses = statuses,
        super._();

  final List<String> _statuses;
  @override
  List<String> get statuses {
    if (_statuses is EqualUnmodifiableListView) return _statuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statuses);
  }

  @override
  String toString() {
    return 'AvailableStatuses(statuses: $statuses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AvailableStatuses &&
            const DeepCollectionEquality().equals(other._statuses, _statuses));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_statuses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AvailableStatusesCopyWith<_$_AvailableStatuses> get copyWith =>
      __$$_AvailableStatusesCopyWithImpl<_$_AvailableStatuses>(
          this, _$identity);
}

abstract class _AvailableStatuses extends AvailableStatuses {
  factory _AvailableStatuses({required final List<String> statuses}) =
      _$_AvailableStatuses;
  _AvailableStatuses._() : super._();

  @override
  List<String> get statuses;
  @override
  @JsonKey(ignore: true)
  _$$_AvailableStatusesCopyWith<_$_AvailableStatuses> get copyWith =>
      throw _privateConstructorUsedError;
}
