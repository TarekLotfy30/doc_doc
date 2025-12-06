import '../../../../../core/models/base_model.dart';

class SignInRequestModel extends BaseModel<SignInRequestModel> {
  SignInRequestModel({required this.email, required this.password});

  final String email;
  final String password;

  @override
  SignInRequestModel fromJson(Map<String, dynamic> json) {
    return SignInRequestModel(email: json['email'], password: json['password']);
  }

  @override
  Map<String, dynamic> toJson() => {'email': email, 'password': password};

  @override
  List<Object?> get props => [email, password];
}
