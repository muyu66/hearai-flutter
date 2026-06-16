import 'package:json_annotation/json_annotation.dart';

part 'report_word_dto.model.g.dart';

@JsonSerializable()
class ReportWordDtoModel {
  final String taskWordId;
  final int failedCount;
  final int thinkingTime;
  final bool master;

  ReportWordDtoModel({
    required this.taskWordId,
    required this.failedCount,
    required this.thinkingTime,
    required this.master,
  });

  factory ReportWordDtoModel.fromJson(Map<String, dynamic> json) =>
      _$ReportWordDtoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportWordDtoModelToJson(this);
}
