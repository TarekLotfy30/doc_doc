import '../../../../../core/models/base_model.dart';

class SignUpRequestModel extends BaseModel<SignUpRequestModel> {
  SignUpRequestModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.password,
    required this.confirmPassword,
  });

  final String name;
  final String email;
  final String phoneNumber;
  final int gender;
  final String password;
  final String confirmPassword;

  @override
  SignUpRequestModel fromJson(Map<String, dynamic> json) {
    return SignUpRequestModel(
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phone'],
      gender: json['gender'],
      password: json['password'],
      confirmPassword: json['password_confirmation'],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'phone': phoneNumber,
    'gender': gender,
    'password': password,
    'password_confirmation': confirmPassword,
  };

  @override
  List<Object?> get props => [
    name,
    email,
    phoneNumber,
    gender,
    password,
    confirmPassword,
  ];
}
