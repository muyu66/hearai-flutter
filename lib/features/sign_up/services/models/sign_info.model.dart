import 'package:json_annotation/json_annotation.dart';

part 'sign_info.model.g.dart';

@JsonSerializable()
class SignInfoModel {
  final String accessToken;
  final bool newUser;

  SignInfoModel({required this.accessToken, required this.newUser});

  factory SignInfoModel.fromJson(Map<String, dynamic> json) =>
      _$SignInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignInfoModelToJson(this);
}
