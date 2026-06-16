// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_dto.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserDtoModel _$UpdateUserDtoModelFromJson(Map<String, dynamic> json) =>
    UpdateUserDtoModel(
      wordLevel: (json['wordLevel'] as num?)?.toInt(),
      dailyWordCount: (json['dailyWordCount'] as num?)?.toInt(),
      pronType: $enumDecodeNullable(_$PronTypeEnumMap, json['pronType']),
    );

Map<String, dynamic> _$UpdateUserDtoModelToJson(UpdateUserDtoModel instance) =>
    <String, dynamic>{
      'wordLevel': instance.wordLevel,
      'dailyWordCount': instance.dailyWordCount,
      'pronType': _$PronTypeEnumMap[instance.pronType],
    };

const _$PronTypeEnumMap = {PronType.US: 'US', PronType.UK: 'UK'};
