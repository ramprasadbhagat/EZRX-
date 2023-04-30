// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bu_contact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BuContact {
  String get instruction => throw _privateConstructorUsedError;
  List<PhoneNumber> get phoneNumbers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BuContactCopyWith<BuContact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuContactCopyWith<$Res> {
  factory $BuContactCopyWith(BuContact value, $Res Function(BuContact) then) =
      _$BuContactCopyWithImpl<$Res, BuContact>;
  @useResult
  $Res call({String instruction, List<PhoneNumber> phoneNumbers});
}

/// @nodoc
class _$BuContactCopyWithImpl<$Res, $Val extends BuContact>
    implements $BuContactCopyWith<$Res> {
  _$BuContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instruction = null,
    Object? phoneNumbers = null,
  }) {
    return _then(_value.copyWith(
      instruction: null == instruction
          ? _value.instruction
          : instruction // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumbers: null == phoneNumbers
          ? _value.phoneNumbers
          : phoneNumbers // ignore: cast_nullable_to_non_nullable
              as List<PhoneNumber>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BuContactCopyWith<$Res> implements $BuContactCopyWith<$Res> {
  factory _$$_BuContactCopyWith(
          _$_BuContact value, $Res Function(_$_BuContact) then) =
      __$$_BuContactCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String instruction, List<PhoneNumber> phoneNumbers});
}

/// @nodoc
class __$$_BuContactCopyWithImpl<$Res>
    extends _$BuContactCopyWithImpl<$Res, _$_BuContact>
    implements _$$_BuContactCopyWith<$Res> {
  __$$_BuContactCopyWithImpl(
      _$_BuContact _value, $Res Function(_$_BuContact) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instruction = null,
    Object? phoneNumbers = null,
  }) {
    return _then(_$_BuContact(
      instruction: null == instruction
          ? _value.instruction
          : instruction // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumbers: null == phoneNumbers
          ? _value._phoneNumbers
          : phoneNumbers // ignore: cast_nullable_to_non_nullable
              as List<PhoneNumber>,
    ));
  }
}

/// @nodoc

class _$_BuContact extends _BuContact {
  const _$_BuContact(
      {required this.instruction,
      required final List<PhoneNumber> phoneNumbers})
      : _phoneNumbers = phoneNumbers,
        super._();

  @override
  final String instruction;
  final List<PhoneNumber> _phoneNumbers;
  @override
  List<PhoneNumber> get phoneNumbers {
    if (_phoneNumbers is EqualUnmodifiableListView) return _phoneNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_phoneNumbers);
  }

  @override
  String toString() {
    return 'BuContact(instruction: $instruction, phoneNumbers: $phoneNumbers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BuContact &&
            (identical(other.instruction, instruction) ||
                other.instruction == instruction) &&
            const DeepCollectionEquality()
                .equals(other._phoneNumbers, _phoneNumbers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, instruction,
      const DeepCollectionEquality().hash(_phoneNumbers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BuContactCopyWith<_$_BuContact> get copyWith =>
      __$$_BuContactCopyWithImpl<_$_BuContact>(this, _$identity);
}

abstract class _BuContact extends BuContact {
  const factory _BuContact(
      {required final String instruction,
      required final List<PhoneNumber> phoneNumbers}) = _$_BuContact;
  const _BuContact._() : super._();

  @override
  String get instruction;
  @override
  List<PhoneNumber> get phoneNumbers;
  @override
  @JsonKey(ignore: true)
  _$$_BuContactCopyWith<_$_BuContact> get copyWith =>
      throw _privateConstructorUsedError;
}
