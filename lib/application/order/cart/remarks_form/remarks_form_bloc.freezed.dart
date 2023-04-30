// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remarks_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RemarksFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) remarksChanged,
    required TResult Function() submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? remarksChanged,
    TResult? Function()? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? remarksChanged,
    TResult Function()? submit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RemarksChanged value) remarksChanged,
    required TResult Function(_Submit value) submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RemarksChanged value)? remarksChanged,
    TResult? Function(_Submit value)? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemarksFormEventCopyWith<$Res> {
  factory $RemarksFormEventCopyWith(
          RemarksFormEvent value, $Res Function(RemarksFormEvent) then) =
      _$RemarksFormEventCopyWithImpl<$Res, RemarksFormEvent>;
}

/// @nodoc
class _$RemarksFormEventCopyWithImpl<$Res, $Val extends RemarksFormEvent>
    implements $RemarksFormEventCopyWith<$Res> {
  _$RemarksFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_RemarksChangedCopyWith<$Res> {
  factory _$$_RemarksChangedCopyWith(
          _$_RemarksChanged value, $Res Function(_$_RemarksChanged) then) =
      __$$_RemarksChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_RemarksChangedCopyWithImpl<$Res>
    extends _$RemarksFormEventCopyWithImpl<$Res, _$_RemarksChanged>
    implements _$$_RemarksChangedCopyWith<$Res> {
  __$$_RemarksChangedCopyWithImpl(
      _$_RemarksChanged _value, $Res Function(_$_RemarksChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_RemarksChanged(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RemarksChanged implements _RemarksChanged {
  const _$_RemarksChanged(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RemarksFormEvent.remarksChanged(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemarksChanged &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemarksChangedCopyWith<_$_RemarksChanged> get copyWith =>
      __$$_RemarksChangedCopyWithImpl<_$_RemarksChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) remarksChanged,
    required TResult Function() submit,
  }) {
    return remarksChanged(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? remarksChanged,
    TResult? Function()? submit,
  }) {
    return remarksChanged?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? remarksChanged,
    TResult Function()? submit,
    required TResult orElse(),
  }) {
    if (remarksChanged != null) {
      return remarksChanged(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RemarksChanged value) remarksChanged,
    required TResult Function(_Submit value) submit,
  }) {
    return remarksChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RemarksChanged value)? remarksChanged,
    TResult? Function(_Submit value)? submit,
  }) {
    return remarksChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (remarksChanged != null) {
      return remarksChanged(this);
    }
    return orElse();
  }
}

abstract class _RemarksChanged implements RemarksFormEvent {
  const factory _RemarksChanged(final String message) = _$_RemarksChanged;

  String get message;
  @JsonKey(ignore: true)
  _$$_RemarksChangedCopyWith<_$_RemarksChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SubmitCopyWith<$Res> {
  factory _$$_SubmitCopyWith(_$_Submit value, $Res Function(_$_Submit) then) =
      __$$_SubmitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SubmitCopyWithImpl<$Res>
    extends _$RemarksFormEventCopyWithImpl<$Res, _$_Submit>
    implements _$$_SubmitCopyWith<$Res> {
  __$$_SubmitCopyWithImpl(_$_Submit _value, $Res Function(_$_Submit) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Submit implements _Submit {
  const _$_Submit();

  @override
  String toString() {
    return 'RemarksFormEvent.submit()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Submit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) remarksChanged,
    required TResult Function() submit,
  }) {
    return submit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? remarksChanged,
    TResult? Function()? submit,
  }) {
    return submit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? remarksChanged,
    TResult Function()? submit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RemarksChanged value) remarksChanged,
    required TResult Function(_Submit value) submit,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RemarksChanged value)? remarksChanged,
    TResult? Function(_Submit value)? submit,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class _Submit implements RemarksFormEvent {
  const factory _Submit() = _$_Submit;
}

/// @nodoc
mixin _$RemarksFormState {
  Remarks get remarks => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RemarksFormStateCopyWith<RemarksFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemarksFormStateCopyWith<$Res> {
  factory $RemarksFormStateCopyWith(
          RemarksFormState value, $Res Function(RemarksFormState) then) =
      _$RemarksFormStateCopyWithImpl<$Res, RemarksFormState>;
  @useResult
  $Res call({Remarks remarks, bool showErrorMessages, bool isSubmitting});
}

/// @nodoc
class _$RemarksFormStateCopyWithImpl<$Res, $Val extends RemarksFormState>
    implements $RemarksFormStateCopyWith<$Res> {
  _$RemarksFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remarks = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
  }) {
    return _then(_value.copyWith(
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as Remarks,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RemarksFormStateCopyWith<$Res>
    implements $RemarksFormStateCopyWith<$Res> {
  factory _$$_RemarksFormStateCopyWith(
          _$_RemarksFormState value, $Res Function(_$_RemarksFormState) then) =
      __$$_RemarksFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Remarks remarks, bool showErrorMessages, bool isSubmitting});
}

/// @nodoc
class __$$_RemarksFormStateCopyWithImpl<$Res>
    extends _$RemarksFormStateCopyWithImpl<$Res, _$_RemarksFormState>
    implements _$$_RemarksFormStateCopyWith<$Res> {
  __$$_RemarksFormStateCopyWithImpl(
      _$_RemarksFormState _value, $Res Function(_$_RemarksFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remarks = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
  }) {
    return _then(_$_RemarksFormState(
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as Remarks,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_RemarksFormState extends _RemarksFormState {
  const _$_RemarksFormState(
      {required this.remarks,
      required this.showErrorMessages,
      required this.isSubmitting})
      : super._();

  @override
  final Remarks remarks;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;

  @override
  String toString() {
    return 'RemarksFormState(remarks: $remarks, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemarksFormState &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, remarks, showErrorMessages, isSubmitting);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemarksFormStateCopyWith<_$_RemarksFormState> get copyWith =>
      __$$_RemarksFormStateCopyWithImpl<_$_RemarksFormState>(this, _$identity);
}

abstract class _RemarksFormState extends RemarksFormState {
  const factory _RemarksFormState(
      {required final Remarks remarks,
      required final bool showErrorMessages,
      required final bool isSubmitting}) = _$_RemarksFormState;
  const _RemarksFormState._() : super._();

  @override
  Remarks get remarks;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  @JsonKey(ignore: true)
  _$$_RemarksFormStateCopyWith<_$_RemarksFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
