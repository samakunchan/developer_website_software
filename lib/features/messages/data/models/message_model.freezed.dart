// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageServiceTypeModel {

 String get id; String get icon; String get label;
/// Create a copy of MessageServiceTypeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageServiceTypeModelCopyWith<MessageServiceTypeModel> get copyWith => _$MessageServiceTypeModelCopyWithImpl<MessageServiceTypeModel>(this as MessageServiceTypeModel, _$identity);

  /// Serializes this MessageServiceTypeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageServiceTypeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,icon,label);

@override
String toString() {
  return 'MessageServiceTypeModel(id: $id, icon: $icon, label: $label)';
}


}

/// @nodoc
abstract mixin class $MessageServiceTypeModelCopyWith<$Res>  {
  factory $MessageServiceTypeModelCopyWith(MessageServiceTypeModel value, $Res Function(MessageServiceTypeModel) _then) = _$MessageServiceTypeModelCopyWithImpl;
@useResult
$Res call({
 String id, String icon, String label
});




}
/// @nodoc
class _$MessageServiceTypeModelCopyWithImpl<$Res>
    implements $MessageServiceTypeModelCopyWith<$Res> {
  _$MessageServiceTypeModelCopyWithImpl(this._self, this._then);

  final MessageServiceTypeModel _self;
  final $Res Function(MessageServiceTypeModel) _then;

/// Create a copy of MessageServiceTypeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? icon = null,Object? label = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageServiceTypeModel].
extension MessageServiceTypeModelPatterns on MessageServiceTypeModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageServiceTypeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageServiceTypeModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageServiceTypeModel value)  $default,){
final _that = this;
switch (_that) {
case _MessageServiceTypeModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageServiceTypeModel value)?  $default,){
final _that = this;
switch (_that) {
case _MessageServiceTypeModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String icon,  String label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageServiceTypeModel() when $default != null:
return $default(_that.id,_that.icon,_that.label);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String icon,  String label)  $default,) {final _that = this;
switch (_that) {
case _MessageServiceTypeModel():
return $default(_that.id,_that.icon,_that.label);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String icon,  String label)?  $default,) {final _that = this;
switch (_that) {
case _MessageServiceTypeModel() when $default != null:
return $default(_that.id,_that.icon,_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageServiceTypeModel extends MessageServiceTypeModel {
  const _MessageServiceTypeModel({required this.id, required this.icon, required this.label}): super._();
  factory _MessageServiceTypeModel.fromJson(Map<String, dynamic> json) => _$MessageServiceTypeModelFromJson(json);

@override final  String id;
@override final  String icon;
@override final  String label;

/// Create a copy of MessageServiceTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageServiceTypeModelCopyWith<_MessageServiceTypeModel> get copyWith => __$MessageServiceTypeModelCopyWithImpl<_MessageServiceTypeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageServiceTypeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageServiceTypeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,icon,label);

@override
String toString() {
  return 'MessageServiceTypeModel(id: $id, icon: $icon, label: $label)';
}


}

/// @nodoc
abstract mixin class _$MessageServiceTypeModelCopyWith<$Res> implements $MessageServiceTypeModelCopyWith<$Res> {
  factory _$MessageServiceTypeModelCopyWith(_MessageServiceTypeModel value, $Res Function(_MessageServiceTypeModel) _then) = __$MessageServiceTypeModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String icon, String label
});




}
/// @nodoc
class __$MessageServiceTypeModelCopyWithImpl<$Res>
    implements _$MessageServiceTypeModelCopyWith<$Res> {
  __$MessageServiceTypeModelCopyWithImpl(this._self, this._then);

  final _MessageServiceTypeModel _self;
  final $Res Function(_MessageServiceTypeModel) _then;

/// Create a copy of MessageServiceTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? icon = null,Object? label = null,}) {
  return _then(_MessageServiceTypeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$MessagePriceRangeTypeModel {

 String get id; String get currency; String get label;
/// Create a copy of MessagePriceRangeTypeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessagePriceRangeTypeModelCopyWith<MessagePriceRangeTypeModel> get copyWith => _$MessagePriceRangeTypeModelCopyWithImpl<MessagePriceRangeTypeModel>(this as MessagePriceRangeTypeModel, _$identity);

  /// Serializes this MessagePriceRangeTypeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessagePriceRangeTypeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,currency,label);

@override
String toString() {
  return 'MessagePriceRangeTypeModel(id: $id, currency: $currency, label: $label)';
}


}

/// @nodoc
abstract mixin class $MessagePriceRangeTypeModelCopyWith<$Res>  {
  factory $MessagePriceRangeTypeModelCopyWith(MessagePriceRangeTypeModel value, $Res Function(MessagePriceRangeTypeModel) _then) = _$MessagePriceRangeTypeModelCopyWithImpl;
@useResult
$Res call({
 String id, String currency, String label
});




}
/// @nodoc
class _$MessagePriceRangeTypeModelCopyWithImpl<$Res>
    implements $MessagePriceRangeTypeModelCopyWith<$Res> {
  _$MessagePriceRangeTypeModelCopyWithImpl(this._self, this._then);

  final MessagePriceRangeTypeModel _self;
  final $Res Function(MessagePriceRangeTypeModel) _then;

/// Create a copy of MessagePriceRangeTypeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? currency = null,Object? label = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MessagePriceRangeTypeModel].
extension MessagePriceRangeTypeModelPatterns on MessagePriceRangeTypeModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessagePriceRangeTypeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessagePriceRangeTypeModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessagePriceRangeTypeModel value)  $default,){
final _that = this;
switch (_that) {
case _MessagePriceRangeTypeModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessagePriceRangeTypeModel value)?  $default,){
final _that = this;
switch (_that) {
case _MessagePriceRangeTypeModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String currency,  String label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessagePriceRangeTypeModel() when $default != null:
return $default(_that.id,_that.currency,_that.label);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String currency,  String label)  $default,) {final _that = this;
switch (_that) {
case _MessagePriceRangeTypeModel():
return $default(_that.id,_that.currency,_that.label);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String currency,  String label)?  $default,) {final _that = this;
switch (_that) {
case _MessagePriceRangeTypeModel() when $default != null:
return $default(_that.id,_that.currency,_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessagePriceRangeTypeModel extends MessagePriceRangeTypeModel {
  const _MessagePriceRangeTypeModel({required this.id, required this.currency, required this.label}): super._();
  factory _MessagePriceRangeTypeModel.fromJson(Map<String, dynamic> json) => _$MessagePriceRangeTypeModelFromJson(json);

@override final  String id;
@override final  String currency;
@override final  String label;

/// Create a copy of MessagePriceRangeTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessagePriceRangeTypeModelCopyWith<_MessagePriceRangeTypeModel> get copyWith => __$MessagePriceRangeTypeModelCopyWithImpl<_MessagePriceRangeTypeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessagePriceRangeTypeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessagePriceRangeTypeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,currency,label);

@override
String toString() {
  return 'MessagePriceRangeTypeModel(id: $id, currency: $currency, label: $label)';
}


}

/// @nodoc
abstract mixin class _$MessagePriceRangeTypeModelCopyWith<$Res> implements $MessagePriceRangeTypeModelCopyWith<$Res> {
  factory _$MessagePriceRangeTypeModelCopyWith(_MessagePriceRangeTypeModel value, $Res Function(_MessagePriceRangeTypeModel) _then) = __$MessagePriceRangeTypeModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String currency, String label
});




}
/// @nodoc
class __$MessagePriceRangeTypeModelCopyWithImpl<$Res>
    implements _$MessagePriceRangeTypeModelCopyWith<$Res> {
  __$MessagePriceRangeTypeModelCopyWithImpl(this._self, this._then);

  final _MessagePriceRangeTypeModel _self;
  final $Res Function(_MessagePriceRangeTypeModel) _then;

/// Create a copy of MessagePriceRangeTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? currency = null,Object? label = null,}) {
  return _then(_MessagePriceRangeTypeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$MessageModel {

 int get id; String get fullName; String get email; MessageServiceTypeModel get serviceType; MessagePriceRangeTypeModel get priceRangeType; String get projectBrief; bool get isRead; String get createdAt; String get updatedAt;
/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageModelCopyWith<MessageModel> get copyWith => _$MessageModelCopyWithImpl<MessageModel>(this as MessageModel, _$identity);

  /// Serializes this MessageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.serviceType, serviceType) || other.serviceType == serviceType)&&(identical(other.priceRangeType, priceRangeType) || other.priceRangeType == priceRangeType)&&(identical(other.projectBrief, projectBrief) || other.projectBrief == projectBrief)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,email,serviceType,priceRangeType,projectBrief,isRead,createdAt,updatedAt);

@override
String toString() {
  return 'MessageModel(id: $id, fullName: $fullName, email: $email, serviceType: $serviceType, priceRangeType: $priceRangeType, projectBrief: $projectBrief, isRead: $isRead, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MessageModelCopyWith<$Res>  {
  factory $MessageModelCopyWith(MessageModel value, $Res Function(MessageModel) _then) = _$MessageModelCopyWithImpl;
@useResult
$Res call({
 int id, String fullName, String email, MessageServiceTypeModel serviceType, MessagePriceRangeTypeModel priceRangeType, String projectBrief, bool isRead, String createdAt, String updatedAt
});


$MessageServiceTypeModelCopyWith<$Res> get serviceType;$MessagePriceRangeTypeModelCopyWith<$Res> get priceRangeType;

}
/// @nodoc
class _$MessageModelCopyWithImpl<$Res>
    implements $MessageModelCopyWith<$Res> {
  _$MessageModelCopyWithImpl(this._self, this._then);

  final MessageModel _self;
  final $Res Function(MessageModel) _then;

/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = null,Object? email = null,Object? serviceType = null,Object? priceRangeType = null,Object? projectBrief = null,Object? isRead = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,serviceType: null == serviceType ? _self.serviceType : serviceType // ignore: cast_nullable_to_non_nullable
as MessageServiceTypeModel,priceRangeType: null == priceRangeType ? _self.priceRangeType : priceRangeType // ignore: cast_nullable_to_non_nullable
as MessagePriceRangeTypeModel,projectBrief: null == projectBrief ? _self.projectBrief : projectBrief // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageServiceTypeModelCopyWith<$Res> get serviceType {
  
  return $MessageServiceTypeModelCopyWith<$Res>(_self.serviceType, (value) {
    return _then(_self.copyWith(serviceType: value));
  });
}/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessagePriceRangeTypeModelCopyWith<$Res> get priceRangeType {
  
  return $MessagePriceRangeTypeModelCopyWith<$Res>(_self.priceRangeType, (value) {
    return _then(_self.copyWith(priceRangeType: value));
  });
}
}


/// Adds pattern-matching-related methods to [MessageModel].
extension MessageModelPatterns on MessageModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageModel value)  $default,){
final _that = this;
switch (_that) {
case _MessageModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageModel value)?  $default,){
final _that = this;
switch (_that) {
case _MessageModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String fullName,  String email,  MessageServiceTypeModel serviceType,  MessagePriceRangeTypeModel priceRangeType,  String projectBrief,  bool isRead,  String createdAt,  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageModel() when $default != null:
return $default(_that.id,_that.fullName,_that.email,_that.serviceType,_that.priceRangeType,_that.projectBrief,_that.isRead,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String fullName,  String email,  MessageServiceTypeModel serviceType,  MessagePriceRangeTypeModel priceRangeType,  String projectBrief,  bool isRead,  String createdAt,  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _MessageModel():
return $default(_that.id,_that.fullName,_that.email,_that.serviceType,_that.priceRangeType,_that.projectBrief,_that.isRead,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String fullName,  String email,  MessageServiceTypeModel serviceType,  MessagePriceRangeTypeModel priceRangeType,  String projectBrief,  bool isRead,  String createdAt,  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _MessageModel() when $default != null:
return $default(_that.id,_that.fullName,_that.email,_that.serviceType,_that.priceRangeType,_that.projectBrief,_that.isRead,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageModel extends MessageModel {
  const _MessageModel({required this.id, required this.fullName, required this.email, required this.serviceType, required this.priceRangeType, required this.projectBrief, required this.isRead, required this.createdAt, required this.updatedAt}): super._();
  factory _MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);

@override final  int id;
@override final  String fullName;
@override final  String email;
@override final  MessageServiceTypeModel serviceType;
@override final  MessagePriceRangeTypeModel priceRangeType;
@override final  String projectBrief;
@override final  bool isRead;
@override final  String createdAt;
@override final  String updatedAt;

/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageModelCopyWith<_MessageModel> get copyWith => __$MessageModelCopyWithImpl<_MessageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.serviceType, serviceType) || other.serviceType == serviceType)&&(identical(other.priceRangeType, priceRangeType) || other.priceRangeType == priceRangeType)&&(identical(other.projectBrief, projectBrief) || other.projectBrief == projectBrief)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,email,serviceType,priceRangeType,projectBrief,isRead,createdAt,updatedAt);

@override
String toString() {
  return 'MessageModel(id: $id, fullName: $fullName, email: $email, serviceType: $serviceType, priceRangeType: $priceRangeType, projectBrief: $projectBrief, isRead: $isRead, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$MessageModelCopyWith<$Res> implements $MessageModelCopyWith<$Res> {
  factory _$MessageModelCopyWith(_MessageModel value, $Res Function(_MessageModel) _then) = __$MessageModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String fullName, String email, MessageServiceTypeModel serviceType, MessagePriceRangeTypeModel priceRangeType, String projectBrief, bool isRead, String createdAt, String updatedAt
});


@override $MessageServiceTypeModelCopyWith<$Res> get serviceType;@override $MessagePriceRangeTypeModelCopyWith<$Res> get priceRangeType;

}
/// @nodoc
class __$MessageModelCopyWithImpl<$Res>
    implements _$MessageModelCopyWith<$Res> {
  __$MessageModelCopyWithImpl(this._self, this._then);

  final _MessageModel _self;
  final $Res Function(_MessageModel) _then;

/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = null,Object? email = null,Object? serviceType = null,Object? priceRangeType = null,Object? projectBrief = null,Object? isRead = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_MessageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,serviceType: null == serviceType ? _self.serviceType : serviceType // ignore: cast_nullable_to_non_nullable
as MessageServiceTypeModel,priceRangeType: null == priceRangeType ? _self.priceRangeType : priceRangeType // ignore: cast_nullable_to_non_nullable
as MessagePriceRangeTypeModel,projectBrief: null == projectBrief ? _self.projectBrief : projectBrief // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageServiceTypeModelCopyWith<$Res> get serviceType {
  
  return $MessageServiceTypeModelCopyWith<$Res>(_self.serviceType, (value) {
    return _then(_self.copyWith(serviceType: value));
  });
}/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessagePriceRangeTypeModelCopyWith<$Res> get priceRangeType {
  
  return $MessagePriceRangeTypeModelCopyWith<$Res>(_self.priceRangeType, (value) {
    return _then(_self.copyWith(priceRangeType: value));
  });
}
}


/// @nodoc
mixin _$PaginatedMessagesModel {

 List<MessageModel> get messages; int get total; int get totalPages; int get currentPage;
/// Create a copy of PaginatedMessagesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedMessagesModelCopyWith<PaginatedMessagesModel> get copyWith => _$PaginatedMessagesModelCopyWithImpl<PaginatedMessagesModel>(this as PaginatedMessagesModel, _$identity);

  /// Serializes this PaginatedMessagesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedMessagesModel&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.total, total) || other.total == total)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(messages),total,totalPages,currentPage);

@override
String toString() {
  return 'PaginatedMessagesModel(messages: $messages, total: $total, totalPages: $totalPages, currentPage: $currentPage)';
}


}

/// @nodoc
abstract mixin class $PaginatedMessagesModelCopyWith<$Res>  {
  factory $PaginatedMessagesModelCopyWith(PaginatedMessagesModel value, $Res Function(PaginatedMessagesModel) _then) = _$PaginatedMessagesModelCopyWithImpl;
@useResult
$Res call({
 List<MessageModel> messages, int total, int totalPages, int currentPage
});




}
/// @nodoc
class _$PaginatedMessagesModelCopyWithImpl<$Res>
    implements $PaginatedMessagesModelCopyWith<$Res> {
  _$PaginatedMessagesModelCopyWithImpl(this._self, this._then);

  final PaginatedMessagesModel _self;
  final $Res Function(PaginatedMessagesModel) _then;

/// Create a copy of PaginatedMessagesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messages = null,Object? total = null,Object? totalPages = null,Object? currentPage = null,}) {
  return _then(_self.copyWith(
messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageModel>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedMessagesModel].
extension PaginatedMessagesModelPatterns on PaginatedMessagesModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedMessagesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedMessagesModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedMessagesModel value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedMessagesModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedMessagesModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedMessagesModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MessageModel> messages,  int total,  int totalPages,  int currentPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedMessagesModel() when $default != null:
return $default(_that.messages,_that.total,_that.totalPages,_that.currentPage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MessageModel> messages,  int total,  int totalPages,  int currentPage)  $default,) {final _that = this;
switch (_that) {
case _PaginatedMessagesModel():
return $default(_that.messages,_that.total,_that.totalPages,_that.currentPage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MessageModel> messages,  int total,  int totalPages,  int currentPage)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedMessagesModel() when $default != null:
return $default(_that.messages,_that.total,_that.totalPages,_that.currentPage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginatedMessagesModel extends PaginatedMessagesModel {
  const _PaginatedMessagesModel({required final  List<MessageModel> messages, required this.total, required this.totalPages, required this.currentPage}): _messages = messages,super._();
  factory _PaginatedMessagesModel.fromJson(Map<String, dynamic> json) => _$PaginatedMessagesModelFromJson(json);

 final  List<MessageModel> _messages;
@override List<MessageModel> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@override final  int total;
@override final  int totalPages;
@override final  int currentPage;

/// Create a copy of PaginatedMessagesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedMessagesModelCopyWith<_PaginatedMessagesModel> get copyWith => __$PaginatedMessagesModelCopyWithImpl<_PaginatedMessagesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginatedMessagesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedMessagesModel&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.total, total) || other.total == total)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages),total,totalPages,currentPage);

@override
String toString() {
  return 'PaginatedMessagesModel(messages: $messages, total: $total, totalPages: $totalPages, currentPage: $currentPage)';
}


}

/// @nodoc
abstract mixin class _$PaginatedMessagesModelCopyWith<$Res> implements $PaginatedMessagesModelCopyWith<$Res> {
  factory _$PaginatedMessagesModelCopyWith(_PaginatedMessagesModel value, $Res Function(_PaginatedMessagesModel) _then) = __$PaginatedMessagesModelCopyWithImpl;
@override @useResult
$Res call({
 List<MessageModel> messages, int total, int totalPages, int currentPage
});




}
/// @nodoc
class __$PaginatedMessagesModelCopyWithImpl<$Res>
    implements _$PaginatedMessagesModelCopyWith<$Res> {
  __$PaginatedMessagesModelCopyWithImpl(this._self, this._then);

  final _PaginatedMessagesModel _self;
  final $Res Function(_PaginatedMessagesModel) _then;

/// Create a copy of PaginatedMessagesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messages = null,Object? total = null,Object? totalPages = null,Object? currentPage = null,}) {
  return _then(_PaginatedMessagesModel(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageModel>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
