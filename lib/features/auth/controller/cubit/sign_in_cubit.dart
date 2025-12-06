import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/login_request_model.dart';
import '../../data/repo/i_sign_in_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this._signInRepo) : super(SignInInitial());
  final ISignInRepo _signInRepo;


  Future<void> signIn(LoginRequestModel model) async {
    emit(SignInLoading());
    final result = await _signInRepo.signIn(model);
    result.fold(
      (failure) => emit(SignInError(message: failure.errorMessage)),
      (loginResponseModel) =>
          emit(SignInSuccess(message: loginResponseModel.message!)),
    );
  }
}
