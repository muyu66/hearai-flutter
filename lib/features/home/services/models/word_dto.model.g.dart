// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_dto.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordDtoModel _$WordDtoModelFromJson(Map<String, dynamic> json) => WordDtoModel(
  id: json['id'] as String,
  taskId: json['taskId'] as String,
  questionMode: $enumDecode(_$QuestionModeEnumMap, json['questionMode']),
  question: json['question'] as String,
  pronunciationUrl: json['pronunciationUrl'] as String?,
  answers: (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
  correctAnswerIndex: (json['correctAnswerIndex'] as num).toInt(),
);

Map<String, dynamic> _$WordDtoModelToJson(WordDtoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taskId': instance.taskId,
      'questionMode': _$QuestionModeEnumMap[instance.questionMode]!,
      'question': instance.question,
      'pronunciationUrl': instance.pronunciationUrl,
      'answers': instance.answers,
      'correctAnswerIndex': instance.correctAnswerIndex,
    };

const _$QuestionModeEnumMap = {
  QuestionMode.WORD_TO_TRAN: 'WORD_TO_TRAN',
  QuestionMode.WORD_TO_SOUND: 'WORD_TO_SOUND',
  QuestionMode.SOUND_TO_TRAN: 'SOUND_TO_TRAN',
  QuestionMode.TRAN_TO_WORD: 'TRAN_TO_WORD',
};
