// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorModel<TModel> _$ErrorModelFromJson<TModel>(
  Map<String, dynamic> json,
  TModel Function(Object? json) fromJsonTModel,
) =>
    ErrorModel<TModel>(
      code: json['code'] as int?,
      status: json['status'] as bool?,
      message: json['message'] as String?,
      body: _$nullableGenericFromJson(json['body'], fromJsonTModel),
    );

Map<String, dynamic> _$ErrorModelToJson<TModel>(
  ErrorModel<TModel> instance,
  Object? Function(TModel value) toJsonTModel,
) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('status', instance.status);
  writeNotNull('message', instance.message);
  writeNotNull('body', _$nullableGenericToJson(instance.body, toJsonTModel));
  return val;
}

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
