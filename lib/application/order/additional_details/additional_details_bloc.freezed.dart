// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'additional_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AdditionalDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisationConfigs config) initialized,
    required TResult Function(AdditionalDetailsLabel label, String newValue)
        onTextChange,
    required TResult Function(SalesOrganisationConfigs config) validateForm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisationConfigs config)? initialized,
    TResult? Function(AdditionalDetailsLabel label, String newValue)?
        onTextChange,
    TResult? Function(SalesOrganisationConfigs config)? validateForm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisationConfigs config)? initialized,
    TResult Function(AdditionalDetailsLabel label, String newValue)?
        onTextChange,
    TResult Function(SalesOrganisationConfigs config)? validateForm,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AdditionalDetailsTextOnChange value)
        onTextChange,
    required TResult Function(_AdditionalDetailsValidateForm value)
        validateForm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AdditionalDetailsTextOnChange value)? onTextChange,
    TResult? Function(_AdditionalDetailsValidateForm value)? validateForm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AdditionalDetailsTextOnChange value)? onTextChange,
    TResult Function(_AdditionalDetailsValidateForm value)? validateForm,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdditionalDetailsEventCopyWith<$Res> {
  factory $AdditionalDetailsEventCopyWith(AdditionalDetailsEvent value,
          $Res Function(AdditionalDetailsEvent) then) =
      _$AdditionalDetailsEventCopyWithImpl<$Res, AdditionalDetailsEvent>;
}

/// @nodoc
class _$AdditionalDetailsEventCopyWithImpl<$Res,
        $Val extends AdditionalDetailsEvent>
    implements $AdditionalDetailsEventCopyWith<$Res> {
  _$AdditionalDetailsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrganisationConfigs config});

  $SalesOrganisationConfigsCopyWith<$Res> get config;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$AdditionalDetailsEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$_Initialized(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationConfigsCopyWith<$Res> get config {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value));
    });
  }
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized({required this.config});

  @override
  final SalesOrganisationConfigs config;

  @override
  String toString() {
    return 'AdditionalDetailsEvent.initialized(config: $config)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initialized &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      __$$_InitializedCopyWithImpl<_$_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisationConfigs config) initialized,
    required TResult Function(AdditionalDetailsLabel label, String newValue)
        onTextChange,
    required TResult Function(SalesOrganisationConfigs config) validateForm,
  }) {
    return initialized(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisationConfigs config)? initialized,
    TResult? Function(AdditionalDetailsLabel label, String newValue)?
        onTextChange,
    TResult? Function(SalesOrganisationConfigs config)? validateForm,
  }) {
    return initialized?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisationConfigs config)? initialized,
    TResult Function(AdditionalDetailsLabel label, String newValue)?
        onTextChange,
    TResult Function(SalesOrganisationConfigs config)? validateForm,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(config);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AdditionalDetailsTextOnChange value)
        onTextChange,
    required TResult Function(_AdditionalDetailsValidateForm value)
        validateForm,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AdditionalDetailsTextOnChange value)? onTextChange,
    TResult? Function(_AdditionalDetailsValidateForm value)? validateForm,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AdditionalDetailsTextOnChange value)? onTextChange,
    TResult Function(_AdditionalDetailsValidateForm value)? validateForm,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements AdditionalDetailsEvent {
  const factory _Initialized({required final SalesOrganisationConfigs config}) =
      _$_Initialized;

  SalesOrganisationConfigs get config;
  @JsonKey(ignore: true)
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AdditionalDetailsTextOnChangeCopyWith<$Res> {
  factory _$$_AdditionalDetailsTextOnChangeCopyWith(
          _$_AdditionalDetailsTextOnChange value,
          $Res Function(_$_AdditionalDetailsTextOnChange) then) =
      __$$_AdditionalDetailsTextOnChangeCopyWithImpl<$Res>;
  @useResult
  $Res call({AdditionalDetailsLabel label, String newValue});
}

/// @nodoc
class __$$_AdditionalDetailsTextOnChangeCopyWithImpl<$Res>
    extends _$AdditionalDetailsEventCopyWithImpl<$Res,
        _$_AdditionalDetailsTextOnChange>
    implements _$$_AdditionalDetailsTextOnChangeCopyWith<$Res> {
  __$$_AdditionalDetailsTextOnChangeCopyWithImpl(
      _$_AdditionalDetailsTextOnChange _value,
      $Res Function(_$_AdditionalDetailsTextOnChange) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? newValue = null,
  }) {
    return _then(_$_AdditionalDetailsTextOnChange(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as AdditionalDetailsLabel,
      newValue: null == newValue
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AdditionalDetailsTextOnChange
    implements _AdditionalDetailsTextOnChange {
  const _$_AdditionalDetailsTextOnChange(
      {required this.label, required this.newValue});

  @override
  final AdditionalDetailsLabel label;
  @override
  final String newValue;

  @override
  String toString() {
    return 'AdditionalDetailsEvent.onTextChange(label: $label, newValue: $newValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdditionalDetailsTextOnChange &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.newValue, newValue) ||
                other.newValue == newValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, newValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdditionalDetailsTextOnChangeCopyWith<_$_AdditionalDetailsTextOnChange>
      get copyWith => __$$_AdditionalDetailsTextOnChangeCopyWithImpl<
          _$_AdditionalDetailsTextOnChange>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisationConfigs config) initialized,
    required TResult Function(AdditionalDetailsLabel label, String newValue)
        onTextChange,
    required TResult Function(SalesOrganisationConfigs config) validateForm,
  }) {
    return onTextChange(label, newValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisationConfigs config)? initialized,
    TResult? Function(AdditionalDetailsLabel label, String newValue)?
        onTextChange,
    TResult? Function(SalesOrganisationConfigs config)? validateForm,
  }) {
    return onTextChange?.call(label, newValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisationConfigs config)? initialized,
    TResult Function(AdditionalDetailsLabel label, String newValue)?
        onTextChange,
    TResult Function(SalesOrganisationConfigs config)? validateForm,
    required TResult orElse(),
  }) {
    if (onTextChange != null) {
      return onTextChange(label, newValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AdditionalDetailsTextOnChange value)
        onTextChange,
    required TResult Function(_AdditionalDetailsValidateForm value)
        validateForm,
  }) {
    return onTextChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AdditionalDetailsTextOnChange value)? onTextChange,
    TResult? Function(_AdditionalDetailsValidateForm value)? validateForm,
  }) {
    return onTextChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AdditionalDetailsTextOnChange value)? onTextChange,
    TResult Function(_AdditionalDetailsValidateForm value)? validateForm,
    required TResult orElse(),
  }) {
    if (onTextChange != null) {
      return onTextChange(this);
    }
    return orElse();
  }
}

abstract class _AdditionalDetailsTextOnChange
    implements AdditionalDetailsEvent {
  const factory _AdditionalDetailsTextOnChange(
      {required final AdditionalDetailsLabel label,
      required final String newValue}) = _$_AdditionalDetailsTextOnChange;

  AdditionalDetailsLabel get label;
  String get newValue;
  @JsonKey(ignore: true)
  _$$_AdditionalDetailsTextOnChangeCopyWith<_$_AdditionalDetailsTextOnChange>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AdditionalDetailsValidateFormCopyWith<$Res> {
  factory _$$_AdditionalDetailsValidateFormCopyWith(
          _$_AdditionalDetailsValidateForm value,
          $Res Function(_$_AdditionalDetailsValidateForm) then) =
      __$$_AdditionalDetailsValidateFormCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrganisationConfigs config});

  $SalesOrganisationConfigsCopyWith<$Res> get config;
}

/// @nodoc
class __$$_AdditionalDetailsValidateFormCopyWithImpl<$Res>
    extends _$AdditionalDetailsEventCopyWithImpl<$Res,
        _$_AdditionalDetailsValidateForm>
    implements _$$_AdditionalDetailsValidateFormCopyWith<$Res> {
  __$$_AdditionalDetailsValidateFormCopyWithImpl(
      _$_AdditionalDetailsValidateForm _value,
      $Res Function(_$_AdditionalDetailsValidateForm) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$_AdditionalDetailsValidateForm(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationConfigsCopyWith<$Res> get config {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value));
    });
  }
}

/// @nodoc

class _$_AdditionalDetailsValidateForm
    implements _AdditionalDetailsValidateForm {
  const _$_AdditionalDetailsValidateForm({required this.config});

  @override
  final SalesOrganisationConfigs config;

  @override
  String toString() {
    return 'AdditionalDetailsEvent.validateForm(config: $config)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdditionalDetailsValidateForm &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdditionalDetailsValidateFormCopyWith<_$_AdditionalDetailsValidateForm>
      get copyWith => __$$_AdditionalDetailsValidateFormCopyWithImpl<
          _$_AdditionalDetailsValidateForm>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisationConfigs config) initialized,
    required TResult Function(AdditionalDetailsLabel label, String newValue)
        onTextChange,
    required TResult Function(SalesOrganisationConfigs config) validateForm,
  }) {
    return validateForm(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisationConfigs config)? initialized,
    TResult? Function(AdditionalDetailsLabel label, String newValue)?
        onTextChange,
    TResult? Function(SalesOrganisationConfigs config)? validateForm,
  }) {
    return validateForm?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisationConfigs config)? initialized,
    TResult Function(AdditionalDetailsLabel label, String newValue)?
        onTextChange,
    TResult Function(SalesOrganisationConfigs config)? validateForm,
    required TResult orElse(),
  }) {
    if (validateForm != null) {
      return validateForm(config);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AdditionalDetailsTextOnChange value)
        onTextChange,
    required TResult Function(_AdditionalDetailsValidateForm value)
        validateForm,
  }) {
    return validateForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AdditionalDetailsTextOnChange value)? onTextChange,
    TResult? Function(_AdditionalDetailsValidateForm value)? validateForm,
  }) {
    return validateForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AdditionalDetailsTextOnChange value)? onTextChange,
    TResult Function(_AdditionalDetailsValidateForm value)? validateForm,
    required TResult orElse(),
  }) {
    if (validateForm != null) {
      return validateForm(this);
    }
    return orElse();
  }
}

abstract class _AdditionalDetailsValidateForm
    implements AdditionalDetailsEvent {
  const factory _AdditionalDetailsValidateForm(
          {required final SalesOrganisationConfigs config}) =
      _$_AdditionalDetailsValidateForm;

  SalesOrganisationConfigs get config;
  @JsonKey(ignore: true)
  _$$_AdditionalDetailsValidateFormCopyWith<_$_AdditionalDetailsValidateForm>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AdditionalDetailsState {
  AdditionalDetailsData get additionalDetailsData =>
      throw _privateConstructorUsedError;
  bool get isValidated => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdditionalDetailsStateCopyWith<AdditionalDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdditionalDetailsStateCopyWith<$Res> {
  factory $AdditionalDetailsStateCopyWith(AdditionalDetailsState value,
          $Res Function(AdditionalDetailsState) then) =
      _$AdditionalDetailsStateCopyWithImpl<$Res, AdditionalDetailsState>;
  @useResult
  $Res call(
      {AdditionalDetailsData additionalDetailsData,
      bool isValidated,
      bool showErrorMessages});

  $AdditionalDetailsDataCopyWith<$Res> get additionalDetailsData;
}

/// @nodoc
class _$AdditionalDetailsStateCopyWithImpl<$Res,
        $Val extends AdditionalDetailsState>
    implements $AdditionalDetailsStateCopyWith<$Res> {
  _$AdditionalDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? additionalDetailsData = null,
    Object? isValidated = null,
    Object? showErrorMessages = null,
  }) {
    return _then(_value.copyWith(
      additionalDetailsData: null == additionalDetailsData
          ? _value.additionalDetailsData
          : additionalDetailsData // ignore: cast_nullable_to_non_nullable
              as AdditionalDetailsData,
      isValidated: null == isValidated
          ? _value.isValidated
          : isValidated // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AdditionalDetailsDataCopyWith<$Res> get additionalDetailsData {
    return $AdditionalDetailsDataCopyWith<$Res>(_value.additionalDetailsData,
        (value) {
      return _then(_value.copyWith(additionalDetailsData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AdditionalDetailsStateCopyWith<$Res>
    implements $AdditionalDetailsStateCopyWith<$Res> {
  factory _$$_AdditionalDetailsStateCopyWith(_$_AdditionalDetailsState value,
          $Res Function(_$_AdditionalDetailsState) then) =
      __$$_AdditionalDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AdditionalDetailsData additionalDetailsData,
      bool isValidated,
      bool showErrorMessages});

  @override
  $AdditionalDetailsDataCopyWith<$Res> get additionalDetailsData;
}

/// @nodoc
class __$$_AdditionalDetailsStateCopyWithImpl<$Res>
    extends _$AdditionalDetailsStateCopyWithImpl<$Res,
        _$_AdditionalDetailsState>
    implements _$$_AdditionalDetailsStateCopyWith<$Res> {
  __$$_AdditionalDetailsStateCopyWithImpl(_$_AdditionalDetailsState _value,
      $Res Function(_$_AdditionalDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? additionalDetailsData = null,
    Object? isValidated = null,
    Object? showErrorMessages = null,
  }) {
    return _then(_$_AdditionalDetailsState(
      additionalDetailsData: null == additionalDetailsData
          ? _value.additionalDetailsData
          : additionalDetailsData // ignore: cast_nullable_to_non_nullable
              as AdditionalDetailsData,
      isValidated: null == isValidated
          ? _value.isValidated
          : isValidated // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AdditionalDetailsState extends _AdditionalDetailsState {
  const _$_AdditionalDetailsState(
      {required this.additionalDetailsData,
      required this.isValidated,
      required this.showErrorMessages})
      : super._();

  @override
  final AdditionalDetailsData additionalDetailsData;
  @override
  final bool isValidated;
  @override
  final bool showErrorMessages;

  @override
  String toString() {
    return 'AdditionalDetailsState(additionalDetailsData: $additionalDetailsData, isValidated: $isValidated, showErrorMessages: $showErrorMessages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdditionalDetailsState &&
            (identical(other.additionalDetailsData, additionalDetailsData) ||
                other.additionalDetailsData == additionalDetailsData) &&
            (identical(other.isValidated, isValidated) ||
                other.isValidated == isValidated) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, additionalDetailsData, isValidated, showErrorMessages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdditionalDetailsStateCopyWith<_$_AdditionalDetailsState> get copyWith =>
      __$$_AdditionalDetailsStateCopyWithImpl<_$_AdditionalDetailsState>(
          this, _$identity);
}

abstract class _AdditionalDetailsState extends AdditionalDetailsState {
  const factory _AdditionalDetailsState(
      {required final AdditionalDetailsData additionalDetailsData,
      required final bool isValidated,
      required final bool showErrorMessages}) = _$_AdditionalDetailsState;
  const _AdditionalDetailsState._() : super._();

  @override
  AdditionalDetailsData get additionalDetailsData;
  @override
  bool get isValidated;
  @override
  bool get showErrorMessages;
  @override
  @JsonKey(ignore: true)
  _$$_AdditionalDetailsStateCopyWith<_$_AdditionalDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
