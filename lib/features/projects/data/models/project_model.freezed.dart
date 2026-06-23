// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TechStackItemModel {

 String get name; String get icon;
/// Create a copy of TechStackItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TechStackItemModelCopyWith<TechStackItemModel> get copyWith => _$TechStackItemModelCopyWithImpl<TechStackItemModel>(this as TechStackItemModel, _$identity);

  /// Serializes this TechStackItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TechStackItemModel&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,icon);

@override
String toString() {
  return 'TechStackItemModel(name: $name, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $TechStackItemModelCopyWith<$Res>  {
  factory $TechStackItemModelCopyWith(TechStackItemModel value, $Res Function(TechStackItemModel) _then) = _$TechStackItemModelCopyWithImpl;
@useResult
$Res call({
 String name, String icon
});




}
/// @nodoc
class _$TechStackItemModelCopyWithImpl<$Res>
    implements $TechStackItemModelCopyWith<$Res> {
  _$TechStackItemModelCopyWithImpl(this._self, this._then);

  final TechStackItemModel _self;
  final $Res Function(TechStackItemModel) _then;

/// Create a copy of TechStackItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? icon = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TechStackItemModel].
extension TechStackItemModelPatterns on TechStackItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TechStackItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TechStackItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TechStackItemModel value)  $default,){
final _that = this;
switch (_that) {
case _TechStackItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TechStackItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _TechStackItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TechStackItemModel() when $default != null:
return $default(_that.name,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String icon)  $default,) {final _that = this;
switch (_that) {
case _TechStackItemModel():
return $default(_that.name,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String icon)?  $default,) {final _that = this;
switch (_that) {
case _TechStackItemModel() when $default != null:
return $default(_that.name,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TechStackItemModel extends TechStackItemModel {
  const _TechStackItemModel({required this.name, required this.icon}): super._();
  factory _TechStackItemModel.fromJson(Map<String, dynamic> json) => _$TechStackItemModelFromJson(json);

@override final  String name;
@override final  String icon;

/// Create a copy of TechStackItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TechStackItemModelCopyWith<_TechStackItemModel> get copyWith => __$TechStackItemModelCopyWithImpl<_TechStackItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TechStackItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TechStackItemModel&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,icon);

@override
String toString() {
  return 'TechStackItemModel(name: $name, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$TechStackItemModelCopyWith<$Res> implements $TechStackItemModelCopyWith<$Res> {
  factory _$TechStackItemModelCopyWith(_TechStackItemModel value, $Res Function(_TechStackItemModel) _then) = __$TechStackItemModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String icon
});




}
/// @nodoc
class __$TechStackItemModelCopyWithImpl<$Res>
    implements _$TechStackItemModelCopyWith<$Res> {
  __$TechStackItemModelCopyWithImpl(this._self, this._then);

  final _TechStackItemModel _self;
  final $Res Function(_TechStackItemModel) _then;

/// Create a copy of TechStackItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? icon = null,}) {
  return _then(_TechStackItemModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ProjectFeatureItemModel {

 String get icon; String get title; String get description;
/// Create a copy of ProjectFeatureItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectFeatureItemModelCopyWith<ProjectFeatureItemModel> get copyWith => _$ProjectFeatureItemModelCopyWithImpl<ProjectFeatureItemModel>(this as ProjectFeatureItemModel, _$identity);

  /// Serializes this ProjectFeatureItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectFeatureItemModel&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,icon,title,description);

@override
String toString() {
  return 'ProjectFeatureItemModel(icon: $icon, title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class $ProjectFeatureItemModelCopyWith<$Res>  {
  factory $ProjectFeatureItemModelCopyWith(ProjectFeatureItemModel value, $Res Function(ProjectFeatureItemModel) _then) = _$ProjectFeatureItemModelCopyWithImpl;
@useResult
$Res call({
 String icon, String title, String description
});




}
/// @nodoc
class _$ProjectFeatureItemModelCopyWithImpl<$Res>
    implements $ProjectFeatureItemModelCopyWith<$Res> {
  _$ProjectFeatureItemModelCopyWithImpl(this._self, this._then);

  final ProjectFeatureItemModel _self;
  final $Res Function(ProjectFeatureItemModel) _then;

/// Create a copy of ProjectFeatureItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? icon = null,Object? title = null,Object? description = null,}) {
  return _then(_self.copyWith(
icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectFeatureItemModel].
extension ProjectFeatureItemModelPatterns on ProjectFeatureItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectFeatureItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectFeatureItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectFeatureItemModel value)  $default,){
final _that = this;
switch (_that) {
case _ProjectFeatureItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectFeatureItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectFeatureItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String icon,  String title,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectFeatureItemModel() when $default != null:
return $default(_that.icon,_that.title,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String icon,  String title,  String description)  $default,) {final _that = this;
switch (_that) {
case _ProjectFeatureItemModel():
return $default(_that.icon,_that.title,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String icon,  String title,  String description)?  $default,) {final _that = this;
switch (_that) {
case _ProjectFeatureItemModel() when $default != null:
return $default(_that.icon,_that.title,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectFeatureItemModel extends ProjectFeatureItemModel {
  const _ProjectFeatureItemModel({required this.icon, required this.title, required this.description}): super._();
  factory _ProjectFeatureItemModel.fromJson(Map<String, dynamic> json) => _$ProjectFeatureItemModelFromJson(json);

@override final  String icon;
@override final  String title;
@override final  String description;

/// Create a copy of ProjectFeatureItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectFeatureItemModelCopyWith<_ProjectFeatureItemModel> get copyWith => __$ProjectFeatureItemModelCopyWithImpl<_ProjectFeatureItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectFeatureItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectFeatureItemModel&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,icon,title,description);

@override
String toString() {
  return 'ProjectFeatureItemModel(icon: $icon, title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ProjectFeatureItemModelCopyWith<$Res> implements $ProjectFeatureItemModelCopyWith<$Res> {
  factory _$ProjectFeatureItemModelCopyWith(_ProjectFeatureItemModel value, $Res Function(_ProjectFeatureItemModel) _then) = __$ProjectFeatureItemModelCopyWithImpl;
@override @useResult
$Res call({
 String icon, String title, String description
});




}
/// @nodoc
class __$ProjectFeatureItemModelCopyWithImpl<$Res>
    implements _$ProjectFeatureItemModelCopyWith<$Res> {
  __$ProjectFeatureItemModelCopyWithImpl(this._self, this._then);

  final _ProjectFeatureItemModel _self;
  final $Res Function(_ProjectFeatureItemModel) _then;

/// Create a copy of ProjectFeatureItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? icon = null,Object? title = null,Object? description = null,}) {
  return _then(_ProjectFeatureItemModel(
icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ProjectImageSizeModel {

 String get url; String get alt;
/// Create a copy of ProjectImageSizeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectImageSizeModelCopyWith<ProjectImageSizeModel> get copyWith => _$ProjectImageSizeModelCopyWithImpl<ProjectImageSizeModel>(this as ProjectImageSizeModel, _$identity);

  /// Serializes this ProjectImageSizeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectImageSizeModel&&(identical(other.url, url) || other.url == url)&&(identical(other.alt, alt) || other.alt == alt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,alt);

@override
String toString() {
  return 'ProjectImageSizeModel(url: $url, alt: $alt)';
}


}

/// @nodoc
abstract mixin class $ProjectImageSizeModelCopyWith<$Res>  {
  factory $ProjectImageSizeModelCopyWith(ProjectImageSizeModel value, $Res Function(ProjectImageSizeModel) _then) = _$ProjectImageSizeModelCopyWithImpl;
@useResult
$Res call({
 String url, String alt
});




}
/// @nodoc
class _$ProjectImageSizeModelCopyWithImpl<$Res>
    implements $ProjectImageSizeModelCopyWith<$Res> {
  _$ProjectImageSizeModelCopyWithImpl(this._self, this._then);

  final ProjectImageSizeModel _self;
  final $Res Function(ProjectImageSizeModel) _then;

/// Create a copy of ProjectImageSizeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? alt = null,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,alt: null == alt ? _self.alt : alt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectImageSizeModel].
extension ProjectImageSizeModelPatterns on ProjectImageSizeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectImageSizeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectImageSizeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectImageSizeModel value)  $default,){
final _that = this;
switch (_that) {
case _ProjectImageSizeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectImageSizeModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectImageSizeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String url,  String alt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectImageSizeModel() when $default != null:
return $default(_that.url,_that.alt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String url,  String alt)  $default,) {final _that = this;
switch (_that) {
case _ProjectImageSizeModel():
return $default(_that.url,_that.alt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String url,  String alt)?  $default,) {final _that = this;
switch (_that) {
case _ProjectImageSizeModel() when $default != null:
return $default(_that.url,_that.alt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectImageSizeModel extends ProjectImageSizeModel {
  const _ProjectImageSizeModel({required this.url, required this.alt}): super._();
  factory _ProjectImageSizeModel.fromJson(Map<String, dynamic> json) => _$ProjectImageSizeModelFromJson(json);

@override final  String url;
@override final  String alt;

/// Create a copy of ProjectImageSizeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectImageSizeModelCopyWith<_ProjectImageSizeModel> get copyWith => __$ProjectImageSizeModelCopyWithImpl<_ProjectImageSizeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectImageSizeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectImageSizeModel&&(identical(other.url, url) || other.url == url)&&(identical(other.alt, alt) || other.alt == alt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,alt);

@override
String toString() {
  return 'ProjectImageSizeModel(url: $url, alt: $alt)';
}


}

/// @nodoc
abstract mixin class _$ProjectImageSizeModelCopyWith<$Res> implements $ProjectImageSizeModelCopyWith<$Res> {
  factory _$ProjectImageSizeModelCopyWith(_ProjectImageSizeModel value, $Res Function(_ProjectImageSizeModel) _then) = __$ProjectImageSizeModelCopyWithImpl;
@override @useResult
$Res call({
 String url, String alt
});




}
/// @nodoc
class __$ProjectImageSizeModelCopyWithImpl<$Res>
    implements _$ProjectImageSizeModelCopyWith<$Res> {
  __$ProjectImageSizeModelCopyWithImpl(this._self, this._then);

  final _ProjectImageSizeModel _self;
  final $Res Function(_ProjectImageSizeModel) _then;

/// Create a copy of ProjectImageSizeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? alt = null,}) {
  return _then(_ProjectImageSizeModel(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,alt: null == alt ? _self.alt : alt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ProjectImageModel {

 ProjectImageSizeModel get medium; ProjectImageSizeModel get raw;
/// Create a copy of ProjectImageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectImageModelCopyWith<ProjectImageModel> get copyWith => _$ProjectImageModelCopyWithImpl<ProjectImageModel>(this as ProjectImageModel, _$identity);

  /// Serializes this ProjectImageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectImageModel&&(identical(other.medium, medium) || other.medium == medium)&&(identical(other.raw, raw) || other.raw == raw));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,medium,raw);

@override
String toString() {
  return 'ProjectImageModel(medium: $medium, raw: $raw)';
}


}

/// @nodoc
abstract mixin class $ProjectImageModelCopyWith<$Res>  {
  factory $ProjectImageModelCopyWith(ProjectImageModel value, $Res Function(ProjectImageModel) _then) = _$ProjectImageModelCopyWithImpl;
@useResult
$Res call({
 ProjectImageSizeModel medium, ProjectImageSizeModel raw
});


$ProjectImageSizeModelCopyWith<$Res> get medium;$ProjectImageSizeModelCopyWith<$Res> get raw;

}
/// @nodoc
class _$ProjectImageModelCopyWithImpl<$Res>
    implements $ProjectImageModelCopyWith<$Res> {
  _$ProjectImageModelCopyWithImpl(this._self, this._then);

  final ProjectImageModel _self;
  final $Res Function(ProjectImageModel) _then;

/// Create a copy of ProjectImageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? medium = null,Object? raw = null,}) {
  return _then(_self.copyWith(
medium: null == medium ? _self.medium : medium // ignore: cast_nullable_to_non_nullable
as ProjectImageSizeModel,raw: null == raw ? _self.raw : raw // ignore: cast_nullable_to_non_nullable
as ProjectImageSizeModel,
  ));
}
/// Create a copy of ProjectImageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectImageSizeModelCopyWith<$Res> get medium {
  
  return $ProjectImageSizeModelCopyWith<$Res>(_self.medium, (value) {
    return _then(_self.copyWith(medium: value));
  });
}/// Create a copy of ProjectImageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectImageSizeModelCopyWith<$Res> get raw {
  
  return $ProjectImageSizeModelCopyWith<$Res>(_self.raw, (value) {
    return _then(_self.copyWith(raw: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProjectImageModel].
extension ProjectImageModelPatterns on ProjectImageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectImageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectImageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectImageModel value)  $default,){
final _that = this;
switch (_that) {
case _ProjectImageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectImageModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectImageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProjectImageSizeModel medium,  ProjectImageSizeModel raw)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectImageModel() when $default != null:
return $default(_that.medium,_that.raw);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProjectImageSizeModel medium,  ProjectImageSizeModel raw)  $default,) {final _that = this;
switch (_that) {
case _ProjectImageModel():
return $default(_that.medium,_that.raw);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProjectImageSizeModel medium,  ProjectImageSizeModel raw)?  $default,) {final _that = this;
switch (_that) {
case _ProjectImageModel() when $default != null:
return $default(_that.medium,_that.raw);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectImageModel extends ProjectImageModel {
  const _ProjectImageModel({required this.medium, required this.raw}): super._();
  factory _ProjectImageModel.fromJson(Map<String, dynamic> json) => _$ProjectImageModelFromJson(json);

@override final  ProjectImageSizeModel medium;
@override final  ProjectImageSizeModel raw;

/// Create a copy of ProjectImageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectImageModelCopyWith<_ProjectImageModel> get copyWith => __$ProjectImageModelCopyWithImpl<_ProjectImageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectImageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectImageModel&&(identical(other.medium, medium) || other.medium == medium)&&(identical(other.raw, raw) || other.raw == raw));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,medium,raw);

@override
String toString() {
  return 'ProjectImageModel(medium: $medium, raw: $raw)';
}


}

/// @nodoc
abstract mixin class _$ProjectImageModelCopyWith<$Res> implements $ProjectImageModelCopyWith<$Res> {
  factory _$ProjectImageModelCopyWith(_ProjectImageModel value, $Res Function(_ProjectImageModel) _then) = __$ProjectImageModelCopyWithImpl;
@override @useResult
$Res call({
 ProjectImageSizeModel medium, ProjectImageSizeModel raw
});


@override $ProjectImageSizeModelCopyWith<$Res> get medium;@override $ProjectImageSizeModelCopyWith<$Res> get raw;

}
/// @nodoc
class __$ProjectImageModelCopyWithImpl<$Res>
    implements _$ProjectImageModelCopyWith<$Res> {
  __$ProjectImageModelCopyWithImpl(this._self, this._then);

  final _ProjectImageModel _self;
  final $Res Function(_ProjectImageModel) _then;

/// Create a copy of ProjectImageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? medium = null,Object? raw = null,}) {
  return _then(_ProjectImageModel(
medium: null == medium ? _self.medium : medium // ignore: cast_nullable_to_non_nullable
as ProjectImageSizeModel,raw: null == raw ? _self.raw : raw // ignore: cast_nullable_to_non_nullable
as ProjectImageSizeModel,
  ));
}

/// Create a copy of ProjectImageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectImageSizeModelCopyWith<$Res> get medium {
  
  return $ProjectImageSizeModelCopyWith<$Res>(_self.medium, (value) {
    return _then(_self.copyWith(medium: value));
  });
}/// Create a copy of ProjectImageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectImageSizeModelCopyWith<$Res> get raw {
  
  return $ProjectImageSizeModelCopyWith<$Res>(_self.raw, (value) {
    return _then(_self.copyWith(raw: value));
  });
}
}


/// @nodoc
mixin _$ProjectModel {

 int get id; String get slug; String get title; String get description; String get category; String get categoryLabel; String? get caseStudyNumber; List<String> get techIcons; List<TechStackItemModel> get techStack; List<ProjectFeatureItemModel> get features; bool get isFeatured; int get userId; String get status; ProjectImageModel? get image; String get createdAt; String get updatedAt;
/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectModelCopyWith<ProjectModel> get copyWith => _$ProjectModelCopyWithImpl<ProjectModel>(this as ProjectModel, _$identity);

  /// Serializes this ProjectModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectModel&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.categoryLabel, categoryLabel) || other.categoryLabel == categoryLabel)&&(identical(other.caseStudyNumber, caseStudyNumber) || other.caseStudyNumber == caseStudyNumber)&&const DeepCollectionEquality().equals(other.techIcons, techIcons)&&const DeepCollectionEquality().equals(other.techStack, techStack)&&const DeepCollectionEquality().equals(other.features, features)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.status, status) || other.status == status)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,title,description,category,categoryLabel,caseStudyNumber,const DeepCollectionEquality().hash(techIcons),const DeepCollectionEquality().hash(techStack),const DeepCollectionEquality().hash(features),isFeatured,userId,status,image,createdAt,updatedAt);

@override
String toString() {
  return 'ProjectModel(id: $id, slug: $slug, title: $title, description: $description, category: $category, categoryLabel: $categoryLabel, caseStudyNumber: $caseStudyNumber, techIcons: $techIcons, techStack: $techStack, features: $features, isFeatured: $isFeatured, userId: $userId, status: $status, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ProjectModelCopyWith<$Res>  {
  factory $ProjectModelCopyWith(ProjectModel value, $Res Function(ProjectModel) _then) = _$ProjectModelCopyWithImpl;
@useResult
$Res call({
 int id, String slug, String title, String description, String category, String categoryLabel, String? caseStudyNumber, List<String> techIcons, List<TechStackItemModel> techStack, List<ProjectFeatureItemModel> features, bool isFeatured, int userId, String status, ProjectImageModel? image, String createdAt, String updatedAt
});


$ProjectImageModelCopyWith<$Res>? get image;

}
/// @nodoc
class _$ProjectModelCopyWithImpl<$Res>
    implements $ProjectModelCopyWith<$Res> {
  _$ProjectModelCopyWithImpl(this._self, this._then);

  final ProjectModel _self;
  final $Res Function(ProjectModel) _then;

/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? title = null,Object? description = null,Object? category = null,Object? categoryLabel = null,Object? caseStudyNumber = freezed,Object? techIcons = null,Object? techStack = null,Object? features = null,Object? isFeatured = null,Object? userId = null,Object? status = null,Object? image = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,categoryLabel: null == categoryLabel ? _self.categoryLabel : categoryLabel // ignore: cast_nullable_to_non_nullable
as String,caseStudyNumber: freezed == caseStudyNumber ? _self.caseStudyNumber : caseStudyNumber // ignore: cast_nullable_to_non_nullable
as String?,techIcons: null == techIcons ? _self.techIcons : techIcons // ignore: cast_nullable_to_non_nullable
as List<String>,techStack: null == techStack ? _self.techStack : techStack // ignore: cast_nullable_to_non_nullable
as List<TechStackItemModel>,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<ProjectFeatureItemModel>,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as ProjectImageModel?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectImageModelCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $ProjectImageModelCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProjectModel].
extension ProjectModelPatterns on ProjectModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectModel value)  $default,){
final _that = this;
switch (_that) {
case _ProjectModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String slug,  String title,  String description,  String category,  String categoryLabel,  String? caseStudyNumber,  List<String> techIcons,  List<TechStackItemModel> techStack,  List<ProjectFeatureItemModel> features,  bool isFeatured,  int userId,  String status,  ProjectImageModel? image,  String createdAt,  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
return $default(_that.id,_that.slug,_that.title,_that.description,_that.category,_that.categoryLabel,_that.caseStudyNumber,_that.techIcons,_that.techStack,_that.features,_that.isFeatured,_that.userId,_that.status,_that.image,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String slug,  String title,  String description,  String category,  String categoryLabel,  String? caseStudyNumber,  List<String> techIcons,  List<TechStackItemModel> techStack,  List<ProjectFeatureItemModel> features,  bool isFeatured,  int userId,  String status,  ProjectImageModel? image,  String createdAt,  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ProjectModel():
return $default(_that.id,_that.slug,_that.title,_that.description,_that.category,_that.categoryLabel,_that.caseStudyNumber,_that.techIcons,_that.techStack,_that.features,_that.isFeatured,_that.userId,_that.status,_that.image,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String slug,  String title,  String description,  String category,  String categoryLabel,  String? caseStudyNumber,  List<String> techIcons,  List<TechStackItemModel> techStack,  List<ProjectFeatureItemModel> features,  bool isFeatured,  int userId,  String status,  ProjectImageModel? image,  String createdAt,  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
return $default(_that.id,_that.slug,_that.title,_that.description,_that.category,_that.categoryLabel,_that.caseStudyNumber,_that.techIcons,_that.techStack,_that.features,_that.isFeatured,_that.userId,_that.status,_that.image,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectModel extends ProjectModel {
  const _ProjectModel({required this.id, required this.slug, required this.title, required this.description, required this.category, required this.categoryLabel, required this.caseStudyNumber, required final  List<String> techIcons, required final  List<TechStackItemModel> techStack, required final  List<ProjectFeatureItemModel> features, required this.isFeatured, required this.userId, required this.status, required this.image, required this.createdAt, required this.updatedAt}): _techIcons = techIcons,_techStack = techStack,_features = features,super._();
  factory _ProjectModel.fromJson(Map<String, dynamic> json) => _$ProjectModelFromJson(json);

@override final  int id;
@override final  String slug;
@override final  String title;
@override final  String description;
@override final  String category;
@override final  String categoryLabel;
@override final  String? caseStudyNumber;
 final  List<String> _techIcons;
@override List<String> get techIcons {
  if (_techIcons is EqualUnmodifiableListView) return _techIcons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_techIcons);
}

 final  List<TechStackItemModel> _techStack;
@override List<TechStackItemModel> get techStack {
  if (_techStack is EqualUnmodifiableListView) return _techStack;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_techStack);
}

 final  List<ProjectFeatureItemModel> _features;
@override List<ProjectFeatureItemModel> get features {
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_features);
}

@override final  bool isFeatured;
@override final  int userId;
@override final  String status;
@override final  ProjectImageModel? image;
@override final  String createdAt;
@override final  String updatedAt;

/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectModelCopyWith<_ProjectModel> get copyWith => __$ProjectModelCopyWithImpl<_ProjectModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectModel&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.categoryLabel, categoryLabel) || other.categoryLabel == categoryLabel)&&(identical(other.caseStudyNumber, caseStudyNumber) || other.caseStudyNumber == caseStudyNumber)&&const DeepCollectionEquality().equals(other._techIcons, _techIcons)&&const DeepCollectionEquality().equals(other._techStack, _techStack)&&const DeepCollectionEquality().equals(other._features, _features)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.status, status) || other.status == status)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,title,description,category,categoryLabel,caseStudyNumber,const DeepCollectionEquality().hash(_techIcons),const DeepCollectionEquality().hash(_techStack),const DeepCollectionEquality().hash(_features),isFeatured,userId,status,image,createdAt,updatedAt);

@override
String toString() {
  return 'ProjectModel(id: $id, slug: $slug, title: $title, description: $description, category: $category, categoryLabel: $categoryLabel, caseStudyNumber: $caseStudyNumber, techIcons: $techIcons, techStack: $techStack, features: $features, isFeatured: $isFeatured, userId: $userId, status: $status, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ProjectModelCopyWith<$Res> implements $ProjectModelCopyWith<$Res> {
  factory _$ProjectModelCopyWith(_ProjectModel value, $Res Function(_ProjectModel) _then) = __$ProjectModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String slug, String title, String description, String category, String categoryLabel, String? caseStudyNumber, List<String> techIcons, List<TechStackItemModel> techStack, List<ProjectFeatureItemModel> features, bool isFeatured, int userId, String status, ProjectImageModel? image, String createdAt, String updatedAt
});


@override $ProjectImageModelCopyWith<$Res>? get image;

}
/// @nodoc
class __$ProjectModelCopyWithImpl<$Res>
    implements _$ProjectModelCopyWith<$Res> {
  __$ProjectModelCopyWithImpl(this._self, this._then);

  final _ProjectModel _self;
  final $Res Function(_ProjectModel) _then;

/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? title = null,Object? description = null,Object? category = null,Object? categoryLabel = null,Object? caseStudyNumber = freezed,Object? techIcons = null,Object? techStack = null,Object? features = null,Object? isFeatured = null,Object? userId = null,Object? status = null,Object? image = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ProjectModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,categoryLabel: null == categoryLabel ? _self.categoryLabel : categoryLabel // ignore: cast_nullable_to_non_nullable
as String,caseStudyNumber: freezed == caseStudyNumber ? _self.caseStudyNumber : caseStudyNumber // ignore: cast_nullable_to_non_nullable
as String?,techIcons: null == techIcons ? _self._techIcons : techIcons // ignore: cast_nullable_to_non_nullable
as List<String>,techStack: null == techStack ? _self._techStack : techStack // ignore: cast_nullable_to_non_nullable
as List<TechStackItemModel>,features: null == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<ProjectFeatureItemModel>,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as ProjectImageModel?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectImageModelCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $ProjectImageModelCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}
}

// dart format on
