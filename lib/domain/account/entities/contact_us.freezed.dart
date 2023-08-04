// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_us.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ContactUs {
  Username get username => throw _privateConstructorUsedError;
  EmailAddress get email => throw _privateConstructorUsedError;
  PhoneNumber get contactNumber => throw _privateConstructorUsedError;
  StringValue get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContactUsCopyWith<ContactUs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactUsCopyWith<$Res> {
  factory $ContactUsCopyWith(ContactUs value, $Res Function(ContactUs) then) =
      _$ContactUsCopyWithImpl<$Res, ContactUs>;
  @useResult
  $Res call(
      {Username username,
      EmailAddress email,
      PhoneNumber contactNumber,
      StringValue message});
}

/// @nodoc
class _$ContactUsCopyWithImpl<$Res, $Val extends ContactUs>
    implements $ContactUsCopyWith<$Res> {
  _$ContactUsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? contactNumber = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      contactNumber: null == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContactUsCopyWith<$Res> implements $ContactUsCopyWith<$Res> {
  factory _$$_ContactUsCopyWith(
          _$_ContactUs value, $Res Function(_$_ContactUs) then) =
      __$$_ContactUsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Username username,
      EmailAddress email,
      PhoneNumber contactNumber,
      StringValue message});
}

/// @nodoc
class __$$_ContactUsCopyWithImpl<$Res>
    extends _$ContactUsCopyWithImpl<$Res, _$_ContactUs>
    implements _$$_ContactUsCopyWith<$Res> {
  __$$_ContactUsCopyWithImpl(
      _$_ContactUs _value, $Res Function(_$_ContactUs) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? contactNumber = null,
    Object? message = null,
  }) {
    return _then(_$_ContactUs(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      contactNumber: null == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ));
  }
}

/// @nodoc

class _$_ContactUs extends _ContactUs {
  const _$_ContactUs(
      {required this.username,
      required this.email,
      required this.contactNumber,
      required this.message})
      : super._();

  @override
  final Username username;
  @override
  final EmailAddress email;
  @override
  final PhoneNumber contactNumber;
  @override
  final StringValue message;

  @override
  String toString() {
    return 'ContactUs(username: $username, email: $email, contactNumber: $contactNumber, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContactUs &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.contactNumber, contactNumber) ||
                other.contactNumber == contactNumber) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, username, email, contactNumber, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContactUsCopyWith<_$_ContactUs> get copyWith =>
      __$$_ContactUsCopyWithImpl<_$_ContactUs>(this, _$identity);
}

abstract class _ContactUs extends ContactUs {
  const factory _ContactUs(
      {required final Username username,
      required final EmailAddress email,
      required final PhoneNumber contactNumber,
      required final StringValue message}) = _$_ContactUs;
  const _ContactUs._() : super._();

  @override
  Username get username;
  @override
  EmailAddress get email;
  @override
  PhoneNumber get contactNumber;
  @override
  StringValue get message;
  @override
  @JsonKey(ignore: true)
  _$$_ContactUsCopyWith<_$_ContactUs> get copyWith =>
      throw _privateConstructorUsedError;
}
