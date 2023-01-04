import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable(genericArgumentFactories: true, includeIfNull: false, explicitToJson: true)
class ErrorModel<TModel> {
  int? code;
  bool? status;
  bool? success;
  String? message;
  TModel? body;

  ErrorModel({this.code, this.success,this.status, this.message, this.body});

  factory ErrorModel.fromJson(Map<String, dynamic> json, TModel Function(Object? json) fromJsonT,) => _$ErrorModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(TModel value) toJsonT) => _$ErrorModelToJson(this, toJsonT);
}
