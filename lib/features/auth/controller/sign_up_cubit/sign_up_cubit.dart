import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/sign_in/sign_up_request_model.dart';
import '../../data/repo/sign_up/i_sign_up_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._signUpRepo) : super(SignUpInitial());

  final ISignUpRepo _signUpRepo;

  Future<void> signUp(SignUpRequestModel model) async {
    emit(SignUpLoading());
    final result = await _signUpRepo.signUp(model);
    result.fold(
      (failure) => emit(SignUpError(message: failure.errorMessage)),
      (signUpResponseModel) =>
          emit(SignUpSuccess(message: signUpResponseModel.message!)),
    );
  }
}
