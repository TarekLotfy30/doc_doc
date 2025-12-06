// ignore_for_file: must_be_immutable

import '../../../../../core/models/base_model.dart';

class SignUpResponseModel extends BaseModel<SignUpResponseModel> {
  SignUpResponseModel({this.message, this.data, this.status, this.code});

  String? message;
  Data? data;
  bool? status;
  int? code;

  @override
  SignUpResponseModel fromJson(Map<String, dynamic> json) =>
      SignUpResponseModel(
        message: json['message'],
        data: json['data'] is Map<String, dynamic>
            ? Data().fromJson(json['data'])
            : null,
        status: json['status'],
        code: json['code'],
      );

  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() => {
    'message': message,
    'data': data?.toJson() ?? {},
    'status': status,
    'code': code,
  };
}

class Data extends BaseModel<Data> {
  Data({this.token, this.username});

  String? token;
  String? username;

  @override
  Data fromJson(Map<String, dynamic> json) =>
      Data(token: json['token'], username: json['username']);

  @override
  Map<String, dynamic> toJson() => {'token': token, 'username': username};

  @override
  List<Object?> get props => [token, username];
}
