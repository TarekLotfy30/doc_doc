part of 'sign_in_cubit.dart';

sealed class SignInState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class SignInInitial extends SignInState {
  @override
  List<Object?> get props => [];
}

final class SignInLoading extends SignInState {
  @override
  List<Object?> get props => [];
}

final class SignInSuccess extends SignInState {
  SignInSuccess({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}

final class SignInError extends SignInState {
  SignInError({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
