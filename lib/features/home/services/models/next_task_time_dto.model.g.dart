// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'next_task_time_dto.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NextTaskTimeDtoModel _$NextTaskTimeDtoModelFromJson(
  Map<String, dynamic> json,
) => NextTaskTimeDtoModel(
  hours: (json['hours'] as num).toInt(),
  tomorrow: json['tomorrow'] as bool,
);

Map<String, dynamic> _$NextTaskTimeDtoModelToJson(
  NextTaskTimeDtoModel instance,
) => <String, dynamic>{'hours': instance.hours, 'tomorrow': instance.tomorrow};
