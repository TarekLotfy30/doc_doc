import '../../../../core/models/base_model.dart';

class LoginRequestModel extends BaseModel<LoginRequestModel> {
  LoginRequestModel({required this.email, required this.password});

  final String email;
  final String password;

  @override
  LoginRequestModel fromJson(Map<String, dynamic> json) {
    return LoginRequestModel(email: json['email'], password: json['password']);
  }

  @override
  Map<String, dynamic> toJson() => {'email': email, 'password': password};

  @override
  List<Object?> get props => [email, password];
}
