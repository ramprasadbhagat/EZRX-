// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_request_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewRequestEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrg salesOrg, ReturnMaterial item, bool selected)
        toggleReturnItem,
    required TResult Function(String assignmentNumber,
            MaterialNumber materialNumber, String itemNumber, bool included)
        toggleBonusItem,
    required TResult Function(ReturnItemDetails additionInfo)
        additionInfoChanged,
    required TResult Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)
        toggleFiles,
    required TResult Function(int step) validateStep,
    required TResult Function(String returnReference) returnReferenceChanged,
    required TResult Function(String specialInstructions)
        specialInstructionsChanged,
    required TResult Function(CustomerCodeInfo customerCodeInfo, User user)
        submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrg salesOrg, ReturnMaterial item, bool selected)?
        toggleReturnItem,
    TResult? Function(String assignmentNumber, MaterialNumber materialNumber,
            String itemNumber, bool included)?
        toggleBonusItem,
    TResult? Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult? Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)?
        toggleFiles,
    TResult? Function(int step)? validateStep,
    TResult? Function(String returnReference)? returnReferenceChanged,
    TResult? Function(String specialInstructions)? specialInstructionsChanged,
    TResult? Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrg salesOrg, ReturnMaterial item, bool selected)?
        toggleReturnItem,
    TResult Function(String assignmentNumber, MaterialNumber materialNumber,
            String itemNumber, bool included)?
        toggleBonusItem,
    TResult Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)?
        toggleFiles,
    TResult Function(int step)? validateStep,
    TResult Function(String returnReference)? returnReferenceChanged,
    TResult Function(String specialInstructions)? specialInstructionsChanged,
    TResult Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_ToggleReturnItem value) toggleReturnItem,
    required TResult Function(_ToggleBonusItem value) toggleBonusItem,
    required TResult Function(_AdditionInfoChanged value) additionInfoChanged,
    required TResult Function(_ToggleFiles value) toggleFiles,
    required TResult Function(_ValidateStep value) validateStep,
    required TResult Function(_ReturnReferenceChanged value)
        returnReferenceChanged,
    required TResult Function(_SpecialInstructionsChanged value)
        specialInstructionsChanged,
    required TResult Function(_Submit value) submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult? Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult? Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult? Function(_ToggleFiles value)? toggleFiles,
    TResult? Function(_ValidateStep value)? validateStep,
    TResult? Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult? Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult? Function(_Submit value)? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult Function(_ToggleFiles value)? toggleFiles,
    TResult Function(_ValidateStep value)? validateStep,
    TResult Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewRequestEventCopyWith<$Res> {
  factory $NewRequestEventCopyWith(
          NewRequestEvent value, $Res Function(NewRequestEvent) then) =
      _$NewRequestEventCopyWithImpl<$Res, NewRequestEvent>;
}

/// @nodoc
class _$NewRequestEventCopyWithImpl<$Res, $Val extends NewRequestEvent>
    implements $NewRequestEventCopyWith<$Res> {
  _$NewRequestEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_initializedCopyWith<$Res> {
  factory _$$_initializedCopyWith(
          _$_initialized value, $Res Function(_$_initialized) then) =
      __$$_initializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_initializedCopyWithImpl<$Res>
    extends _$NewRequestEventCopyWithImpl<$Res, _$_initialized>
    implements _$$_initializedCopyWith<$Res> {
  __$$_initializedCopyWithImpl(
      _$_initialized _value, $Res Function(_$_initialized) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_initialized implements _initialized {
  const _$_initialized();

  @override
  String toString() {
    return 'NewRequestEvent.initialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_initialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrg salesOrg, ReturnMaterial item, bool selected)
        toggleReturnItem,
    required TResult Function(String assignmentNumber,
            MaterialNumber materialNumber, String itemNumber, bool included)
        toggleBonusItem,
    required TResult Function(ReturnItemDetails additionInfo)
        additionInfoChanged,
    required TResult Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)
        toggleFiles,
    required TResult Function(int step) validateStep,
    required TResult Function(String returnReference) returnReferenceChanged,
    required TResult Function(String specialInstructions)
        specialInstructionsChanged,
    required TResult Function(CustomerCodeInfo customerCodeInfo, User user)
        submit,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrg salesOrg, ReturnMaterial item, bool selected)?
        toggleReturnItem,
    TResult? Function(String assignmentNumber, MaterialNumber materialNumber,
            String itemNumber, bool included)?
        toggleBonusItem,
    TResult? Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult? Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)?
        toggleFiles,
    TResult? Function(int step)? validateStep,
    TResult? Function(String returnReference)? returnReferenceChanged,
    TResult? Function(String specialInstructions)? specialInstructionsChanged,
    TResult? Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrg salesOrg, ReturnMaterial item, bool selected)?
        toggleReturnItem,
    TResult Function(String assignmentNumber, MaterialNumber materialNumber,
            String itemNumber, bool included)?
        toggleBonusItem,
    TResult Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)?
        toggleFiles,
    TResult Function(int step)? validateStep,
    TResult Function(String returnReference)? returnReferenceChanged,
    TResult Function(String specialInstructions)? specialInstructionsChanged,
    TResult Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_ToggleReturnItem value) toggleReturnItem,
    required TResult Function(_ToggleBonusItem value) toggleBonusItem,
    required TResult Function(_AdditionInfoChanged value) additionInfoChanged,
    required TResult Function(_ToggleFiles value) toggleFiles,
    required TResult Function(_ValidateStep value) validateStep,
    required TResult Function(_ReturnReferenceChanged value)
        returnReferenceChanged,
    required TResult Function(_SpecialInstructionsChanged value)
        specialInstructionsChanged,
    required TResult Function(_Submit value) submit,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult? Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult? Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult? Function(_ToggleFiles value)? toggleFiles,
    TResult? Function(_ValidateStep value)? validateStep,
    TResult? Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult? Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult? Function(_Submit value)? submit,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult Function(_ToggleFiles value)? toggleFiles,
    TResult Function(_ValidateStep value)? validateStep,
    TResult Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _initialized implements NewRequestEvent {
  const factory _initialized() = _$_initialized;
}

/// @nodoc
abstract class _$$_ToggleReturnItemCopyWith<$Res> {
  factory _$$_ToggleReturnItemCopyWith(
          _$_ToggleReturnItem value, $Res Function(_$_ToggleReturnItem) then) =
      __$$_ToggleReturnItemCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrg salesOrg, ReturnMaterial item, bool selected});

  $ReturnMaterialCopyWith<$Res> get item;
}

/// @nodoc
class __$$_ToggleReturnItemCopyWithImpl<$Res>
    extends _$NewRequestEventCopyWithImpl<$Res, _$_ToggleReturnItem>
    implements _$$_ToggleReturnItemCopyWith<$Res> {
  __$$_ToggleReturnItemCopyWithImpl(
      _$_ToggleReturnItem _value, $Res Function(_$_ToggleReturnItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? item = null,
    Object? selected = null,
  }) {
    return _then(_$_ToggleReturnItem(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ReturnMaterial,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnMaterialCopyWith<$Res> get item {
    return $ReturnMaterialCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$_ToggleReturnItem implements _ToggleReturnItem {
  const _$_ToggleReturnItem(
      {required this.salesOrg, required this.item, required this.selected});

  @override
  final SalesOrg salesOrg;
  @override
  final ReturnMaterial item;
  @override
  final bool selected;

  @override
  String toString() {
    return 'NewRequestEvent.toggleReturnItem(salesOrg: $salesOrg, item: $item, selected: $selected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ToggleReturnItem &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg, item, selected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ToggleReturnItemCopyWith<_$_ToggleReturnItem> get copyWith =>
      __$$_ToggleReturnItemCopyWithImpl<_$_ToggleReturnItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrg salesOrg, ReturnMaterial item, bool selected)
        toggleReturnItem,
    required TResult Function(String assignmentNumber,
            MaterialNumber materialNumber, String itemNumber, bool included)
        toggleBonusItem,
    required TResult Function(ReturnItemDetails additionInfo)
        additionInfoChanged,
    required TResult Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)
        toggleFiles,
    required TResult Function(int step) validateStep,
    required TResult Function(String returnReference) returnReferenceChanged,
    required TResult Function(String specialInstructions)
        specialInstructionsChanged,
    required TResult Function(CustomerCodeInfo customerCodeInfo, User user)
        submit,
  }) {
    return toggleReturnItem(salesOrg, item, selected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrg salesOrg, ReturnMaterial item, bool selected)?
        toggleReturnItem,
    TResult? Function(String assignmentNumber, MaterialNumber materialNumber,
            String itemNumber, bool included)?
        toggleBonusItem,
    TResult? Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult? Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)?
        toggleFiles,
    TResult? Function(int step)? validateStep,
    TResult? Function(String returnReference)? returnReferenceChanged,
    TResult? Function(String specialInstructions)? specialInstructionsChanged,
    TResult? Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
  }) {
    return toggleReturnItem?.call(salesOrg, item, selected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrg salesOrg, ReturnMaterial item, bool selected)?
        toggleReturnItem,
    TResult Function(String assignmentNumber, MaterialNumber materialNumber,
            String itemNumber, bool included)?
        toggleBonusItem,
    TResult Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)?
        toggleFiles,
    TResult Function(int step)? validateStep,
    TResult Function(String returnReference)? returnReferenceChanged,
    TResult Function(String specialInstructions)? specialInstructionsChanged,
    TResult Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    required TResult orElse(),
  }) {
    if (toggleReturnItem != null) {
      return toggleReturnItem(salesOrg, item, selected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_ToggleReturnItem value) toggleReturnItem,
    required TResult Function(_ToggleBonusItem value) toggleBonusItem,
    required TResult Function(_AdditionInfoChanged value) additionInfoChanged,
    required TResult Function(_ToggleFiles value) toggleFiles,
    required TResult Function(_ValidateStep value) validateStep,
    required TResult Function(_ReturnReferenceChanged value)
        returnReferenceChanged,
    required TResult Function(_SpecialInstructionsChanged value)
        specialInstructionsChanged,
    required TResult Function(_Submit value) submit,
  }) {
    return toggleReturnItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult? Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult? Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult? Function(_ToggleFiles value)? toggleFiles,
    TResult? Function(_ValidateStep value)? validateStep,
    TResult? Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult? Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult? Function(_Submit value)? submit,
  }) {
    return toggleReturnItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult Function(_ToggleFiles value)? toggleFiles,
    TResult Function(_ValidateStep value)? validateStep,
    TResult Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (toggleReturnItem != null) {
      return toggleReturnItem(this);
    }
    return orElse();
  }
}

abstract class _ToggleReturnItem implements NewRequestEvent {
  const factory _ToggleReturnItem(
      {required final SalesOrg salesOrg,
      required final ReturnMaterial item,
      required final bool selected}) = _$_ToggleReturnItem;

  SalesOrg get salesOrg;
  ReturnMaterial get item;
  bool get selected;
  @JsonKey(ignore: true)
  _$$_ToggleReturnItemCopyWith<_$_ToggleReturnItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ToggleBonusItemCopyWith<$Res> {
  factory _$$_ToggleBonusItemCopyWith(
          _$_ToggleBonusItem value, $Res Function(_$_ToggleBonusItem) then) =
      __$$_ToggleBonusItemCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String assignmentNumber,
      MaterialNumber materialNumber,
      String itemNumber,
      bool included});
}

/// @nodoc
class __$$_ToggleBonusItemCopyWithImpl<$Res>
    extends _$NewRequestEventCopyWithImpl<$Res, _$_ToggleBonusItem>
    implements _$$_ToggleBonusItemCopyWith<$Res> {
  __$$_ToggleBonusItemCopyWithImpl(
      _$_ToggleBonusItem _value, $Res Function(_$_ToggleBonusItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assignmentNumber = null,
    Object? materialNumber = null,
    Object? itemNumber = null,
    Object? included = null,
  }) {
    return _then(_$_ToggleBonusItem(
      assignmentNumber: null == assignmentNumber
          ? _value.assignmentNumber
          : assignmentNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      itemNumber: null == itemNumber
          ? _value.itemNumber
          : itemNumber // ignore: cast_nullable_to_non_nullable
              as String,
      included: null == included
          ? _value.included
          : included // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ToggleBonusItem implements _ToggleBonusItem {
  const _$_ToggleBonusItem(
      {required this.assignmentNumber,
      required this.materialNumber,
      required this.itemNumber,
      required this.included});

  @override
  final String assignmentNumber;
  @override
  final MaterialNumber materialNumber;
  @override
  final String itemNumber;
  @override
  final bool included;

  @override
  String toString() {
    return 'NewRequestEvent.toggleBonusItem(assignmentNumber: $assignmentNumber, materialNumber: $materialNumber, itemNumber: $itemNumber, included: $included)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ToggleBonusItem &&
            (identical(other.assignmentNumber, assignmentNumber) ||
                other.assignmentNumber == assignmentNumber) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.itemNumber, itemNumber) ||
                other.itemNumber == itemNumber) &&
            (identical(other.included, included) ||
                other.included == included));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, assignmentNumber, materialNumber, itemNumber, included);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ToggleBonusItemCopyWith<_$_ToggleBonusItem> get copyWith =>
      __$$_ToggleBonusItemCopyWithImpl<_$_ToggleBonusItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrg salesOrg, ReturnMaterial item, bool selected)
        toggleReturnItem,
    required TResult Function(String assignmentNumber,
            MaterialNumber materialNumber, String itemNumber, bool included)
        toggleBonusItem,
    required TResult Function(ReturnItemDetails additionInfo)
        additionInfoChanged,
    required TResult Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)
        toggleFiles,
    required TResult Function(int step) validateStep,
    required TResult Function(String returnReference) returnReferenceChanged,
    required TResult Function(String specialInstructions)
        specialInstructionsChanged,
    required TResult Function(CustomerCodeInfo customerCodeInfo, User user)
        submit,
  }) {
    return toggleBonusItem(
        assignmentNumber, materialNumber, itemNumber, included);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrg salesOrg, ReturnMaterial item, bool selected)?
        toggleReturnItem,
    TResult? Function(String assignmentNumber, MaterialNumber materialNumber,
            String itemNumber, bool included)?
        toggleBonusItem,
    TResult? Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult? Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)?
        toggleFiles,
    TResult? Function(int step)? validateStep,
    TResult? Function(String returnReference)? returnReferenceChanged,
    TResult? Function(String specialInstructions)? specialInstructionsChanged,
    TResult? Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
  }) {
    return toggleBonusItem?.call(
        assignmentNumber, materialNumber, itemNumber, included);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrg salesOrg, ReturnMaterial item, bool selected)?
        toggleReturnItem,
    TResult Function(String assignmentNumber, MaterialNumber materialNumber,
            String itemNumber, bool included)?
        toggleBonusItem,
    TResult Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)?
        toggleFiles,
    TResult Function(int step)? validateStep,
    TResult Function(String returnReference)? returnReferenceChanged,
    TResult Function(String specialInstructions)? specialInstructionsChanged,
    TResult Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    required TResult orElse(),
  }) {
    if (toggleBonusItem != null) {
      return toggleBonusItem(
          assignmentNumber, materialNumber, itemNumber, included);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_ToggleReturnItem value) toggleReturnItem,
    required TResult Function(_ToggleBonusItem value) toggleBonusItem,
    required TResult Function(_AdditionInfoChanged value) additionInfoChanged,
    required TResult Function(_ToggleFiles value) toggleFiles,
    required TResult Function(_ValidateStep value) validateStep,
    required TResult Function(_ReturnReferenceChanged value)
        returnReferenceChanged,
    required TResult Function(_SpecialInstructionsChanged value)
        specialInstructionsChanged,
    required TResult Function(_Submit value) submit,
  }) {
    return toggleBonusItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult? Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult? Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult? Function(_ToggleFiles value)? toggleFiles,
    TResult? Function(_ValidateStep value)? validateStep,
    TResult? Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult? Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult? Function(_Submit value)? submit,
  }) {
    return toggleBonusItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult Function(_ToggleFiles value)? toggleFiles,
    TResult Function(_ValidateStep value)? validateStep,
    TResult Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (toggleBonusItem != null) {
      return toggleBonusItem(this);
    }
    return orElse();
  }
}

abstract class _ToggleBonusItem implements NewRequestEvent {
  const factory _ToggleBonusItem(
      {required final String assignmentNumber,
      required final MaterialNumber materialNumber,
      required final String itemNumber,
      required final bool included}) = _$_ToggleBonusItem;

  String get assignmentNumber;
  MaterialNumber get materialNumber;
  String get itemNumber;
  bool get included;
  @JsonKey(ignore: true)
  _$$_ToggleBonusItemCopyWith<_$_ToggleBonusItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AdditionInfoChangedCopyWith<$Res> {
  factory _$$_AdditionInfoChangedCopyWith(_$_AdditionInfoChanged value,
          $Res Function(_$_AdditionInfoChanged) then) =
      __$$_AdditionInfoChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({ReturnItemDetails additionInfo});

  $ReturnItemDetailsCopyWith<$Res> get additionInfo;
}

/// @nodoc
class __$$_AdditionInfoChangedCopyWithImpl<$Res>
    extends _$NewRequestEventCopyWithImpl<$Res, _$_AdditionInfoChanged>
    implements _$$_AdditionInfoChangedCopyWith<$Res> {
  __$$_AdditionInfoChangedCopyWithImpl(_$_AdditionInfoChanged _value,
      $Res Function(_$_AdditionInfoChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? additionInfo = null,
  }) {
    return _then(_$_AdditionInfoChanged(
      additionInfo: null == additionInfo
          ? _value.additionInfo
          : additionInfo // ignore: cast_nullable_to_non_nullable
              as ReturnItemDetails,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnItemDetailsCopyWith<$Res> get additionInfo {
    return $ReturnItemDetailsCopyWith<$Res>(_value.additionInfo, (value) {
      return _then(_value.copyWith(additionInfo: value));
    });
  }
}

/// @nodoc

class _$_AdditionInfoChanged implements _AdditionInfoChanged {
  const _$_AdditionInfoChanged({required this.additionInfo});

  @override
  final ReturnItemDetails additionInfo;

  @override
  String toString() {
    return 'NewRequestEvent.additionInfoChanged(additionInfo: $additionInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdditionInfoChanged &&
            (identical(other.additionInfo, additionInfo) ||
                other.additionInfo == additionInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, additionInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdditionInfoChangedCopyWith<_$_AdditionInfoChanged> get copyWith =>
      __$$_AdditionInfoChangedCopyWithImpl<_$_AdditionInfoChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrg salesOrg, ReturnMaterial item, bool selected)
        toggleReturnItem,
    required TResult Function(String assignmentNumber,
            MaterialNumber materialNumber, String itemNumber, bool included)
        toggleBonusItem,
    required TResult Function(ReturnItemDetails additionInfo)
        additionInfoChanged,
    required TResult Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)
        toggleFiles,
    required TResult Function(int step) validateStep,
    required TResult Function(String returnReference) returnReferenceChanged,
    required TResult Function(String specialInstructions)
        specialInstructionsChanged,
    required TResult Function(CustomerCodeInfo customerCodeInfo, User user)
        submit,
  }) {
    return additionInfoChanged(additionInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrg salesOrg, ReturnMaterial item, bool selected)?
        toggleReturnItem,
    TResult? Function(String assignmentNumber, MaterialNumber materialNumber,
            String itemNumber, bool included)?
        toggleBonusItem,
    TResult? Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult? Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)?
        toggleFiles,
    TResult? Function(int step)? validateStep,
    TResult? Function(String returnReference)? returnReferenceChanged,
    TResult? Function(String specialInstructions)? specialInstructionsChanged,
    TResult? Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
  }) {
    return additionInfoChanged?.call(additionInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrg salesOrg, ReturnMaterial item, bool selected)?
        toggleReturnItem,
    TResult Function(String assignmentNumber, MaterialNumber materialNumber,
            String itemNumber, bool included)?
        toggleBonusItem,
    TResult Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)?
        toggleFiles,
    TResult Function(int step)? validateStep,
    TResult Function(String returnReference)? returnReferenceChanged,
    TResult Function(String specialInstructions)? specialInstructionsChanged,
    TResult Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    required TResult orElse(),
  }) {
    if (additionInfoChanged != null) {
      return additionInfoChanged(additionInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_ToggleReturnItem value) toggleReturnItem,
    required TResult Function(_ToggleBonusItem value) toggleBonusItem,
    required TResult Function(_AdditionInfoChanged value) additionInfoChanged,
    required TResult Function(_ToggleFiles value) toggleFiles,
    required TResult Function(_ValidateStep value) validateStep,
    required TResult Function(_ReturnReferenceChanged value)
        returnReferenceChanged,
    required TResult Function(_SpecialInstructionsChanged value)
        specialInstructionsChanged,
    required TResult Function(_Submit value) submit,
  }) {
    return additionInfoChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult? Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult? Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult? Function(_ToggleFiles value)? toggleFiles,
    TResult? Function(_ValidateStep value)? validateStep,
    TResult? Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult? Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult? Function(_Submit value)? submit,
  }) {
    return additionInfoChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult Function(_ToggleFiles value)? toggleFiles,
    TResult Function(_ValidateStep value)? validateStep,
    TResult Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (additionInfoChanged != null) {
      return additionInfoChanged(this);
    }
    return orElse();
  }
}

abstract class _AdditionInfoChanged implements NewRequestEvent {
  const factory _AdditionInfoChanged(
      {required final ReturnItemDetails additionInfo}) = _$_AdditionInfoChanged;

  ReturnItemDetails get additionInfo;
  @JsonKey(ignore: true)
  _$$_AdditionInfoChangedCopyWith<_$_AdditionInfoChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ToggleFilesCopyWith<$Res> {
  factory _$$_ToggleFilesCopyWith(
          _$_ToggleFiles value, $Res Function(_$_ToggleFiles) then) =
      __$$_ToggleFilesCopyWithImpl<$Res>;
  @useResult
  $Res call({String uuid, List<ReturnRequestAttachment> files, bool included});
}

/// @nodoc
class __$$_ToggleFilesCopyWithImpl<$Res>
    extends _$NewRequestEventCopyWithImpl<$Res, _$_ToggleFiles>
    implements _$$_ToggleFilesCopyWith<$Res> {
  __$$_ToggleFilesCopyWithImpl(
      _$_ToggleFiles _value, $Res Function(_$_ToggleFiles) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? files = null,
    Object? included = null,
  }) {
    return _then(_$_ToggleFiles(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<ReturnRequestAttachment>,
      included: null == included
          ? _value.included
          : included // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ToggleFiles implements _ToggleFiles {
  const _$_ToggleFiles(
      {required this.uuid,
      required final List<ReturnRequestAttachment> files,
      required this.included})
      : _files = files;

  @override
  final String uuid;
  final List<ReturnRequestAttachment> _files;
  @override
  List<ReturnRequestAttachment> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  final bool included;

  @override
  String toString() {
    return 'NewRequestEvent.toggleFiles(uuid: $uuid, files: $files, included: $included)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ToggleFiles &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.included, included) ||
                other.included == included));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, uuid, const DeepCollectionEquality().hash(_files), included);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ToggleFilesCopyWith<_$_ToggleFiles> get copyWith =>
      __$$_ToggleFilesCopyWithImpl<_$_ToggleFiles>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrg salesOrg, ReturnMaterial item, bool selected)
        toggleReturnItem,
    required TResult Function(String assignmentNumber,
            MaterialNumber materialNumber, String itemNumber, bool included)
        toggleBonusItem,
    required TResult Function(ReturnItemDetails additionInfo)
        additionInfoChanged,
    required TResult Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)
        toggleFiles,
    required TResult Function(int step) validateStep,
    required TResult Function(String returnReference) returnReferenceChanged,
    required TResult Function(String specialInstructions)
        specialInstructionsChanged,
    required TResult Function(CustomerCodeInfo customerCodeInfo, User user)
        submit,
  }) {
    return toggleFiles(uuid, files, included);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrg salesOrg, ReturnMaterial item, bool selected)?
        toggleReturnItem,
    TResult? Function(String assignmentNumber, MaterialNumber materialNumber,
            String itemNumber, bool included)?
        toggleBonusItem,
    TResult? Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult? Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)?
        toggleFiles,
    TResult? Function(int step)? validateStep,
    TResult? Function(String returnReference)? returnReferenceChanged,
    TResult? Function(String specialInstructions)? specialInstructionsChanged,
    TResult? Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
  }) {
    return toggleFiles?.call(uuid, files, included);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrg salesOrg, ReturnMaterial item, bool selected)?
        toggleReturnItem,
    TResult Function(String assignmentNumber, MaterialNumber materialNumber,
            String itemNumber, bool included)?
        toggleBonusItem,
    TResult Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)?
        toggleFiles,
    TResult Function(int step)? validateStep,
    TResult Function(String returnReference)? returnReferenceChanged,
    TResult Function(String specialInstructions)? specialInstructionsChanged,
    TResult Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    required TResult orElse(),
  }) {
    if (toggleFiles != null) {
      return toggleFiles(uuid, files, included);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_ToggleReturnItem value) toggleReturnItem,
    required TResult Function(_ToggleBonusItem value) toggleBonusItem,
    required TResult Function(_AdditionInfoChanged value) additionInfoChanged,
    required TResult Function(_ToggleFiles value) toggleFiles,
    required TResult Function(_ValidateStep value) validateStep,
    required TResult Function(_ReturnReferenceChanged value)
        returnReferenceChanged,
    required TResult Function(_SpecialInstructionsChanged value)
        specialInstructionsChanged,
    required TResult Function(_Submit value) submit,
  }) {
    return toggleFiles(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult? Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult? Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult? Function(_ToggleFiles value)? toggleFiles,
    TResult? Function(_ValidateStep value)? validateStep,
    TResult? Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult? Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult? Function(_Submit value)? submit,
  }) {
    return toggleFiles?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult Function(_ToggleFiles value)? toggleFiles,
    TResult Function(_ValidateStep value)? validateStep,
    TResult Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (toggleFiles != null) {
      return toggleFiles(this);
    }
    return orElse();
  }
}

abstract class _ToggleFiles implements NewRequestEvent {
  const factory _ToggleFiles(
      {required final String uuid,
      required final List<ReturnRequestAttachment> files,
      required final bool included}) = _$_ToggleFiles;

  String get uuid;
  List<ReturnRequestAttachment> get files;
  bool get included;
  @JsonKey(ignore: true)
  _$$_ToggleFilesCopyWith<_$_ToggleFiles> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ValidateStepCopyWith<$Res> {
  factory _$$_ValidateStepCopyWith(
          _$_ValidateStep value, $Res Function(_$_ValidateStep) then) =
      __$$_ValidateStepCopyWithImpl<$Res>;
  @useResult
  $Res call({int step});
}

/// @nodoc
class __$$_ValidateStepCopyWithImpl<$Res>
    extends _$NewRequestEventCopyWithImpl<$Res, _$_ValidateStep>
    implements _$$_ValidateStepCopyWith<$Res> {
  __$$_ValidateStepCopyWithImpl(
      _$_ValidateStep _value, $Res Function(_$_ValidateStep) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
  }) {
    return _then(_$_ValidateStep(
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ValidateStep implements _ValidateStep {
  const _$_ValidateStep({required this.step});

  @override
  final int step;

  @override
  String toString() {
    return 'NewRequestEvent.validateStep(step: $step)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ValidateStep &&
            (identical(other.step, step) || other.step == step));
  }

  @override
  int get hashCode => Object.hash(runtimeType, step);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ValidateStepCopyWith<_$_ValidateStep> get copyWith =>
      __$$_ValidateStepCopyWithImpl<_$_ValidateStep>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrg salesOrg, ReturnMaterial item, bool selected)
        toggleReturnItem,
    required TResult Function(String assignmentNumber,
            MaterialNumber materialNumber, String itemNumber, bool included)
        toggleBonusItem,
    required TResult Function(ReturnItemDetails additionInfo)
        additionInfoChanged,
    required TResult Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)
        toggleFiles,
    required TResult Function(int step) validateStep,
    required TResult Function(String returnReference) returnReferenceChanged,
    required TResult Function(String specialInstructions)
        specialInstructionsChanged,
    required TResult Function(CustomerCodeInfo customerCodeInfo, User user)
        submit,
  }) {
    return validateStep(step);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrg salesOrg, ReturnMaterial item, bool selected)?
        toggleReturnItem,
    TResult? Function(String assignmentNumber, MaterialNumber materialNumber,
            String itemNumber, bool included)?
        toggleBonusItem,
    TResult? Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult? Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)?
        toggleFiles,
    TResult? Function(int step)? validateStep,
    TResult? Function(String returnReference)? returnReferenceChanged,
    TResult? Function(String specialInstructions)? specialInstructionsChanged,
    TResult? Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
  }) {
    return validateStep?.call(step);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrg salesOrg, ReturnMaterial item, bool selected)?
        toggleReturnItem,
    TResult Function(String assignmentNumber, MaterialNumber materialNumber,
            String itemNumber, bool included)?
        toggleBonusItem,
    TResult Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)?
        toggleFiles,
    TResult Function(int step)? validateStep,
    TResult Function(String returnReference)? returnReferenceChanged,
    TResult Function(String specialInstructions)? specialInstructionsChanged,
    TResult Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    required TResult orElse(),
  }) {
    if (validateStep != null) {
      return validateStep(step);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_ToggleReturnItem value) toggleReturnItem,
    required TResult Function(_ToggleBonusItem value) toggleBonusItem,
    required TResult Function(_AdditionInfoChanged value) additionInfoChanged,
    required TResult Function(_ToggleFiles value) toggleFiles,
    required TResult Function(_ValidateStep value) validateStep,
    required TResult Function(_ReturnReferenceChanged value)
        returnReferenceChanged,
    required TResult Function(_SpecialInstructionsChanged value)
        specialInstructionsChanged,
    required TResult Function(_Submit value) submit,
  }) {
    return validateStep(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult? Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult? Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult? Function(_ToggleFiles value)? toggleFiles,
    TResult? Function(_ValidateStep value)? validateStep,
    TResult? Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult? Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult? Function(_Submit value)? submit,
  }) {
    return validateStep?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult Function(_ToggleFiles value)? toggleFiles,
    TResult Function(_ValidateStep value)? validateStep,
    TResult Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (validateStep != null) {
      return validateStep(this);
    }
    return orElse();
  }
}

abstract class _ValidateStep implements NewRequestEvent {
  const factory _ValidateStep({required final int step}) = _$_ValidateStep;

  int get step;
  @JsonKey(ignore: true)
  _$$_ValidateStepCopyWith<_$_ValidateStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReturnReferenceChangedCopyWith<$Res> {
  factory _$$_ReturnReferenceChangedCopyWith(_$_ReturnReferenceChanged value,
          $Res Function(_$_ReturnReferenceChanged) then) =
      __$$_ReturnReferenceChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String returnReference});
}

/// @nodoc
class __$$_ReturnReferenceChangedCopyWithImpl<$Res>
    extends _$NewRequestEventCopyWithImpl<$Res, _$_ReturnReferenceChanged>
    implements _$$_ReturnReferenceChangedCopyWith<$Res> {
  __$$_ReturnReferenceChangedCopyWithImpl(_$_ReturnReferenceChanged _value,
      $Res Function(_$_ReturnReferenceChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnReference = null,
  }) {
    return _then(_$_ReturnReferenceChanged(
      null == returnReference
          ? _value.returnReference
          : returnReference // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ReturnReferenceChanged implements _ReturnReferenceChanged {
  const _$_ReturnReferenceChanged(this.returnReference);

  @override
  final String returnReference;

  @override
  String toString() {
    return 'NewRequestEvent.returnReferenceChanged(returnReference: $returnReference)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnReferenceChanged &&
            (identical(other.returnReference, returnReference) ||
                other.returnReference == returnReference));
  }

  @override
  int get hashCode => Object.hash(runtimeType, returnReference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnReferenceChangedCopyWith<_$_ReturnReferenceChanged> get copyWith =>
      __$$_ReturnReferenceChangedCopyWithImpl<_$_ReturnReferenceChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrg salesOrg, ReturnMaterial item, bool selected)
        toggleReturnItem,
    required TResult Function(String assignmentNumber,
            MaterialNumber materialNumber, String itemNumber, bool included)
        toggleBonusItem,
    required TResult Function(ReturnItemDetails additionInfo)
        additionInfoChanged,
    required TResult Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)
        toggleFiles,
    required TResult Function(int step) validateStep,
    required TResult Function(String returnReference) returnReferenceChanged,
    required TResult Function(String specialInstructions)
        specialInstructionsChanged,
    required TResult Function(CustomerCodeInfo customerCodeInfo, User user)
        submit,
  }) {
    return returnReferenceChanged(returnReference);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrg salesOrg, ReturnMaterial item, bool selected)?
        toggleReturnItem,
    TResult? Function(String assignmentNumber, MaterialNumber materialNumber,
            String itemNumber, bool included)?
        toggleBonusItem,
    TResult? Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult? Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)?
        toggleFiles,
    TResult? Function(int step)? validateStep,
    TResult? Function(String returnReference)? returnReferenceChanged,
    TResult? Function(String specialInstructions)? specialInstructionsChanged,
    TResult? Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
  }) {
    return returnReferenceChanged?.call(returnReference);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrg salesOrg, ReturnMaterial item, bool selected)?
        toggleReturnItem,
    TResult Function(String assignmentNumber, MaterialNumber materialNumber,
            String itemNumber, bool included)?
        toggleBonusItem,
    TResult Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)?
        toggleFiles,
    TResult Function(int step)? validateStep,
    TResult Function(String returnReference)? returnReferenceChanged,
    TResult Function(String specialInstructions)? specialInstructionsChanged,
    TResult Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    required TResult orElse(),
  }) {
    if (returnReferenceChanged != null) {
      return returnReferenceChanged(returnReference);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_ToggleReturnItem value) toggleReturnItem,
    required TResult Function(_ToggleBonusItem value) toggleBonusItem,
    required TResult Function(_AdditionInfoChanged value) additionInfoChanged,
    required TResult Function(_ToggleFiles value) toggleFiles,
    required TResult Function(_ValidateStep value) validateStep,
    required TResult Function(_ReturnReferenceChanged value)
        returnReferenceChanged,
    required TResult Function(_SpecialInstructionsChanged value)
        specialInstructionsChanged,
    required TResult Function(_Submit value) submit,
  }) {
    return returnReferenceChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult? Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult? Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult? Function(_ToggleFiles value)? toggleFiles,
    TResult? Function(_ValidateStep value)? validateStep,
    TResult? Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult? Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult? Function(_Submit value)? submit,
  }) {
    return returnReferenceChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult Function(_ToggleFiles value)? toggleFiles,
    TResult Function(_ValidateStep value)? validateStep,
    TResult Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (returnReferenceChanged != null) {
      return returnReferenceChanged(this);
    }
    return orElse();
  }
}

abstract class _ReturnReferenceChanged implements NewRequestEvent {
  const factory _ReturnReferenceChanged(final String returnReference) =
      _$_ReturnReferenceChanged;

  String get returnReference;
  @JsonKey(ignore: true)
  _$$_ReturnReferenceChangedCopyWith<_$_ReturnReferenceChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SpecialInstructionsChangedCopyWith<$Res> {
  factory _$$_SpecialInstructionsChangedCopyWith(
          _$_SpecialInstructionsChanged value,
          $Res Function(_$_SpecialInstructionsChanged) then) =
      __$$_SpecialInstructionsChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String specialInstructions});
}

/// @nodoc
class __$$_SpecialInstructionsChangedCopyWithImpl<$Res>
    extends _$NewRequestEventCopyWithImpl<$Res, _$_SpecialInstructionsChanged>
    implements _$$_SpecialInstructionsChangedCopyWith<$Res> {
  __$$_SpecialInstructionsChangedCopyWithImpl(
      _$_SpecialInstructionsChanged _value,
      $Res Function(_$_SpecialInstructionsChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? specialInstructions = null,
  }) {
    return _then(_$_SpecialInstructionsChanged(
      null == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SpecialInstructionsChanged implements _SpecialInstructionsChanged {
  const _$_SpecialInstructionsChanged(this.specialInstructions);

  @override
  final String specialInstructions;

  @override
  String toString() {
    return 'NewRequestEvent.specialInstructionsChanged(specialInstructions: $specialInstructions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SpecialInstructionsChanged &&
            (identical(other.specialInstructions, specialInstructions) ||
                other.specialInstructions == specialInstructions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, specialInstructions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SpecialInstructionsChangedCopyWith<_$_SpecialInstructionsChanged>
      get copyWith => __$$_SpecialInstructionsChangedCopyWithImpl<
          _$_SpecialInstructionsChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrg salesOrg, ReturnMaterial item, bool selected)
        toggleReturnItem,
    required TResult Function(String assignmentNumber,
            MaterialNumber materialNumber, String itemNumber, bool included)
        toggleBonusItem,
    required TResult Function(ReturnItemDetails additionInfo)
        additionInfoChanged,
    required TResult Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)
        toggleFiles,
    required TResult Function(int step) validateStep,
    required TResult Function(String returnReference) returnReferenceChanged,
    required TResult Function(String specialInstructions)
        specialInstructionsChanged,
    required TResult Function(CustomerCodeInfo customerCodeInfo, User user)
        submit,
  }) {
    return specialInstructionsChanged(specialInstructions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrg salesOrg, ReturnMaterial item, bool selected)?
        toggleReturnItem,
    TResult? Function(String assignmentNumber, MaterialNumber materialNumber,
            String itemNumber, bool included)?
        toggleBonusItem,
    TResult? Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult? Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)?
        toggleFiles,
    TResult? Function(int step)? validateStep,
    TResult? Function(String returnReference)? returnReferenceChanged,
    TResult? Function(String specialInstructions)? specialInstructionsChanged,
    TResult? Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
  }) {
    return specialInstructionsChanged?.call(specialInstructions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrg salesOrg, ReturnMaterial item, bool selected)?
        toggleReturnItem,
    TResult Function(String assignmentNumber, MaterialNumber materialNumber,
            String itemNumber, bool included)?
        toggleBonusItem,
    TResult Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)?
        toggleFiles,
    TResult Function(int step)? validateStep,
    TResult Function(String returnReference)? returnReferenceChanged,
    TResult Function(String specialInstructions)? specialInstructionsChanged,
    TResult Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    required TResult orElse(),
  }) {
    if (specialInstructionsChanged != null) {
      return specialInstructionsChanged(specialInstructions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_ToggleReturnItem value) toggleReturnItem,
    required TResult Function(_ToggleBonusItem value) toggleBonusItem,
    required TResult Function(_AdditionInfoChanged value) additionInfoChanged,
    required TResult Function(_ToggleFiles value) toggleFiles,
    required TResult Function(_ValidateStep value) validateStep,
    required TResult Function(_ReturnReferenceChanged value)
        returnReferenceChanged,
    required TResult Function(_SpecialInstructionsChanged value)
        specialInstructionsChanged,
    required TResult Function(_Submit value) submit,
  }) {
    return specialInstructionsChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult? Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult? Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult? Function(_ToggleFiles value)? toggleFiles,
    TResult? Function(_ValidateStep value)? validateStep,
    TResult? Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult? Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult? Function(_Submit value)? submit,
  }) {
    return specialInstructionsChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult Function(_ToggleFiles value)? toggleFiles,
    TResult Function(_ValidateStep value)? validateStep,
    TResult Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (specialInstructionsChanged != null) {
      return specialInstructionsChanged(this);
    }
    return orElse();
  }
}

abstract class _SpecialInstructionsChanged implements NewRequestEvent {
  const factory _SpecialInstructionsChanged(final String specialInstructions) =
      _$_SpecialInstructionsChanged;

  String get specialInstructions;
  @JsonKey(ignore: true)
  _$$_SpecialInstructionsChangedCopyWith<_$_SpecialInstructionsChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SubmitCopyWith<$Res> {
  factory _$$_SubmitCopyWith(_$_Submit value, $Res Function(_$_Submit) then) =
      __$$_SubmitCopyWithImpl<$Res>;
  @useResult
  $Res call({CustomerCodeInfo customerCodeInfo, User user});

  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_SubmitCopyWithImpl<$Res>
    extends _$NewRequestEventCopyWithImpl<$Res, _$_Submit>
    implements _$$_SubmitCopyWith<$Res> {
  __$$_SubmitCopyWithImpl(_$_Submit _value, $Res Function(_$_Submit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeInfo = null,
    Object? user = null,
  }) {
    return _then(_$_Submit(
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_Submit implements _Submit {
  const _$_Submit({required this.customerCodeInfo, required this.user});

  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final User user;

  @override
  String toString() {
    return 'NewRequestEvent.submit(customerCodeInfo: $customerCodeInfo, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Submit &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerCodeInfo, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubmitCopyWith<_$_Submit> get copyWith =>
      __$$_SubmitCopyWithImpl<_$_Submit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrg salesOrg, ReturnMaterial item, bool selected)
        toggleReturnItem,
    required TResult Function(String assignmentNumber,
            MaterialNumber materialNumber, String itemNumber, bool included)
        toggleBonusItem,
    required TResult Function(ReturnItemDetails additionInfo)
        additionInfoChanged,
    required TResult Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)
        toggleFiles,
    required TResult Function(int step) validateStep,
    required TResult Function(String returnReference) returnReferenceChanged,
    required TResult Function(String specialInstructions)
        specialInstructionsChanged,
    required TResult Function(CustomerCodeInfo customerCodeInfo, User user)
        submit,
  }) {
    return submit(customerCodeInfo, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrg salesOrg, ReturnMaterial item, bool selected)?
        toggleReturnItem,
    TResult? Function(String assignmentNumber, MaterialNumber materialNumber,
            String itemNumber, bool included)?
        toggleBonusItem,
    TResult? Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult? Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)?
        toggleFiles,
    TResult? Function(int step)? validateStep,
    TResult? Function(String returnReference)? returnReferenceChanged,
    TResult? Function(String specialInstructions)? specialInstructionsChanged,
    TResult? Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
  }) {
    return submit?.call(customerCodeInfo, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrg salesOrg, ReturnMaterial item, bool selected)?
        toggleReturnItem,
    TResult Function(String assignmentNumber, MaterialNumber materialNumber,
            String itemNumber, bool included)?
        toggleBonusItem,
    TResult Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult Function(
            String uuid, List<ReturnRequestAttachment> files, bool included)?
        toggleFiles,
    TResult Function(int step)? validateStep,
    TResult Function(String returnReference)? returnReferenceChanged,
    TResult Function(String specialInstructions)? specialInstructionsChanged,
    TResult Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(customerCodeInfo, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_ToggleReturnItem value) toggleReturnItem,
    required TResult Function(_ToggleBonusItem value) toggleBonusItem,
    required TResult Function(_AdditionInfoChanged value) additionInfoChanged,
    required TResult Function(_ToggleFiles value) toggleFiles,
    required TResult Function(_ValidateStep value) validateStep,
    required TResult Function(_ReturnReferenceChanged value)
        returnReferenceChanged,
    required TResult Function(_SpecialInstructionsChanged value)
        specialInstructionsChanged,
    required TResult Function(_Submit value) submit,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult? Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult? Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult? Function(_ToggleFiles value)? toggleFiles,
    TResult? Function(_ValidateStep value)? validateStep,
    TResult? Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult? Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult? Function(_Submit value)? submit,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult Function(_ToggleFiles value)? toggleFiles,
    TResult Function(_ValidateStep value)? validateStep,
    TResult Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class _Submit implements NewRequestEvent {
  const factory _Submit(
      {required final CustomerCodeInfo customerCodeInfo,
      required final User user}) = _$_Submit;

  CustomerCodeInfo get customerCodeInfo;
  User get user;
  @JsonKey(ignore: true)
  _$$_SubmitCopyWith<_$_Submit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NewRequestState {
  List<ReturnMaterial> get selectedItems => throw _privateConstructorUsedError;
  List<InvoiceDetails> get invoiceDetails => throw _privateConstructorUsedError;
  String get returnReference => throw _privateConstructorUsedError;
  String get specialInstructions => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, String>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  String get returnRequestId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewRequestStateCopyWith<NewRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewRequestStateCopyWith<$Res> {
  factory $NewRequestStateCopyWith(
          NewRequestState value, $Res Function(NewRequestState) then) =
      _$NewRequestStateCopyWithImpl<$Res, NewRequestState>;
  @useResult
  $Res call(
      {List<ReturnMaterial> selectedItems,
      List<InvoiceDetails> invoiceDetails,
      String returnReference,
      String specialInstructions,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ApiFailure, String>> failureOrSuccessOption,
      String returnRequestId});
}

/// @nodoc
class _$NewRequestStateCopyWithImpl<$Res, $Val extends NewRequestState>
    implements $NewRequestStateCopyWith<$Res> {
  _$NewRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedItems = null,
    Object? invoiceDetails = null,
    Object? returnReference = null,
    Object? specialInstructions = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? failureOrSuccessOption = null,
    Object? returnRequestId = null,
  }) {
    return _then(_value.copyWith(
      selectedItems: null == selectedItems
          ? _value.selectedItems
          : selectedItems // ignore: cast_nullable_to_non_nullable
              as List<ReturnMaterial>,
      invoiceDetails: null == invoiceDetails
          ? _value.invoiceDetails
          : invoiceDetails // ignore: cast_nullable_to_non_nullable
              as List<InvoiceDetails>,
      returnReference: null == returnReference
          ? _value.returnReference
          : returnReference // ignore: cast_nullable_to_non_nullable
              as String,
      specialInstructions: null == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, String>>,
      returnRequestId: null == returnRequestId
          ? _value.returnRequestId
          : returnRequestId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewRequestStateCopyWith<$Res>
    implements $NewRequestStateCopyWith<$Res> {
  factory _$$_NewRequestStateCopyWith(
          _$_NewRequestState value, $Res Function(_$_NewRequestState) then) =
      __$$_NewRequestStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ReturnMaterial> selectedItems,
      List<InvoiceDetails> invoiceDetails,
      String returnReference,
      String specialInstructions,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ApiFailure, String>> failureOrSuccessOption,
      String returnRequestId});
}

/// @nodoc
class __$$_NewRequestStateCopyWithImpl<$Res>
    extends _$NewRequestStateCopyWithImpl<$Res, _$_NewRequestState>
    implements _$$_NewRequestStateCopyWith<$Res> {
  __$$_NewRequestStateCopyWithImpl(
      _$_NewRequestState _value, $Res Function(_$_NewRequestState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedItems = null,
    Object? invoiceDetails = null,
    Object? returnReference = null,
    Object? specialInstructions = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? failureOrSuccessOption = null,
    Object? returnRequestId = null,
  }) {
    return _then(_$_NewRequestState(
      selectedItems: null == selectedItems
          ? _value._selectedItems
          : selectedItems // ignore: cast_nullable_to_non_nullable
              as List<ReturnMaterial>,
      invoiceDetails: null == invoiceDetails
          ? _value._invoiceDetails
          : invoiceDetails // ignore: cast_nullable_to_non_nullable
              as List<InvoiceDetails>,
      returnReference: null == returnReference
          ? _value.returnReference
          : returnReference // ignore: cast_nullable_to_non_nullable
              as String,
      specialInstructions: null == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, String>>,
      returnRequestId: null == returnRequestId
          ? _value.returnRequestId
          : returnRequestId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NewRequestState extends _NewRequestState {
  const _$_NewRequestState(
      {required final List<ReturnMaterial> selectedItems,
      required final List<InvoiceDetails> invoiceDetails,
      required this.returnReference,
      required this.specialInstructions,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.failureOrSuccessOption,
      required this.returnRequestId})
      : _selectedItems = selectedItems,
        _invoiceDetails = invoiceDetails,
        super._();

  final List<ReturnMaterial> _selectedItems;
  @override
  List<ReturnMaterial> get selectedItems {
    if (_selectedItems is EqualUnmodifiableListView) return _selectedItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedItems);
  }

  final List<InvoiceDetails> _invoiceDetails;
  @override
  List<InvoiceDetails> get invoiceDetails {
    if (_invoiceDetails is EqualUnmodifiableListView) return _invoiceDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invoiceDetails);
  }

  @override
  final String returnReference;
  @override
  final String specialInstructions;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<ApiFailure, String>> failureOrSuccessOption;
  @override
  final String returnRequestId;

  @override
  String toString() {
    return 'NewRequestState(selectedItems: $selectedItems, invoiceDetails: $invoiceDetails, returnReference: $returnReference, specialInstructions: $specialInstructions, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, failureOrSuccessOption: $failureOrSuccessOption, returnRequestId: $returnRequestId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewRequestState &&
            const DeepCollectionEquality()
                .equals(other._selectedItems, _selectedItems) &&
            const DeepCollectionEquality()
                .equals(other._invoiceDetails, _invoiceDetails) &&
            (identical(other.returnReference, returnReference) ||
                other.returnReference == returnReference) &&
            (identical(other.specialInstructions, specialInstructions) ||
                other.specialInstructions == specialInstructions) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.returnRequestId, returnRequestId) ||
                other.returnRequestId == returnRequestId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_selectedItems),
      const DeepCollectionEquality().hash(_invoiceDetails),
      returnReference,
      specialInstructions,
      showErrorMessages,
      isSubmitting,
      failureOrSuccessOption,
      returnRequestId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewRequestStateCopyWith<_$_NewRequestState> get copyWith =>
      __$$_NewRequestStateCopyWithImpl<_$_NewRequestState>(this, _$identity);
}

abstract class _NewRequestState extends NewRequestState {
  const factory _NewRequestState(
      {required final List<ReturnMaterial> selectedItems,
      required final List<InvoiceDetails> invoiceDetails,
      required final String returnReference,
      required final String specialInstructions,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<ApiFailure, String>> failureOrSuccessOption,
      required final String returnRequestId}) = _$_NewRequestState;
  const _NewRequestState._() : super._();

  @override
  List<ReturnMaterial> get selectedItems;
  @override
  List<InvoiceDetails> get invoiceDetails;
  @override
  String get returnReference;
  @override
  String get specialInstructions;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<ApiFailure, String>> get failureOrSuccessOption;
  @override
  String get returnRequestId;
  @override
  @JsonKey(ignore: true)
  _$$_NewRequestStateCopyWith<_$_NewRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}
