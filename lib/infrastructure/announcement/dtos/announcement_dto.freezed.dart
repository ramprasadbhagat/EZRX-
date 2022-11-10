// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'announcement_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnnouncementDto _$AnnouncementDtoFromJson(Map<String, dynamic> json) {
  return _AnnouncementDto.fromJson(json);
}

/// @nodoc
mixin _$AnnouncementDto {
  @JsonKey(
      name: 'startTime',
      defaultValue: '',
      readValue: announcementDateTimeFormatCheck)
  String get startTime => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'endTime',
      defaultValue: '',
      readValue: announcementDateTimeFormatCheck)
  String get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'description', defaultValue: '')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'id', defaultValue: '')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'type', defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'active', defaultValue: false)
  bool get active => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnnouncementDtoCopyWith<AnnouncementDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementDtoCopyWith<$Res> {
  factory $AnnouncementDtoCopyWith(
          AnnouncementDto value, $Res Function(AnnouncementDto) then) =
      _$AnnouncementDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'startTime', defaultValue: '', readValue: announcementDateTimeFormatCheck)
          String startTime,
      @JsonKey(name: 'endTime', defaultValue: '', readValue: announcementDateTimeFormatCheck)
          String endTime,
      @JsonKey(name: 'description', defaultValue: '')
          String description,
      @JsonKey(name: 'id', defaultValue: '')
          String id,
      @JsonKey(name: 'type', defaultValue: '')
          String type,
      @JsonKey(name: 'active', defaultValue: false)
          bool active});
}

/// @nodoc
class _$AnnouncementDtoCopyWithImpl<$Res>
    implements $AnnouncementDtoCopyWith<$Res> {
  _$AnnouncementDtoCopyWithImpl(this._value, this._then);

  final AnnouncementDto _value;
  // ignore: unused_field
  final $Res Function(AnnouncementDto) _then;

  @override
  $Res call({
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? description = freezed,
    Object? id = freezed,
    Object? type = freezed,
    Object? active = freezed,
  }) {
    return _then(_value.copyWith(
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_AnnouncementDtoCopyWith<$Res>
    implements $AnnouncementDtoCopyWith<$Res> {
  factory _$$_AnnouncementDtoCopyWith(
          _$_AnnouncementDto value, $Res Function(_$_AnnouncementDto) then) =
      __$$_AnnouncementDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'startTime', defaultValue: '', readValue: announcementDateTimeFormatCheck)
          String startTime,
      @JsonKey(name: 'endTime', defaultValue: '', readValue: announcementDateTimeFormatCheck)
          String endTime,
      @JsonKey(name: 'description', defaultValue: '')
          String description,
      @JsonKey(name: 'id', defaultValue: '')
          String id,
      @JsonKey(name: 'type', defaultValue: '')
          String type,
      @JsonKey(name: 'active', defaultValue: false)
          bool active});
}

/// @nodoc
class __$$_AnnouncementDtoCopyWithImpl<$Res>
    extends _$AnnouncementDtoCopyWithImpl<$Res>
    implements _$$_AnnouncementDtoCopyWith<$Res> {
  __$$_AnnouncementDtoCopyWithImpl(
      _$_AnnouncementDto _value, $Res Function(_$_AnnouncementDto) _then)
      : super(_value, (v) => _then(v as _$_AnnouncementDto));

  @override
  _$_AnnouncementDto get _value => super._value as _$_AnnouncementDto;

  @override
  $Res call({
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? description = freezed,
    Object? id = freezed,
    Object? type = freezed,
    Object? active = freezed,
  }) {
    return _then(_$_AnnouncementDto(
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_AnnouncementDto extends _AnnouncementDto {
  const _$_AnnouncementDto(
      {@JsonKey(name: 'startTime', defaultValue: '', readValue: announcementDateTimeFormatCheck)
          required this.startTime,
      @JsonKey(name: 'endTime', defaultValue: '', readValue: announcementDateTimeFormatCheck)
          required this.endTime,
      @JsonKey(name: 'description', defaultValue: '')
          required this.description,
      @JsonKey(name: 'id', defaultValue: '')
          required this.id,
      @JsonKey(name: 'type', defaultValue: '')
          required this.type,
      @JsonKey(name: 'active', defaultValue: false)
          required this.active})
      : super._();

  factory _$_AnnouncementDto.fromJson(Map<String, dynamic> json) =>
      _$$_AnnouncementDtoFromJson(json);

  @override
  @JsonKey(
      name: 'startTime',
      defaultValue: '',
      readValue: announcementDateTimeFormatCheck)
  final String startTime;
  @override
  @JsonKey(
      name: 'endTime',
      defaultValue: '',
      readValue: announcementDateTimeFormatCheck)
  final String endTime;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  final String description;
  @override
  @JsonKey(name: 'id', defaultValue: '')
  final String id;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  final String type;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  final bool active;

  @override
  String toString() {
    return 'AnnouncementDto(startTime: $startTime, endTime: $endTime, description: $description, id: $id, type: $type, active: $active)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnnouncementDto &&
            const DeepCollectionEquality().equals(other.startTime, startTime) &&
            const DeepCollectionEquality().equals(other.endTime, endTime) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.active, active));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(startTime),
      const DeepCollectionEquality().hash(endTime),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(active));

  @JsonKey(ignore: true)
  @override
  _$$_AnnouncementDtoCopyWith<_$_AnnouncementDto> get copyWith =>
      __$$_AnnouncementDtoCopyWithImpl<_$_AnnouncementDto>(this, _$identity);
}

abstract class _AnnouncementDto extends AnnouncementDto {
  const factory _AnnouncementDto(
      {@JsonKey(name: 'startTime', defaultValue: '', readValue: announcementDateTimeFormatCheck)
          required final String startTime,
      @JsonKey(name: 'endTime', defaultValue: '', readValue: announcementDateTimeFormatCheck)
          required final String endTime,
      @JsonKey(name: 'description', defaultValue: '')
          required final String description,
      @JsonKey(name: 'id', defaultValue: '')
          required final String id,
      @JsonKey(name: 'type', defaultValue: '')
          required final String type,
      @JsonKey(name: 'active', defaultValue: false)
          required final bool active}) = _$_AnnouncementDto;
  const _AnnouncementDto._() : super._();

  factory _AnnouncementDto.fromJson(Map<String, dynamic> json) =
      _$_AnnouncementDto.fromJson;

  @override
  @JsonKey(
      name: 'startTime',
      defaultValue: '',
      readValue: announcementDateTimeFormatCheck)
  String get startTime;
  @override
  @JsonKey(
      name: 'endTime',
      defaultValue: '',
      readValue: announcementDateTimeFormatCheck)
  String get endTime;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  String get description;
  @override
  @JsonKey(name: 'id', defaultValue: '')
  String get id;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  bool get active;
  @override
  @JsonKey(ignore: true)
  _$$_AnnouncementDtoCopyWith<_$_AnnouncementDto> get copyWith =>
      throw _privateConstructorUsedError;
}
