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
    required TResult Function(List<PoDocuments> poDocuments) addPoDocument,
    required TResult Function(PoDocuments poDocument) removePoDocument,
    required TResult Function() removeAllPoDocument,
    required TResult Function(bool value) toggleGreenDelivery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisationConfigs config)? initialized,
    TResult? Function(AdditionalDetailsLabel label, String newValue)?
        onTextChange,
    TResult? Function(SalesOrganisationConfigs config)? validateForm,
    TResult? Function(List<PoDocuments> poDocuments)? addPoDocument,
    TResult? Function(PoDocuments poDocument)? removePoDocument,
    TResult? Function()? removeAllPoDocument,
    TResult? Function(bool value)? toggleGreenDelivery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisationConfigs config)? initialized,
    TResult Function(AdditionalDetailsLabel label, String newValue)?
        onTextChange,
    TResult Function(SalesOrganisationConfigs config)? validateForm,
    TResult Function(List<PoDocuments> poDocuments)? addPoDocument,
    TResult Function(PoDocuments poDocument)? removePoDocument,
    TResult Function()? removeAllPoDocument,
    TResult Function(bool value)? toggleGreenDelivery,
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
    required TResult Function(_AdditionalDetailsAddPoDocument value)
        addPoDocument,
    required TResult Function(_AdditionalDetailsRemovePoDocument value)
        removePoDocument,
    required TResult Function(_AdditionalDetailsRemoveAllPoDocument value)
        removeAllPoDocument,
    required TResult Function(_AdditionalDetailsToggleGreenDelivery value)
        toggleGreenDelivery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AdditionalDetailsTextOnChange value)? onTextChange,
    TResult? Function(_AdditionalDetailsValidateForm value)? validateForm,
    TResult? Function(_AdditionalDetailsAddPoDocument value)? addPoDocument,
    TResult? Function(_AdditionalDetailsRemovePoDocument value)?
        removePoDocument,
    TResult? Function(_AdditionalDetailsRemoveAllPoDocument value)?
        removeAllPoDocument,
    TResult? Function(_AdditionalDetailsToggleGreenDelivery value)?
        toggleGreenDelivery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AdditionalDetailsTextOnChange value)? onTextChange,
    TResult Function(_AdditionalDetailsValidateForm value)? validateForm,
    TResult Function(_AdditionalDetailsAddPoDocument value)? addPoDocument,
    TResult Function(_AdditionalDetailsRemovePoDocument value)?
        removePoDocument,
    TResult Function(_AdditionalDetailsRemoveAllPoDocument value)?
        removeAllPoDocument,
    TResult Function(_AdditionalDetailsToggleGreenDelivery value)?
        toggleGreenDelivery,
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
    required TResult Function(List<PoDocuments> poDocuments) addPoDocument,
    required TResult Function(PoDocuments poDocument) removePoDocument,
    required TResult Function() removeAllPoDocument,
    required TResult Function(bool value) toggleGreenDelivery,
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
    TResult? Function(List<PoDocuments> poDocuments)? addPoDocument,
    TResult? Function(PoDocuments poDocument)? removePoDocument,
    TResult? Function()? removeAllPoDocument,
    TResult? Function(bool value)? toggleGreenDelivery,
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
    TResult Function(List<PoDocuments> poDocuments)? addPoDocument,
    TResult Function(PoDocuments poDocument)? removePoDocument,
    TResult Function()? removeAllPoDocument,
    TResult Function(bool value)? toggleGreenDelivery,
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
    required TResult Function(_AdditionalDetailsAddPoDocument value)
        addPoDocument,
    required TResult Function(_AdditionalDetailsRemovePoDocument value)
        removePoDocument,
    required TResult Function(_AdditionalDetailsRemoveAllPoDocument value)
        removeAllPoDocument,
    required TResult Function(_AdditionalDetailsToggleGreenDelivery value)
        toggleGreenDelivery,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AdditionalDetailsTextOnChange value)? onTextChange,
    TResult? Function(_AdditionalDetailsValidateForm value)? validateForm,
    TResult? Function(_AdditionalDetailsAddPoDocument value)? addPoDocument,
    TResult? Function(_AdditionalDetailsRemovePoDocument value)?
        removePoDocument,
    TResult? Function(_AdditionalDetailsRemoveAllPoDocument value)?
        removeAllPoDocument,
    TResult? Function(_AdditionalDetailsToggleGreenDelivery value)?
        toggleGreenDelivery,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AdditionalDetailsTextOnChange value)? onTextChange,
    TResult Function(_AdditionalDetailsValidateForm value)? validateForm,
    TResult Function(_AdditionalDetailsAddPoDocument value)? addPoDocument,
    TResult Function(_AdditionalDetailsRemovePoDocument value)?
        removePoDocument,
    TResult Function(_AdditionalDetailsRemoveAllPoDocument value)?
        removeAllPoDocument,
    TResult Function(_AdditionalDetailsToggleGreenDelivery value)?
        toggleGreenDelivery,
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
    required TResult Function(List<PoDocuments> poDocuments) addPoDocument,
    required TResult Function(PoDocuments poDocument) removePoDocument,
    required TResult Function() removeAllPoDocument,
    required TResult Function(bool value) toggleGreenDelivery,
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
    TResult? Function(List<PoDocuments> poDocuments)? addPoDocument,
    TResult? Function(PoDocuments poDocument)? removePoDocument,
    TResult? Function()? removeAllPoDocument,
    TResult? Function(bool value)? toggleGreenDelivery,
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
    TResult Function(List<PoDocuments> poDocuments)? addPoDocument,
    TResult Function(PoDocuments poDocument)? removePoDocument,
    TResult Function()? removeAllPoDocument,
    TResult Function(bool value)? toggleGreenDelivery,
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
    required TResult Function(_AdditionalDetailsAddPoDocument value)
        addPoDocument,
    required TResult Function(_AdditionalDetailsRemovePoDocument value)
        removePoDocument,
    required TResult Function(_AdditionalDetailsRemoveAllPoDocument value)
        removeAllPoDocument,
    required TResult Function(_AdditionalDetailsToggleGreenDelivery value)
        toggleGreenDelivery,
  }) {
    return onTextChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AdditionalDetailsTextOnChange value)? onTextChange,
    TResult? Function(_AdditionalDetailsValidateForm value)? validateForm,
    TResult? Function(_AdditionalDetailsAddPoDocument value)? addPoDocument,
    TResult? Function(_AdditionalDetailsRemovePoDocument value)?
        removePoDocument,
    TResult? Function(_AdditionalDetailsRemoveAllPoDocument value)?
        removeAllPoDocument,
    TResult? Function(_AdditionalDetailsToggleGreenDelivery value)?
        toggleGreenDelivery,
  }) {
    return onTextChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AdditionalDetailsTextOnChange value)? onTextChange,
    TResult Function(_AdditionalDetailsValidateForm value)? validateForm,
    TResult Function(_AdditionalDetailsAddPoDocument value)? addPoDocument,
    TResult Function(_AdditionalDetailsRemovePoDocument value)?
        removePoDocument,
    TResult Function(_AdditionalDetailsRemoveAllPoDocument value)?
        removeAllPoDocument,
    TResult Function(_AdditionalDetailsToggleGreenDelivery value)?
        toggleGreenDelivery,
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
    required TResult Function(List<PoDocuments> poDocuments) addPoDocument,
    required TResult Function(PoDocuments poDocument) removePoDocument,
    required TResult Function() removeAllPoDocument,
    required TResult Function(bool value) toggleGreenDelivery,
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
    TResult? Function(List<PoDocuments> poDocuments)? addPoDocument,
    TResult? Function(PoDocuments poDocument)? removePoDocument,
    TResult? Function()? removeAllPoDocument,
    TResult? Function(bool value)? toggleGreenDelivery,
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
    TResult Function(List<PoDocuments> poDocuments)? addPoDocument,
    TResult Function(PoDocuments poDocument)? removePoDocument,
    TResult Function()? removeAllPoDocument,
    TResult Function(bool value)? toggleGreenDelivery,
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
    required TResult Function(_AdditionalDetailsAddPoDocument value)
        addPoDocument,
    required TResult Function(_AdditionalDetailsRemovePoDocument value)
        removePoDocument,
    required TResult Function(_AdditionalDetailsRemoveAllPoDocument value)
        removeAllPoDocument,
    required TResult Function(_AdditionalDetailsToggleGreenDelivery value)
        toggleGreenDelivery,
  }) {
    return validateForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AdditionalDetailsTextOnChange value)? onTextChange,
    TResult? Function(_AdditionalDetailsValidateForm value)? validateForm,
    TResult? Function(_AdditionalDetailsAddPoDocument value)? addPoDocument,
    TResult? Function(_AdditionalDetailsRemovePoDocument value)?
        removePoDocument,
    TResult? Function(_AdditionalDetailsRemoveAllPoDocument value)?
        removeAllPoDocument,
    TResult? Function(_AdditionalDetailsToggleGreenDelivery value)?
        toggleGreenDelivery,
  }) {
    return validateForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AdditionalDetailsTextOnChange value)? onTextChange,
    TResult Function(_AdditionalDetailsValidateForm value)? validateForm,
    TResult Function(_AdditionalDetailsAddPoDocument value)? addPoDocument,
    TResult Function(_AdditionalDetailsRemovePoDocument value)?
        removePoDocument,
    TResult Function(_AdditionalDetailsRemoveAllPoDocument value)?
        removeAllPoDocument,
    TResult Function(_AdditionalDetailsToggleGreenDelivery value)?
        toggleGreenDelivery,
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
abstract class _$$_AdditionalDetailsAddPoDocumentCopyWith<$Res> {
  factory _$$_AdditionalDetailsAddPoDocumentCopyWith(
          _$_AdditionalDetailsAddPoDocument value,
          $Res Function(_$_AdditionalDetailsAddPoDocument) then) =
      __$$_AdditionalDetailsAddPoDocumentCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PoDocuments> poDocuments});
}

/// @nodoc
class __$$_AdditionalDetailsAddPoDocumentCopyWithImpl<$Res>
    extends _$AdditionalDetailsEventCopyWithImpl<$Res,
        _$_AdditionalDetailsAddPoDocument>
    implements _$$_AdditionalDetailsAddPoDocumentCopyWith<$Res> {
  __$$_AdditionalDetailsAddPoDocumentCopyWithImpl(
      _$_AdditionalDetailsAddPoDocument _value,
      $Res Function(_$_AdditionalDetailsAddPoDocument) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poDocuments = null,
  }) {
    return _then(_$_AdditionalDetailsAddPoDocument(
      poDocuments: null == poDocuments
          ? _value._poDocuments
          : poDocuments // ignore: cast_nullable_to_non_nullable
              as List<PoDocuments>,
    ));
  }
}

/// @nodoc

class _$_AdditionalDetailsAddPoDocument
    implements _AdditionalDetailsAddPoDocument {
  const _$_AdditionalDetailsAddPoDocument(
      {required final List<PoDocuments> poDocuments})
      : _poDocuments = poDocuments;

  final List<PoDocuments> _poDocuments;
  @override
  List<PoDocuments> get poDocuments {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_poDocuments);
  }

  @override
  String toString() {
    return 'AdditionalDetailsEvent.addPoDocument(poDocuments: $poDocuments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdditionalDetailsAddPoDocument &&
            const DeepCollectionEquality()
                .equals(other._poDocuments, _poDocuments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_poDocuments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdditionalDetailsAddPoDocumentCopyWith<_$_AdditionalDetailsAddPoDocument>
      get copyWith => __$$_AdditionalDetailsAddPoDocumentCopyWithImpl<
          _$_AdditionalDetailsAddPoDocument>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisationConfigs config) initialized,
    required TResult Function(AdditionalDetailsLabel label, String newValue)
        onTextChange,
    required TResult Function(SalesOrganisationConfigs config) validateForm,
    required TResult Function(List<PoDocuments> poDocuments) addPoDocument,
    required TResult Function(PoDocuments poDocument) removePoDocument,
    required TResult Function() removeAllPoDocument,
    required TResult Function(bool value) toggleGreenDelivery,
  }) {
    return addPoDocument(poDocuments);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisationConfigs config)? initialized,
    TResult? Function(AdditionalDetailsLabel label, String newValue)?
        onTextChange,
    TResult? Function(SalesOrganisationConfigs config)? validateForm,
    TResult? Function(List<PoDocuments> poDocuments)? addPoDocument,
    TResult? Function(PoDocuments poDocument)? removePoDocument,
    TResult? Function()? removeAllPoDocument,
    TResult? Function(bool value)? toggleGreenDelivery,
  }) {
    return addPoDocument?.call(poDocuments);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisationConfigs config)? initialized,
    TResult Function(AdditionalDetailsLabel label, String newValue)?
        onTextChange,
    TResult Function(SalesOrganisationConfigs config)? validateForm,
    TResult Function(List<PoDocuments> poDocuments)? addPoDocument,
    TResult Function(PoDocuments poDocument)? removePoDocument,
    TResult Function()? removeAllPoDocument,
    TResult Function(bool value)? toggleGreenDelivery,
    required TResult orElse(),
  }) {
    if (addPoDocument != null) {
      return addPoDocument(poDocuments);
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
    required TResult Function(_AdditionalDetailsAddPoDocument value)
        addPoDocument,
    required TResult Function(_AdditionalDetailsRemovePoDocument value)
        removePoDocument,
    required TResult Function(_AdditionalDetailsRemoveAllPoDocument value)
        removeAllPoDocument,
    required TResult Function(_AdditionalDetailsToggleGreenDelivery value)
        toggleGreenDelivery,
  }) {
    return addPoDocument(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AdditionalDetailsTextOnChange value)? onTextChange,
    TResult? Function(_AdditionalDetailsValidateForm value)? validateForm,
    TResult? Function(_AdditionalDetailsAddPoDocument value)? addPoDocument,
    TResult? Function(_AdditionalDetailsRemovePoDocument value)?
        removePoDocument,
    TResult? Function(_AdditionalDetailsRemoveAllPoDocument value)?
        removeAllPoDocument,
    TResult? Function(_AdditionalDetailsToggleGreenDelivery value)?
        toggleGreenDelivery,
  }) {
    return addPoDocument?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AdditionalDetailsTextOnChange value)? onTextChange,
    TResult Function(_AdditionalDetailsValidateForm value)? validateForm,
    TResult Function(_AdditionalDetailsAddPoDocument value)? addPoDocument,
    TResult Function(_AdditionalDetailsRemovePoDocument value)?
        removePoDocument,
    TResult Function(_AdditionalDetailsRemoveAllPoDocument value)?
        removeAllPoDocument,
    TResult Function(_AdditionalDetailsToggleGreenDelivery value)?
        toggleGreenDelivery,
    required TResult orElse(),
  }) {
    if (addPoDocument != null) {
      return addPoDocument(this);
    }
    return orElse();
  }
}

abstract class _AdditionalDetailsAddPoDocument
    implements AdditionalDetailsEvent {
  const factory _AdditionalDetailsAddPoDocument(
          {required final List<PoDocuments> poDocuments}) =
      _$_AdditionalDetailsAddPoDocument;

  List<PoDocuments> get poDocuments;
  @JsonKey(ignore: true)
  _$$_AdditionalDetailsAddPoDocumentCopyWith<_$_AdditionalDetailsAddPoDocument>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AdditionalDetailsRemovePoDocumentCopyWith<$Res> {
  factory _$$_AdditionalDetailsRemovePoDocumentCopyWith(
          _$_AdditionalDetailsRemovePoDocument value,
          $Res Function(_$_AdditionalDetailsRemovePoDocument) then) =
      __$$_AdditionalDetailsRemovePoDocumentCopyWithImpl<$Res>;
  @useResult
  $Res call({PoDocuments poDocument});

  $PoDocumentsCopyWith<$Res> get poDocument;
}

/// @nodoc
class __$$_AdditionalDetailsRemovePoDocumentCopyWithImpl<$Res>
    extends _$AdditionalDetailsEventCopyWithImpl<$Res,
        _$_AdditionalDetailsRemovePoDocument>
    implements _$$_AdditionalDetailsRemovePoDocumentCopyWith<$Res> {
  __$$_AdditionalDetailsRemovePoDocumentCopyWithImpl(
      _$_AdditionalDetailsRemovePoDocument _value,
      $Res Function(_$_AdditionalDetailsRemovePoDocument) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poDocument = null,
  }) {
    return _then(_$_AdditionalDetailsRemovePoDocument(
      poDocument: null == poDocument
          ? _value.poDocument
          : poDocument // ignore: cast_nullable_to_non_nullable
              as PoDocuments,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PoDocumentsCopyWith<$Res> get poDocument {
    return $PoDocumentsCopyWith<$Res>(_value.poDocument, (value) {
      return _then(_value.copyWith(poDocument: value));
    });
  }
}

/// @nodoc

class _$_AdditionalDetailsRemovePoDocument
    implements _AdditionalDetailsRemovePoDocument {
  const _$_AdditionalDetailsRemovePoDocument({required this.poDocument});

  @override
  final PoDocuments poDocument;

  @override
  String toString() {
    return 'AdditionalDetailsEvent.removePoDocument(poDocument: $poDocument)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdditionalDetailsRemovePoDocument &&
            (identical(other.poDocument, poDocument) ||
                other.poDocument == poDocument));
  }

  @override
  int get hashCode => Object.hash(runtimeType, poDocument);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdditionalDetailsRemovePoDocumentCopyWith<
          _$_AdditionalDetailsRemovePoDocument>
      get copyWith => __$$_AdditionalDetailsRemovePoDocumentCopyWithImpl<
          _$_AdditionalDetailsRemovePoDocument>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisationConfigs config) initialized,
    required TResult Function(AdditionalDetailsLabel label, String newValue)
        onTextChange,
    required TResult Function(SalesOrganisationConfigs config) validateForm,
    required TResult Function(List<PoDocuments> poDocuments) addPoDocument,
    required TResult Function(PoDocuments poDocument) removePoDocument,
    required TResult Function() removeAllPoDocument,
    required TResult Function(bool value) toggleGreenDelivery,
  }) {
    return removePoDocument(poDocument);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisationConfigs config)? initialized,
    TResult? Function(AdditionalDetailsLabel label, String newValue)?
        onTextChange,
    TResult? Function(SalesOrganisationConfigs config)? validateForm,
    TResult? Function(List<PoDocuments> poDocuments)? addPoDocument,
    TResult? Function(PoDocuments poDocument)? removePoDocument,
    TResult? Function()? removeAllPoDocument,
    TResult? Function(bool value)? toggleGreenDelivery,
  }) {
    return removePoDocument?.call(poDocument);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisationConfigs config)? initialized,
    TResult Function(AdditionalDetailsLabel label, String newValue)?
        onTextChange,
    TResult Function(SalesOrganisationConfigs config)? validateForm,
    TResult Function(List<PoDocuments> poDocuments)? addPoDocument,
    TResult Function(PoDocuments poDocument)? removePoDocument,
    TResult Function()? removeAllPoDocument,
    TResult Function(bool value)? toggleGreenDelivery,
    required TResult orElse(),
  }) {
    if (removePoDocument != null) {
      return removePoDocument(poDocument);
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
    required TResult Function(_AdditionalDetailsAddPoDocument value)
        addPoDocument,
    required TResult Function(_AdditionalDetailsRemovePoDocument value)
        removePoDocument,
    required TResult Function(_AdditionalDetailsRemoveAllPoDocument value)
        removeAllPoDocument,
    required TResult Function(_AdditionalDetailsToggleGreenDelivery value)
        toggleGreenDelivery,
  }) {
    return removePoDocument(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AdditionalDetailsTextOnChange value)? onTextChange,
    TResult? Function(_AdditionalDetailsValidateForm value)? validateForm,
    TResult? Function(_AdditionalDetailsAddPoDocument value)? addPoDocument,
    TResult? Function(_AdditionalDetailsRemovePoDocument value)?
        removePoDocument,
    TResult? Function(_AdditionalDetailsRemoveAllPoDocument value)?
        removeAllPoDocument,
    TResult? Function(_AdditionalDetailsToggleGreenDelivery value)?
        toggleGreenDelivery,
  }) {
    return removePoDocument?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AdditionalDetailsTextOnChange value)? onTextChange,
    TResult Function(_AdditionalDetailsValidateForm value)? validateForm,
    TResult Function(_AdditionalDetailsAddPoDocument value)? addPoDocument,
    TResult Function(_AdditionalDetailsRemovePoDocument value)?
        removePoDocument,
    TResult Function(_AdditionalDetailsRemoveAllPoDocument value)?
        removeAllPoDocument,
    TResult Function(_AdditionalDetailsToggleGreenDelivery value)?
        toggleGreenDelivery,
    required TResult orElse(),
  }) {
    if (removePoDocument != null) {
      return removePoDocument(this);
    }
    return orElse();
  }
}

abstract class _AdditionalDetailsRemovePoDocument
    implements AdditionalDetailsEvent {
  const factory _AdditionalDetailsRemovePoDocument(
          {required final PoDocuments poDocument}) =
      _$_AdditionalDetailsRemovePoDocument;

  PoDocuments get poDocument;
  @JsonKey(ignore: true)
  _$$_AdditionalDetailsRemovePoDocumentCopyWith<
          _$_AdditionalDetailsRemovePoDocument>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AdditionalDetailsRemoveAllPoDocumentCopyWith<$Res> {
  factory _$$_AdditionalDetailsRemoveAllPoDocumentCopyWith(
          _$_AdditionalDetailsRemoveAllPoDocument value,
          $Res Function(_$_AdditionalDetailsRemoveAllPoDocument) then) =
      __$$_AdditionalDetailsRemoveAllPoDocumentCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AdditionalDetailsRemoveAllPoDocumentCopyWithImpl<$Res>
    extends _$AdditionalDetailsEventCopyWithImpl<$Res,
        _$_AdditionalDetailsRemoveAllPoDocument>
    implements _$$_AdditionalDetailsRemoveAllPoDocumentCopyWith<$Res> {
  __$$_AdditionalDetailsRemoveAllPoDocumentCopyWithImpl(
      _$_AdditionalDetailsRemoveAllPoDocument _value,
      $Res Function(_$_AdditionalDetailsRemoveAllPoDocument) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AdditionalDetailsRemoveAllPoDocument
    implements _AdditionalDetailsRemoveAllPoDocument {
  const _$_AdditionalDetailsRemoveAllPoDocument();

  @override
  String toString() {
    return 'AdditionalDetailsEvent.removeAllPoDocument()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdditionalDetailsRemoveAllPoDocument);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisationConfigs config) initialized,
    required TResult Function(AdditionalDetailsLabel label, String newValue)
        onTextChange,
    required TResult Function(SalesOrganisationConfigs config) validateForm,
    required TResult Function(List<PoDocuments> poDocuments) addPoDocument,
    required TResult Function(PoDocuments poDocument) removePoDocument,
    required TResult Function() removeAllPoDocument,
    required TResult Function(bool value) toggleGreenDelivery,
  }) {
    return removeAllPoDocument();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisationConfigs config)? initialized,
    TResult? Function(AdditionalDetailsLabel label, String newValue)?
        onTextChange,
    TResult? Function(SalesOrganisationConfigs config)? validateForm,
    TResult? Function(List<PoDocuments> poDocuments)? addPoDocument,
    TResult? Function(PoDocuments poDocument)? removePoDocument,
    TResult? Function()? removeAllPoDocument,
    TResult? Function(bool value)? toggleGreenDelivery,
  }) {
    return removeAllPoDocument?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisationConfigs config)? initialized,
    TResult Function(AdditionalDetailsLabel label, String newValue)?
        onTextChange,
    TResult Function(SalesOrganisationConfigs config)? validateForm,
    TResult Function(List<PoDocuments> poDocuments)? addPoDocument,
    TResult Function(PoDocuments poDocument)? removePoDocument,
    TResult Function()? removeAllPoDocument,
    TResult Function(bool value)? toggleGreenDelivery,
    required TResult orElse(),
  }) {
    if (removeAllPoDocument != null) {
      return removeAllPoDocument();
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
    required TResult Function(_AdditionalDetailsAddPoDocument value)
        addPoDocument,
    required TResult Function(_AdditionalDetailsRemovePoDocument value)
        removePoDocument,
    required TResult Function(_AdditionalDetailsRemoveAllPoDocument value)
        removeAllPoDocument,
    required TResult Function(_AdditionalDetailsToggleGreenDelivery value)
        toggleGreenDelivery,
  }) {
    return removeAllPoDocument(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AdditionalDetailsTextOnChange value)? onTextChange,
    TResult? Function(_AdditionalDetailsValidateForm value)? validateForm,
    TResult? Function(_AdditionalDetailsAddPoDocument value)? addPoDocument,
    TResult? Function(_AdditionalDetailsRemovePoDocument value)?
        removePoDocument,
    TResult? Function(_AdditionalDetailsRemoveAllPoDocument value)?
        removeAllPoDocument,
    TResult? Function(_AdditionalDetailsToggleGreenDelivery value)?
        toggleGreenDelivery,
  }) {
    return removeAllPoDocument?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AdditionalDetailsTextOnChange value)? onTextChange,
    TResult Function(_AdditionalDetailsValidateForm value)? validateForm,
    TResult Function(_AdditionalDetailsAddPoDocument value)? addPoDocument,
    TResult Function(_AdditionalDetailsRemovePoDocument value)?
        removePoDocument,
    TResult Function(_AdditionalDetailsRemoveAllPoDocument value)?
        removeAllPoDocument,
    TResult Function(_AdditionalDetailsToggleGreenDelivery value)?
        toggleGreenDelivery,
    required TResult orElse(),
  }) {
    if (removeAllPoDocument != null) {
      return removeAllPoDocument(this);
    }
    return orElse();
  }
}

abstract class _AdditionalDetailsRemoveAllPoDocument
    implements AdditionalDetailsEvent {
  const factory _AdditionalDetailsRemoveAllPoDocument() =
      _$_AdditionalDetailsRemoveAllPoDocument;
}

/// @nodoc
abstract class _$$_AdditionalDetailsToggleGreenDeliveryCopyWith<$Res> {
  factory _$$_AdditionalDetailsToggleGreenDeliveryCopyWith(
          _$_AdditionalDetailsToggleGreenDelivery value,
          $Res Function(_$_AdditionalDetailsToggleGreenDelivery) then) =
      __$$_AdditionalDetailsToggleGreenDeliveryCopyWithImpl<$Res>;
  @useResult
  $Res call({bool value});
}

/// @nodoc
class __$$_AdditionalDetailsToggleGreenDeliveryCopyWithImpl<$Res>
    extends _$AdditionalDetailsEventCopyWithImpl<$Res,
        _$_AdditionalDetailsToggleGreenDelivery>
    implements _$$_AdditionalDetailsToggleGreenDeliveryCopyWith<$Res> {
  __$$_AdditionalDetailsToggleGreenDeliveryCopyWithImpl(
      _$_AdditionalDetailsToggleGreenDelivery _value,
      $Res Function(_$_AdditionalDetailsToggleGreenDelivery) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_AdditionalDetailsToggleGreenDelivery(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AdditionalDetailsToggleGreenDelivery
    implements _AdditionalDetailsToggleGreenDelivery {
  const _$_AdditionalDetailsToggleGreenDelivery(this.value);

  @override
  final bool value;

  @override
  String toString() {
    return 'AdditionalDetailsEvent.toggleGreenDelivery(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdditionalDetailsToggleGreenDelivery &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdditionalDetailsToggleGreenDeliveryCopyWith<
          _$_AdditionalDetailsToggleGreenDelivery>
      get copyWith => __$$_AdditionalDetailsToggleGreenDeliveryCopyWithImpl<
          _$_AdditionalDetailsToggleGreenDelivery>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisationConfigs config) initialized,
    required TResult Function(AdditionalDetailsLabel label, String newValue)
        onTextChange,
    required TResult Function(SalesOrganisationConfigs config) validateForm,
    required TResult Function(List<PoDocuments> poDocuments) addPoDocument,
    required TResult Function(PoDocuments poDocument) removePoDocument,
    required TResult Function() removeAllPoDocument,
    required TResult Function(bool value) toggleGreenDelivery,
  }) {
    return toggleGreenDelivery(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisationConfigs config)? initialized,
    TResult? Function(AdditionalDetailsLabel label, String newValue)?
        onTextChange,
    TResult? Function(SalesOrganisationConfigs config)? validateForm,
    TResult? Function(List<PoDocuments> poDocuments)? addPoDocument,
    TResult? Function(PoDocuments poDocument)? removePoDocument,
    TResult? Function()? removeAllPoDocument,
    TResult? Function(bool value)? toggleGreenDelivery,
  }) {
    return toggleGreenDelivery?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisationConfigs config)? initialized,
    TResult Function(AdditionalDetailsLabel label, String newValue)?
        onTextChange,
    TResult Function(SalesOrganisationConfigs config)? validateForm,
    TResult Function(List<PoDocuments> poDocuments)? addPoDocument,
    TResult Function(PoDocuments poDocument)? removePoDocument,
    TResult Function()? removeAllPoDocument,
    TResult Function(bool value)? toggleGreenDelivery,
    required TResult orElse(),
  }) {
    if (toggleGreenDelivery != null) {
      return toggleGreenDelivery(value);
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
    required TResult Function(_AdditionalDetailsAddPoDocument value)
        addPoDocument,
    required TResult Function(_AdditionalDetailsRemovePoDocument value)
        removePoDocument,
    required TResult Function(_AdditionalDetailsRemoveAllPoDocument value)
        removeAllPoDocument,
    required TResult Function(_AdditionalDetailsToggleGreenDelivery value)
        toggleGreenDelivery,
  }) {
    return toggleGreenDelivery(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AdditionalDetailsTextOnChange value)? onTextChange,
    TResult? Function(_AdditionalDetailsValidateForm value)? validateForm,
    TResult? Function(_AdditionalDetailsAddPoDocument value)? addPoDocument,
    TResult? Function(_AdditionalDetailsRemovePoDocument value)?
        removePoDocument,
    TResult? Function(_AdditionalDetailsRemoveAllPoDocument value)?
        removeAllPoDocument,
    TResult? Function(_AdditionalDetailsToggleGreenDelivery value)?
        toggleGreenDelivery,
  }) {
    return toggleGreenDelivery?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AdditionalDetailsTextOnChange value)? onTextChange,
    TResult Function(_AdditionalDetailsValidateForm value)? validateForm,
    TResult Function(_AdditionalDetailsAddPoDocument value)? addPoDocument,
    TResult Function(_AdditionalDetailsRemovePoDocument value)?
        removePoDocument,
    TResult Function(_AdditionalDetailsRemoveAllPoDocument value)?
        removeAllPoDocument,
    TResult Function(_AdditionalDetailsToggleGreenDelivery value)?
        toggleGreenDelivery,
    required TResult orElse(),
  }) {
    if (toggleGreenDelivery != null) {
      return toggleGreenDelivery(this);
    }
    return orElse();
  }
}

abstract class _AdditionalDetailsToggleGreenDelivery
    implements AdditionalDetailsEvent {
  const factory _AdditionalDetailsToggleGreenDelivery(final bool value) =
      _$_AdditionalDetailsToggleGreenDelivery;

  bool get value;
  @JsonKey(ignore: true)
  _$$_AdditionalDetailsToggleGreenDeliveryCopyWith<
          _$_AdditionalDetailsToggleGreenDelivery>
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
