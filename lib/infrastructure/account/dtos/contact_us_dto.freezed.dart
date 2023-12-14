// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_us_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContactUsDto _$ContactUsDtoFromJson(Map<String, dynamic> json) {
  return _ContactUsDto.fromJson(json);
}

/// @nodoc
mixin _$ContactUsDto {
  @JsonKey(name: 'name', defaultValue: '')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'contactNumber', defaultValue: '')
  String get contactNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'email', defaultValue: '')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'message', defaultValue: '')
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactUsDtoCopyWith<ContactUsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactUsDtoCopyWith<$Res> {
  factory $ContactUsDtoCopyWith(
          ContactUsDto value, $Res Function(ContactUsDto) then) =
      _$ContactUsDtoCopyWithImpl<$Res, ContactUsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'contactNumber', defaultValue: '') String contactNumber,
      @JsonKey(name: 'email', defaultValue: '') String email,
      @JsonKey(name: 'message', defaultValue: '') String message});
}

/// @nodoc
class _$ContactUsDtoCopyWithImpl<$Res, $Val extends ContactUsDto>
    implements $ContactUsDtoCopyWith<$Res> {
  _$ContactUsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? contactNumber = null,
    Object? email = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      contactNumber: null == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContactUsDtoCopyWith<$Res>
    implements $ContactUsDtoCopyWith<$Res> {
  factory _$$_ContactUsDtoCopyWith(
          _$_ContactUsDto value, $Res Function(_$_ContactUsDto) then) =
      __$$_ContactUsDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'contactNumber', defaultValue: '') String contactNumber,
      @JsonKey(name: 'email', defaultValue: '') String email,
      @JsonKey(name: 'message', defaultValue: '') String message});
}

/// @nodoc
class __$$_ContactUsDtoCopyWithImpl<$Res>
    extends _$ContactUsDtoCopyWithImpl<$Res, _$_ContactUsDto>
    implements _$$_ContactUsDtoCopyWith<$Res> {
  __$$_ContactUsDtoCopyWithImpl(
      _$_ContactUsDto _value, $Res Function(_$_ContactUsDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? contactNumber = null,
    Object? email = null,
    Object? message = null,
  }) {
    return _then(_$_ContactUsDto(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      contactNumber: null == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContactUsDto extends _ContactUsDto {
  const _$_ContactUsDto(
      {@JsonKey(name: 'name', defaultValue: '') required this.name,
      @JsonKey(name: 'contactNumber', defaultValue: '')
      required this.contactNumber,
      @JsonKey(name: 'email', defaultValue: '') required this.email,
      @JsonKey(name: 'message', defaultValue: '') required this.message})
      : super._();

  factory _$_ContactUsDto.fromJson(Map<String, dynamic> json) =>
      _$$_ContactUsDtoFromJson(json);

  @override
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @override
  @JsonKey(name: 'contactNumber', defaultValue: '')
  final String contactNumber;
  @override
  @JsonKey(name: 'email', defaultValue: '')
  final String email;
  @override
  @JsonKey(name: 'message', defaultValue: '')
  final String message;

  @override
  String toString() {
    return 'ContactUsDto(name: $name, contactNumber: $contactNumber, email: $email, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContactUsDto &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.contactNumber, contactNumber) ||
                other.contactNumber == contactNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, contactNumber, email, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContactUsDtoCopyWith<_$_ContactUsDto> get copyWith =>
      __$$_ContactUsDtoCopyWithImpl<_$_ContactUsDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContactUsDtoToJson(
      this,
    );
  }
}

abstract class _ContactUsDto extends ContactUsDto {
  const factory _ContactUsDto(
      {@JsonKey(name: 'name', defaultValue: '') required final String name,
      @JsonKey(name: 'contactNumber', defaultValue: '')
      required final String contactNumber,
      @JsonKey(name: 'email', defaultValue: '') required final String email,
      @JsonKey(name: 'message', defaultValue: '')
      required final String message}) = _$_ContactUsDto;
  const _ContactUsDto._() : super._();

  factory _ContactUsDto.fromJson(Map<String, dynamic> json) =
      _$_ContactUsDto.fromJson;

  @override
  @JsonKey(name: 'name', defaultValue: '')
  String get name;
  @override
  @JsonKey(name: 'contactNumber', defaultValue: '')
  String get contactNumber;
  @override
  @JsonKey(name: 'email', defaultValue: '')
  String get email;
  @override
  @JsonKey(name: 'message', defaultValue: '')
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_ContactUsDtoCopyWith<_$_ContactUsDto> get copyWith =>
      throw _privateConstructorUsedError;
}
