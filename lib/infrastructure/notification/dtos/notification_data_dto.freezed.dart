// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_data_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationDataDto _$NotificationDataDtoFromJson(Map<String, dynamic> json) {
  return _NotificationDataDto.fromJson(json);
}

/// @nodoc
mixin _$NotificationDataDto {
  @JsonKey(name: 'id', defaultValue: 0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'type', defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'title', defaultValue: '')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'description', defaultValue: '')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt', defaultValue: '')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'isRead')
  bool get isRead => throw _privateConstructorUsedError;
  @JsonKey(name: 'returnRequestNumber', defaultValue: '')
  String get returnRequestId => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderNumber', defaultValue: '')
  String get orderNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationDataDtoCopyWith<NotificationDataDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationDataDtoCopyWith<$Res> {
  factory $NotificationDataDtoCopyWith(
          NotificationDataDto value, $Res Function(NotificationDataDto) then) =
      _$NotificationDataDtoCopyWithImpl<$Res, NotificationDataDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0) int id,
      @JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'title', defaultValue: '') String title,
      @JsonKey(name: 'description', defaultValue: '') String description,
      @JsonKey(name: 'createdAt', defaultValue: '') String createdAt,
      @JsonKey(name: 'isRead') bool isRead,
      @JsonKey(name: 'returnRequestNumber', defaultValue: '')
      String returnRequestId,
      @JsonKey(name: 'orderNumber', defaultValue: '') String orderNumber});
}

/// @nodoc
class _$NotificationDataDtoCopyWithImpl<$Res, $Val extends NotificationDataDto>
    implements $NotificationDataDtoCopyWith<$Res> {
  _$NotificationDataDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? createdAt = null,
    Object? isRead = null,
    Object? returnRequestId = null,
    Object? orderNumber = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      returnRequestId: null == returnRequestId
          ? _value.returnRequestId
          : returnRequestId // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationDataDtoCopyWith<$Res>
    implements $NotificationDataDtoCopyWith<$Res> {
  factory _$$_NotificationDataDtoCopyWith(_$_NotificationDataDto value,
          $Res Function(_$_NotificationDataDto) then) =
      __$$_NotificationDataDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0) int id,
      @JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'title', defaultValue: '') String title,
      @JsonKey(name: 'description', defaultValue: '') String description,
      @JsonKey(name: 'createdAt', defaultValue: '') String createdAt,
      @JsonKey(name: 'isRead') bool isRead,
      @JsonKey(name: 'returnRequestNumber', defaultValue: '')
      String returnRequestId,
      @JsonKey(name: 'orderNumber', defaultValue: '') String orderNumber});
}

/// @nodoc
class __$$_NotificationDataDtoCopyWithImpl<$Res>
    extends _$NotificationDataDtoCopyWithImpl<$Res, _$_NotificationDataDto>
    implements _$$_NotificationDataDtoCopyWith<$Res> {
  __$$_NotificationDataDtoCopyWithImpl(_$_NotificationDataDto _value,
      $Res Function(_$_NotificationDataDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? createdAt = null,
    Object? isRead = null,
    Object? returnRequestId = null,
    Object? orderNumber = null,
  }) {
    return _then(_$_NotificationDataDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      returnRequestId: null == returnRequestId
          ? _value.returnRequestId
          : returnRequestId // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationDataDto extends _NotificationDataDto {
  const _$_NotificationDataDto(
      {@JsonKey(name: 'id', defaultValue: 0) required this.id,
      @JsonKey(name: 'type', defaultValue: '') required this.type,
      @JsonKey(name: 'title', defaultValue: '') required this.title,
      @JsonKey(name: 'description', defaultValue: '') required this.description,
      @JsonKey(name: 'createdAt', defaultValue: '') required this.createdAt,
      @JsonKey(name: 'isRead') required this.isRead,
      @JsonKey(name: 'returnRequestNumber', defaultValue: '')
      required this.returnRequestId,
      @JsonKey(name: 'orderNumber', defaultValue: '')
      required this.orderNumber})
      : super._();

  factory _$_NotificationDataDto.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationDataDtoFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  final String type;
  @override
  @JsonKey(name: 'title', defaultValue: '')
  final String title;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  final String description;
  @override
  @JsonKey(name: 'createdAt', defaultValue: '')
  final String createdAt;
  @override
  @JsonKey(name: 'isRead')
  final bool isRead;
  @override
  @JsonKey(name: 'returnRequestNumber', defaultValue: '')
  final String returnRequestId;
  @override
  @JsonKey(name: 'orderNumber', defaultValue: '')
  final String orderNumber;

  @override
  String toString() {
    return 'NotificationDataDto(id: $id, type: $type, title: $title, description: $description, createdAt: $createdAt, isRead: $isRead, returnRequestId: $returnRequestId, orderNumber: $orderNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationDataDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.returnRequestId, returnRequestId) ||
                other.returnRequestId == returnRequestId) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, title, description,
      createdAt, isRead, returnRequestId, orderNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationDataDtoCopyWith<_$_NotificationDataDto> get copyWith =>
      __$$_NotificationDataDtoCopyWithImpl<_$_NotificationDataDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationDataDtoToJson(
      this,
    );
  }
}

abstract class _NotificationDataDto extends NotificationDataDto {
  const factory _NotificationDataDto(
      {@JsonKey(name: 'id', defaultValue: 0) required final int id,
      @JsonKey(name: 'type', defaultValue: '') required final String type,
      @JsonKey(name: 'title', defaultValue: '') required final String title,
      @JsonKey(name: 'description', defaultValue: '')
      required final String description,
      @JsonKey(name: 'createdAt', defaultValue: '')
      required final String createdAt,
      @JsonKey(name: 'isRead') required final bool isRead,
      @JsonKey(name: 'returnRequestNumber', defaultValue: '')
      required final String returnRequestId,
      @JsonKey(name: 'orderNumber', defaultValue: '')
      required final String orderNumber}) = _$_NotificationDataDto;
  const _NotificationDataDto._() : super._();

  factory _NotificationDataDto.fromJson(Map<String, dynamic> json) =
      _$_NotificationDataDto.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: 0)
  int get id;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'title', defaultValue: '')
  String get title;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  String get description;
  @override
  @JsonKey(name: 'createdAt', defaultValue: '')
  String get createdAt;
  @override
  @JsonKey(name: 'isRead')
  bool get isRead;
  @override
  @JsonKey(name: 'returnRequestNumber', defaultValue: '')
  String get returnRequestId;
  @override
  @JsonKey(name: 'orderNumber', defaultValue: '')
  String get orderNumber;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationDataDtoCopyWith<_$_NotificationDataDto> get copyWith =>
      throw _privateConstructorUsedError;
}
