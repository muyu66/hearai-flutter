import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
// ignore: constant_identifier_names
enum QuestionMode { WORD_TO_SOUND, SOUND_TO_TRAN, TRAN_TO_WORD }
