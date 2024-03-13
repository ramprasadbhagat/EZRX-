// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_order_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubmitOrderResponseDto _$SubmitOrderResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _SubmitOrderResponseDto.fromJson(json);
}

/// @nodoc
mixin _$SubmitOrderResponseDto {
  @JsonKey(name: 'SalesDocument', defaultValue: '')
  String get salesDocument => throw _privateConstructorUsedError;
  @JsonKey(name: 'SalesDocuments', defaultValue: <String>[])
  List<String> get salesDocuments => throw _privateConstructorUsedError;
  @JsonKey(name: 'Messages', defaultValue: <SubmitOrderResponseMessageDto>[])
  List<SubmitOrderResponseMessageDto> get messages =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubmitOrderResponseDtoCopyWith<SubmitOrderResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitOrderResponseDtoCopyWith<$Res> {
  factory $SubmitOrderResponseDtoCopyWith(SubmitOrderResponseDto value,
          $Res Function(SubmitOrderResponseDto) then) =
      _$SubmitOrderResponseDtoCopyWithImpl<$Res, SubmitOrderResponseDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'SalesDocument', defaultValue: '') String salesDocument,
      @JsonKey(name: 'SalesDocuments', defaultValue: <String>[])
      List<String> salesDocuments,
      @JsonKey(
          name: 'Messages', defaultValue: <SubmitOrderResponseMessageDto>[])
      List<SubmitOrderResponseMessageDto> messages});
}

/// @nodoc
class _$SubmitOrderResponseDtoCopyWithImpl<$Res,
        $Val extends SubmitOrderResponseDto>
    implements $SubmitOrderResponseDtoCopyWith<$Res> {
  _$SubmitOrderResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesDocument = null,
    Object? salesDocuments = null,
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      salesDocument: null == salesDocument
          ? _value.salesDocument
          : salesDocument // ignore: cast_nullable_to_non_nullable
              as String,
      salesDocuments: null == salesDocuments
          ? _value.salesDocuments
          : salesDocuments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<SubmitOrderResponseMessageDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubmitOrderResponseDtoCopyWith<$Res>
    implements $SubmitOrderResponseDtoCopyWith<$Res> {
  factory _$$_SubmitOrderResponseDtoCopyWith(_$_SubmitOrderResponseDto value,
          $Res Function(_$_SubmitOrderResponseDto) then) =
      __$$_SubmitOrderResponseDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'SalesDocument', defaultValue: '') String salesDocument,
      @JsonKey(name: 'SalesDocuments', defaultValue: <String>[])
      List<String> salesDocuments,
      @JsonKey(
          name: 'Messages', defaultValue: <SubmitOrderResponseMessageDto>[])
      List<SubmitOrderResponseMessageDto> messages});
}

/// @nodoc
class __$$_SubmitOrderResponseDtoCopyWithImpl<$Res>
    extends _$SubmitOrderResponseDtoCopyWithImpl<$Res,
        _$_SubmitOrderResponseDto>
    implements _$$_SubmitOrderResponseDtoCopyWith<$Res> {
  __$$_SubmitOrderResponseDtoCopyWithImpl(_$_SubmitOrderResponseDto _value,
      $Res Function(_$_SubmitOrderResponseDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesDocument = null,
    Object? salesDocuments = null,
    Object? messages = null,
  }) {
    return _then(_$_SubmitOrderResponseDto(
      salesDocument: null == salesDocument
          ? _value.salesDocument
          : salesDocument // ignore: cast_nullable_to_non_nullable
              as String,
      salesDocuments: null == salesDocuments
          ? _value._salesDocuments
          : salesDocuments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<SubmitOrderResponseMessageDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubmitOrderResponseDto extends _SubmitOrderResponseDto {
  const _$_SubmitOrderResponseDto(
      {@JsonKey(name: 'SalesDocument', defaultValue: '')
      required this.salesDocument,
      @JsonKey(name: 'SalesDocuments', defaultValue: <String>[])
      required final List<String> salesDocuments,
      @JsonKey(
          name: 'Messages', defaultValue: <SubmitOrderResponseMessageDto>[])
      required final List<SubmitOrderResponseMessageDto> messages})
      : _salesDocuments = salesDocuments,
        _messages = messages,
        super._();

  factory _$_SubmitOrderResponseDto.fromJson(Map<String, dynamic> json) =>
      _$$_SubmitOrderResponseDtoFromJson(json);

  @override
  @JsonKey(name: 'SalesDocument', defaultValue: '')
  final String salesDocument;
  final List<String> _salesDocuments;
  @override
  @JsonKey(name: 'SalesDocuments', defaultValue: <String>[])
  List<String> get salesDocuments {
    if (_salesDocuments is EqualUnmodifiableListView) return _salesDocuments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_salesDocuments);
  }

  final List<SubmitOrderResponseMessageDto> _messages;
  @override
  @JsonKey(name: 'Messages', defaultValue: <SubmitOrderResponseMessageDto>[])
  List<SubmitOrderResponseMessageDto> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'SubmitOrderResponseDto(salesDocument: $salesDocument, salesDocuments: $salesDocuments, messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubmitOrderResponseDto &&
            (identical(other.salesDocument, salesDocument) ||
                other.salesDocument == salesDocument) &&
            const DeepCollectionEquality()
                .equals(other._salesDocuments, _salesDocuments) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      salesDocument,
      const DeepCollectionEquality().hash(_salesDocuments),
      const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubmitOrderResponseDtoCopyWith<_$_SubmitOrderResponseDto> get copyWith =>
      __$$_SubmitOrderResponseDtoCopyWithImpl<_$_SubmitOrderResponseDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubmitOrderResponseDtoToJson(
      this,
    );
  }
}

abstract class _SubmitOrderResponseDto extends SubmitOrderResponseDto {
  const factory _SubmitOrderResponseDto(
          {@JsonKey(name: 'SalesDocument', defaultValue: '')
          required final String salesDocument,
          @JsonKey(name: 'SalesDocuments', defaultValue: <String>[])
          required final List<String> salesDocuments,
          @JsonKey(
              name: 'Messages', defaultValue: <SubmitOrderResponseMessageDto>[])
          required final List<SubmitOrderResponseMessageDto> messages}) =
      _$_SubmitOrderResponseDto;
  const _SubmitOrderResponseDto._() : super._();

  factory _SubmitOrderResponseDto.fromJson(Map<String, dynamic> json) =
      _$_SubmitOrderResponseDto.fromJson;

  @override
  @JsonKey(name: 'SalesDocument', defaultValue: '')
  String get salesDocument;
  @override
  @JsonKey(name: 'SalesDocuments', defaultValue: <String>[])
  List<String> get salesDocuments;
  @override
  @JsonKey(name: 'Messages', defaultValue: <SubmitOrderResponseMessageDto>[])
  List<SubmitOrderResponseMessageDto> get messages;
  @override
  @JsonKey(ignore: true)
  _$$_SubmitOrderResponseDtoCopyWith<_$_SubmitOrderResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}
