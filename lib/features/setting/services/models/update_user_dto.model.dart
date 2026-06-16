import 'package:hearai/features/setting/setting.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_user_dto.model.g.dart';

@JsonSerializable()
class UpdateUserDtoModel {
  final int? wordLevel;
  final int? dailyWordCount;
  final PronType? pronType;

  const UpdateUserDtoModel({
    this.wordLevel,
    this.dailyWordCount,
    this.pronType,
  });

  factory UpdateUserDtoModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserDtoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserDtoModelToJson(this);
}
