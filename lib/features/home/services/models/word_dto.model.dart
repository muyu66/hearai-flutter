import 'package:hearai/features/home/home.dart';
import 'package:json_annotation/json_annotation.dart';

part 'word_dto.model.g.dart';

@JsonSerializable()
class WordDtoModel {
  final String id;
  final String taskId;
  final QuestionMode questionMode;
  final String question;
  final String? ukPronunciation;
  final String? usPronunciation;
  final List<String> answers;
  final int correctAnswerIndex;

  WordDtoModel({
    required this.id,
    required this.taskId,
    required this.questionMode,
    required this.question,
    this.ukPronunciation,
    this.usPronunciation,
    required this.answers,
    required this.correctAnswerIndex,
  });

  factory WordDtoModel.fromJson(Map<String, dynamic> json) =>
      _$WordDtoModelFromJson(json);

  Map<String, dynamic> toJson() => _$WordDtoModelToJson(this);
}
