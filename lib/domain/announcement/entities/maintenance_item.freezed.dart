// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MaintenanceItem {
  String get id => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  int get maxNumberOfItem => throw _privateConstructorUsedError;
  List<MaintenanceBanner> get banners => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaintenanceItemCopyWith<MaintenanceItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaintenanceItemCopyWith<$Res> {
  factory $MaintenanceItemCopyWith(
          MaintenanceItem value, $Res Function(MaintenanceItem) then) =
      _$MaintenanceItemCopyWithImpl<$Res, MaintenanceItem>;
  @useResult
  $Res call(
      {String id,
      String displayName,
      int maxNumberOfItem,
      List<MaintenanceBanner> banners});
}

/// @nodoc
class _$MaintenanceItemCopyWithImpl<$Res, $Val extends MaintenanceItem>
    implements $MaintenanceItemCopyWith<$Res> {
  _$MaintenanceItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? maxNumberOfItem = null,
    Object? banners = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      maxNumberOfItem: null == maxNumberOfItem
          ? _value.maxNumberOfItem
          : maxNumberOfItem // ignore: cast_nullable_to_non_nullable
              as int,
      banners: null == banners
          ? _value.banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<MaintenanceBanner>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MaintenanceItemCopyWith<$Res>
    implements $MaintenanceItemCopyWith<$Res> {
  factory _$$_MaintenanceItemCopyWith(
          _$_MaintenanceItem value, $Res Function(_$_MaintenanceItem) then) =
      __$$_MaintenanceItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String displayName,
      int maxNumberOfItem,
      List<MaintenanceBanner> banners});
}

/// @nodoc
class __$$_MaintenanceItemCopyWithImpl<$Res>
    extends _$MaintenanceItemCopyWithImpl<$Res, _$_MaintenanceItem>
    implements _$$_MaintenanceItemCopyWith<$Res> {
  __$$_MaintenanceItemCopyWithImpl(
      _$_MaintenanceItem _value, $Res Function(_$_MaintenanceItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? maxNumberOfItem = null,
    Object? banners = null,
  }) {
    return _then(_$_MaintenanceItem(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      maxNumberOfItem: null == maxNumberOfItem
          ? _value.maxNumberOfItem
          : maxNumberOfItem // ignore: cast_nullable_to_non_nullable
              as int,
      banners: null == banners
          ? _value._banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<MaintenanceBanner>,
    ));
  }
}

/// @nodoc

class _$_MaintenanceItem extends _MaintenanceItem {
  const _$_MaintenanceItem(
      {required this.id,
      required this.displayName,
      required this.maxNumberOfItem,
      required final List<MaintenanceBanner> banners})
      : _banners = banners,
        super._();

  @override
  final String id;
  @override
  final String displayName;
  @override
  final int maxNumberOfItem;
  final List<MaintenanceBanner> _banners;
  @override
  List<MaintenanceBanner> get banners {
    if (_banners is EqualUnmodifiableListView) return _banners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banners);
  }

  @override
  String toString() {
    return 'MaintenanceItem(id: $id, displayName: $displayName, maxNumberOfItem: $maxNumberOfItem, banners: $banners)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaintenanceItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.maxNumberOfItem, maxNumberOfItem) ||
                other.maxNumberOfItem == maxNumberOfItem) &&
            const DeepCollectionEquality().equals(other._banners, _banners));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, displayName, maxNumberOfItem,
      const DeepCollectionEquality().hash(_banners));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaintenanceItemCopyWith<_$_MaintenanceItem> get copyWith =>
      __$$_MaintenanceItemCopyWithImpl<_$_MaintenanceItem>(this, _$identity);
}

abstract class _MaintenanceItem extends MaintenanceItem {
  const factory _MaintenanceItem(
      {required final String id,
      required final String displayName,
      required final int maxNumberOfItem,
      required final List<MaintenanceBanner> banners}) = _$_MaintenanceItem;
  const _MaintenanceItem._() : super._();

  @override
  String get id;
  @override
  String get displayName;
  @override
  int get maxNumberOfItem;
  @override
  List<MaintenanceBanner> get banners;
  @override
  @JsonKey(ignore: true)
  _$$_MaintenanceItemCopyWith<_$_MaintenanceItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MaintenanceBanner {
  String get id => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  EZReachBannerLink get hyperlink => throw _privateConstructorUsedError;
  String get isoDateValue => throw _privateConstructorUsedError;
  String get formattedDateValue => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  List<ApplicableModules> get applicableModules =>
      throw _privateConstructorUsedError;
  bool get enableCrossButton => throw _privateConstructorUsedError;
  AnnouncementDislayTime get loginType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaintenanceBannerCopyWith<MaintenanceBanner> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaintenanceBannerCopyWith<$Res> {
  factory $MaintenanceBannerCopyWith(
          MaintenanceBanner value, $Res Function(MaintenanceBanner) then) =
      _$MaintenanceBannerCopyWithImpl<$Res, MaintenanceBanner>;
  @useResult
  $Res call(
      {String id,
      String displayName,
      String content,
      EZReachBannerLink hyperlink,
      String isoDateValue,
      String formattedDateValue,
      String type,
      List<ApplicableModules> applicableModules,
      bool enableCrossButton,
      AnnouncementDislayTime loginType});
}

/// @nodoc
class _$MaintenanceBannerCopyWithImpl<$Res, $Val extends MaintenanceBanner>
    implements $MaintenanceBannerCopyWith<$Res> {
  _$MaintenanceBannerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? content = null,
    Object? hyperlink = null,
    Object? isoDateValue = null,
    Object? formattedDateValue = null,
    Object? type = null,
    Object? applicableModules = null,
    Object? enableCrossButton = null,
    Object? loginType = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      hyperlink: null == hyperlink
          ? _value.hyperlink
          : hyperlink // ignore: cast_nullable_to_non_nullable
              as EZReachBannerLink,
      isoDateValue: null == isoDateValue
          ? _value.isoDateValue
          : isoDateValue // ignore: cast_nullable_to_non_nullable
              as String,
      formattedDateValue: null == formattedDateValue
          ? _value.formattedDateValue
          : formattedDateValue // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      applicableModules: null == applicableModules
          ? _value.applicableModules
          : applicableModules // ignore: cast_nullable_to_non_nullable
              as List<ApplicableModules>,
      enableCrossButton: null == enableCrossButton
          ? _value.enableCrossButton
          : enableCrossButton // ignore: cast_nullable_to_non_nullable
              as bool,
      loginType: null == loginType
          ? _value.loginType
          : loginType // ignore: cast_nullable_to_non_nullable
              as AnnouncementDislayTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MaintenanceBannerCopyWith<$Res>
    implements $MaintenanceBannerCopyWith<$Res> {
  factory _$$_MaintenanceBannerCopyWith(_$_MaintenanceBanner value,
          $Res Function(_$_MaintenanceBanner) then) =
      __$$_MaintenanceBannerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String displayName,
      String content,
      EZReachBannerLink hyperlink,
      String isoDateValue,
      String formattedDateValue,
      String type,
      List<ApplicableModules> applicableModules,
      bool enableCrossButton,
      AnnouncementDislayTime loginType});
}

/// @nodoc
class __$$_MaintenanceBannerCopyWithImpl<$Res>
    extends _$MaintenanceBannerCopyWithImpl<$Res, _$_MaintenanceBanner>
    implements _$$_MaintenanceBannerCopyWith<$Res> {
  __$$_MaintenanceBannerCopyWithImpl(
      _$_MaintenanceBanner _value, $Res Function(_$_MaintenanceBanner) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? content = null,
    Object? hyperlink = null,
    Object? isoDateValue = null,
    Object? formattedDateValue = null,
    Object? type = null,
    Object? applicableModules = null,
    Object? enableCrossButton = null,
    Object? loginType = null,
  }) {
    return _then(_$_MaintenanceBanner(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      hyperlink: null == hyperlink
          ? _value.hyperlink
          : hyperlink // ignore: cast_nullable_to_non_nullable
              as EZReachBannerLink,
      isoDateValue: null == isoDateValue
          ? _value.isoDateValue
          : isoDateValue // ignore: cast_nullable_to_non_nullable
              as String,
      formattedDateValue: null == formattedDateValue
          ? _value.formattedDateValue
          : formattedDateValue // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      applicableModules: null == applicableModules
          ? _value._applicableModules
          : applicableModules // ignore: cast_nullable_to_non_nullable
              as List<ApplicableModules>,
      enableCrossButton: null == enableCrossButton
          ? _value.enableCrossButton
          : enableCrossButton // ignore: cast_nullable_to_non_nullable
              as bool,
      loginType: null == loginType
          ? _value.loginType
          : loginType // ignore: cast_nullable_to_non_nullable
              as AnnouncementDislayTime,
    ));
  }
}

/// @nodoc

class _$_MaintenanceBanner extends _MaintenanceBanner {
  const _$_MaintenanceBanner(
      {required this.id,
      required this.displayName,
      required this.content,
      required this.hyperlink,
      required this.isoDateValue,
      required this.formattedDateValue,
      required this.type,
      required final List<ApplicableModules> applicableModules,
      required this.enableCrossButton,
      required this.loginType})
      : _applicableModules = applicableModules,
        super._();

  @override
  final String id;
  @override
  final String displayName;
  @override
  final String content;
  @override
  final EZReachBannerLink hyperlink;
  @override
  final String isoDateValue;
  @override
  final String formattedDateValue;
  @override
  final String type;
  final List<ApplicableModules> _applicableModules;
  @override
  List<ApplicableModules> get applicableModules {
    if (_applicableModules is EqualUnmodifiableListView)
      return _applicableModules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_applicableModules);
  }

  @override
  final bool enableCrossButton;
  @override
  final AnnouncementDislayTime loginType;

  @override
  String toString() {
    return 'MaintenanceBanner(id: $id, displayName: $displayName, content: $content, hyperlink: $hyperlink, isoDateValue: $isoDateValue, formattedDateValue: $formattedDateValue, type: $type, applicableModules: $applicableModules, enableCrossButton: $enableCrossButton, loginType: $loginType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaintenanceBanner &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.hyperlink, hyperlink) ||
                other.hyperlink == hyperlink) &&
            (identical(other.isoDateValue, isoDateValue) ||
                other.isoDateValue == isoDateValue) &&
            (identical(other.formattedDateValue, formattedDateValue) ||
                other.formattedDateValue == formattedDateValue) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._applicableModules, _applicableModules) &&
            (identical(other.enableCrossButton, enableCrossButton) ||
                other.enableCrossButton == enableCrossButton) &&
            (identical(other.loginType, loginType) ||
                other.loginType == loginType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      displayName,
      content,
      hyperlink,
      isoDateValue,
      formattedDateValue,
      type,
      const DeepCollectionEquality().hash(_applicableModules),
      enableCrossButton,
      loginType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaintenanceBannerCopyWith<_$_MaintenanceBanner> get copyWith =>
      __$$_MaintenanceBannerCopyWithImpl<_$_MaintenanceBanner>(
          this, _$identity);
}

abstract class _MaintenanceBanner extends MaintenanceBanner {
  const factory _MaintenanceBanner(
      {required final String id,
      required final String displayName,
      required final String content,
      required final EZReachBannerLink hyperlink,
      required final String isoDateValue,
      required final String formattedDateValue,
      required final String type,
      required final List<ApplicableModules> applicableModules,
      required final bool enableCrossButton,
      required final AnnouncementDislayTime loginType}) = _$_MaintenanceBanner;
  const _MaintenanceBanner._() : super._();

  @override
  String get id;
  @override
  String get displayName;
  @override
  String get content;
  @override
  EZReachBannerLink get hyperlink;
  @override
  String get isoDateValue;
  @override
  String get formattedDateValue;
  @override
  String get type;
  @override
  List<ApplicableModules> get applicableModules;
  @override
  bool get enableCrossButton;
  @override
  AnnouncementDislayTime get loginType;
  @override
  @JsonKey(ignore: true)
  _$$_MaintenanceBannerCopyWith<_$_MaintenanceBanner> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ApplicableModules {
  String get id => throw _privateConstructorUsedError;
  AnnouncementDislayModule get name => throw _privateConstructorUsedError;
  AnnouncementDislayModule get displayName =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApplicableModulesCopyWith<ApplicableModules> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicableModulesCopyWith<$Res> {
  factory $ApplicableModulesCopyWith(
          ApplicableModules value, $Res Function(ApplicableModules) then) =
      _$ApplicableModulesCopyWithImpl<$Res, ApplicableModules>;
  @useResult
  $Res call(
      {String id,
      AnnouncementDislayModule name,
      AnnouncementDislayModule displayName});
}

/// @nodoc
class _$ApplicableModulesCopyWithImpl<$Res, $Val extends ApplicableModules>
    implements $ApplicableModulesCopyWith<$Res> {
  _$ApplicableModulesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as AnnouncementDislayModule,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as AnnouncementDislayModule,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApplicableModulesCopyWith<$Res>
    implements $ApplicableModulesCopyWith<$Res> {
  factory _$$_ApplicableModulesCopyWith(_$_ApplicableModules value,
          $Res Function(_$_ApplicableModules) then) =
      __$$_ApplicableModulesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      AnnouncementDislayModule name,
      AnnouncementDislayModule displayName});
}

/// @nodoc
class __$$_ApplicableModulesCopyWithImpl<$Res>
    extends _$ApplicableModulesCopyWithImpl<$Res, _$_ApplicableModules>
    implements _$$_ApplicableModulesCopyWith<$Res> {
  __$$_ApplicableModulesCopyWithImpl(
      _$_ApplicableModules _value, $Res Function(_$_ApplicableModules) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
  }) {
    return _then(_$_ApplicableModules(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as AnnouncementDislayModule,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as AnnouncementDislayModule,
    ));
  }
}

/// @nodoc

class _$_ApplicableModules extends _ApplicableModules {
  const _$_ApplicableModules(
      {required this.id, required this.name, required this.displayName})
      : super._();

  @override
  final String id;
  @override
  final AnnouncementDislayModule name;
  @override
  final AnnouncementDislayModule displayName;

  @override
  String toString() {
    return 'ApplicableModules(id: $id, name: $name, displayName: $displayName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApplicableModules &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, displayName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApplicableModulesCopyWith<_$_ApplicableModules> get copyWith =>
      __$$_ApplicableModulesCopyWithImpl<_$_ApplicableModules>(
          this, _$identity);
}

abstract class _ApplicableModules extends ApplicableModules {
  const factory _ApplicableModules(
          {required final String id,
          required final AnnouncementDislayModule name,
          required final AnnouncementDislayModule displayName}) =
      _$_ApplicableModules;
  const _ApplicableModules._() : super._();

  @override
  String get id;
  @override
  AnnouncementDislayModule get name;
  @override
  AnnouncementDislayModule get displayName;
  @override
  @JsonKey(ignore: true)
  _$$_ApplicableModulesCopyWith<_$_ApplicableModules> get copyWith =>
      throw _privateConstructorUsedError;
}
