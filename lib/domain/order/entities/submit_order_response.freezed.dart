// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_order_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SubmitOrderResponse {
  String get salesDocument => throw _privateConstructorUsedError;
  List<SubmitOrderResponseMessage> get messages =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubmitOrderResponseCopyWith<SubmitOrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitOrderResponseCopyWith<$Res> {
  factory $SubmitOrderResponseCopyWith(
          SubmitOrderResponse value, $Res Function(SubmitOrderResponse) then) =
      _$SubmitOrderResponseCopyWithImpl<$Res, SubmitOrderResponse>;
  @useResult
  $Res call({String salesDocument, List<SubmitOrderResponseMessage> messages});
}

/// @nodoc
class _$SubmitOrderResponseCopyWithImpl<$Res, $Val extends SubmitOrderResponse>
    implements $SubmitOrderResponseCopyWith<$Res> {
  _$SubmitOrderResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesDocument = null,
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      salesDocument: null == salesDocument
          ? _value.salesDocument
          : salesDocument // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<SubmitOrderResponseMessage>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubmitOrderResponseCopyWith<$Res>
    implements $SubmitOrderResponseCopyWith<$Res> {
  factory _$$_SubmitOrderResponseCopyWith(_$_SubmitOrderResponse value,
          $Res Function(_$_SubmitOrderResponse) then) =
      __$$_SubmitOrderResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String salesDocument, List<SubmitOrderResponseMessage> messages});
}

/// @nodoc
class __$$_SubmitOrderResponseCopyWithImpl<$Res>
    extends _$SubmitOrderResponseCopyWithImpl<$Res, _$_SubmitOrderResponse>
    implements _$$_SubmitOrderResponseCopyWith<$Res> {
  __$$_SubmitOrderResponseCopyWithImpl(_$_SubmitOrderResponse _value,
      $Res Function(_$_SubmitOrderResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesDocument = null,
    Object? messages = null,
  }) {
    return _then(_$_SubmitOrderResponse(
      salesDocument: null == salesDocument
          ? _value.salesDocument
          : salesDocument // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<SubmitOrderResponseMessage>,
    ));
  }
}

/// @nodoc

class _$_SubmitOrderResponse extends _SubmitOrderResponse {
  const _$_SubmitOrderResponse(
      {required this.salesDocument,
      required final List<SubmitOrderResponseMessage> messages})
      : _messages = messages,
        super._();

  @override
  final String salesDocument;
  final List<SubmitOrderResponseMessage> _messages;
  @override
  List<SubmitOrderResponseMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'SubmitOrderResponse(salesDocument: $salesDocument, messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubmitOrderResponse &&
            (identical(other.salesDocument, salesDocument) ||
                other.salesDocument == salesDocument) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesDocument,
      const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubmitOrderResponseCopyWith<_$_SubmitOrderResponse> get copyWith =>
      __$$_SubmitOrderResponseCopyWithImpl<_$_SubmitOrderResponse>(
          this, _$identity);
}

abstract class _SubmitOrderResponse extends SubmitOrderResponse {
  const factory _SubmitOrderResponse(
          {required final String salesDocument,
          required final List<SubmitOrderResponseMessage> messages}) =
      _$_SubmitOrderResponse;
  const _SubmitOrderResponse._() : super._();

  @override
  String get salesDocument;
  @override
  List<SubmitOrderResponseMessage> get messages;
  @override
  @JsonKey(ignore: true)
  _$$_SubmitOrderResponseCopyWith<_$_SubmitOrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
