import 'package:json_annotation/json_annotation.dart';

part 'sign_up_wechat_dto.model.g.dart';

@JsonSerializable()
class SignUpWechatDtoModel {
  final String code;

  SignUpWechatDtoModel({required this.code});

  factory SignUpWechatDtoModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpWechatDtoModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpWechatDtoModelToJson(this);
}
