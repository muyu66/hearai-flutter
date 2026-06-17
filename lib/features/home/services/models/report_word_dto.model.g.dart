// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_word_dto.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportWordDtoModel _$ReportWordDtoModelFromJson(Map<String, dynamic> json) =>
    ReportWordDtoModel(
      taskWordId: json['taskWordId'] as String,
      failedCount: (json['failedCount'] as num).toInt(),
      thinkingTime: (json['thinkingTime'] as num).toInt(),
    );

Map<String, dynamic> _$ReportWordDtoModelToJson(ReportWordDtoModel instance) =>
    <String, dynamic>{
      'taskWordId': instance.taskWordId,
      'failedCount': instance.failedCount,
      'thinkingTime': instance.thinkingTime,
    };
