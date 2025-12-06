part of 'sign_up_cubit.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  const SignUpSuccess({required this.message});
  final String message;
}

final class SignUpError extends SignUpState {
  const SignUpError({required this.message});
  final String message;
}
