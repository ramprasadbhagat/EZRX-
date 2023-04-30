// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'approver_rights.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApproverRights {
  Username get userName => throw _privateConstructorUsedError;
  List<ApproverRightsDetails> get approverRightsList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApproverRightsCopyWith<ApproverRights> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApproverRightsCopyWith<$Res> {
  factory $ApproverRightsCopyWith(
          ApproverRights value, $Res Function(ApproverRights) then) =
      _$ApproverRightsCopyWithImpl<$Res, ApproverRights>;
  @useResult
  $Res call(
      {Username userName, List<ApproverRightsDetails> approverRightsList});
}

/// @nodoc
class _$ApproverRightsCopyWithImpl<$Res, $Val extends ApproverRights>
    implements $ApproverRightsCopyWith<$Res> {
  _$ApproverRightsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? approverRightsList = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as Username,
      approverRightsList: null == approverRightsList
          ? _value.approverRightsList
          : approverRightsList // ignore: cast_nullable_to_non_nullable
              as List<ApproverRightsDetails>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApproverRightsCopyWith<$Res>
    implements $ApproverRightsCopyWith<$Res> {
  factory _$$_ApproverRightsCopyWith(
          _$_ApproverRights value, $Res Function(_$_ApproverRights) then) =
      __$$_ApproverRightsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Username userName, List<ApproverRightsDetails> approverRightsList});
}

/// @nodoc
class __$$_ApproverRightsCopyWithImpl<$Res>
    extends _$ApproverRightsCopyWithImpl<$Res, _$_ApproverRights>
    implements _$$_ApproverRightsCopyWith<$Res> {
  __$$_ApproverRightsCopyWithImpl(
      _$_ApproverRights _value, $Res Function(_$_ApproverRights) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? approverRightsList = null,
  }) {
    return _then(_$_ApproverRights(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as Username,
      approverRightsList: null == approverRightsList
          ? _value._approverRightsList
          : approverRightsList // ignore: cast_nullable_to_non_nullable
              as List<ApproverRightsDetails>,
    ));
  }
}

/// @nodoc

class _$_ApproverRights extends _ApproverRights {
  const _$_ApproverRights(
      {required this.userName,
      required final List<ApproverRightsDetails> approverRightsList})
      : _approverRightsList = approverRightsList,
        super._();

  @override
  final Username userName;
  final List<ApproverRightsDetails> _approverRightsList;
  @override
  List<ApproverRightsDetails> get approverRightsList {
    if (_approverRightsList is EqualUnmodifiableListView)
      return _approverRightsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_approverRightsList);
  }

  @override
  String toString() {
    return 'ApproverRights(userName: $userName, approverRightsList: $approverRightsList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApproverRights &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            const DeepCollectionEquality()
                .equals(other._approverRightsList, _approverRightsList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userName,
      const DeepCollectionEquality().hash(_approverRightsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApproverRightsCopyWith<_$_ApproverRights> get copyWith =>
      __$$_ApproverRightsCopyWithImpl<_$_ApproverRights>(this, _$identity);
}

abstract class _ApproverRights extends ApproverRights {
  const factory _ApproverRights(
          {required final Username userName,
          required final List<ApproverRightsDetails> approverRightsList}) =
      _$_ApproverRights;
  const _ApproverRights._() : super._();

  @override
  Username get userName;
  @override
  List<ApproverRightsDetails> get approverRightsList;
  @override
  @JsonKey(ignore: true)
  _$$_ApproverRightsCopyWith<_$_ApproverRights> get copyWith =>
      throw _privateConstructorUsedError;
}
