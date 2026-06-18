// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_info.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInfoModel _$SignInfoModelFromJson(Map<String, dynamic> json) =>
    SignInfoModel(
      accessToken: json['accessToken'] as String,
      newUser: json['newUser'] as bool,
    );

Map<String, dynamic> _$SignInfoModelToJson(SignInfoModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'newUser': instance.newUser,
    };
