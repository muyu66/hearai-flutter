import 'package:json_annotation/json_annotation.dart';

part 'next_task_time_dto.model.g.dart';

@JsonSerializable()
class NextTaskTimeDtoModel {
  final int hours;
  final bool tomorrow;

  NextTaskTimeDtoModel({required this.hours, required this.tomorrow});

  factory NextTaskTimeDtoModel.fromJson(Map<String, dynamic> json) =>
      _$NextTaskTimeDtoModelFromJson(json);

  Map<String, dynamic> toJson() => _$NextTaskTimeDtoModelToJson(this);
}
