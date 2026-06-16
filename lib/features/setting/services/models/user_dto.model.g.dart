// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDtoModel _$UserDtoModelFromJson(Map<String, dynamic> json) => UserDtoModel(
  nickname: json['nickname'] as String,
  wordLevel: (json['wordLevel'] as num).toInt(),
  dailyWordCount: (json['dailyWordCount'] as num).toInt(),
  pronType: $enumDecode(_$PronTypeEnumMap, json['pronType']),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$UserDtoModelToJson(UserDtoModel instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'wordLevel': instance.wordLevel,
      'dailyWordCount': instance.dailyWordCount,
      'pronType': _$PronTypeEnumMap[instance.pronType]!,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$PronTypeEnumMap = {PronType.US: 'US', PronType.UK: 'UK'};
