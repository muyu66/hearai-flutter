import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
// ignore: constant_identifier_names
enum QuestionMode { TRAN_TO_WORD, WORD_TO_TRAN, SOUND_TO_TRAN, SOUND_TO_WORD }
