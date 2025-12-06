import 'package:dartz/dartz.dart';

import '../../../../../config/errors/failures/failure.dart';
import '../../models/sign_up/sign_in_request_model.dart';
import '../../models/sign_up/sign_in_response_model.dart';

abstract class ISignInRepo {
  Future<Either<Failure, SignInResponseModel>> signIn(SignInRequestModel model);
}
