import 'package:hearai/features/setting/setting.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_dto.model.g.dart';

@JsonSerializable()
class UserDtoModel {
  final String nickname;
  final int wordLevel;
  final int dailyWordCount;
  final PronType pronType;
  final DateTime createdAt;

  UserDtoModel({
    required this.nickname,
    required this.wordLevel,
    required this.dailyWordCount,
    required this.pronType,
    required this.createdAt,
  });

  factory UserDtoModel.fromJson(Map<String, dynamic> json) =>
      _$UserDtoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoModelToJson(this);
}
