import 'package:dartz/dartz.dart';

import '../../../../../config/errors/failures/failure.dart';
import '../../models/sign_in/sign_up_request_model.dart';
import '../../models/sign_in/sign_up_response_model.dart';

abstract class ISignUpRepo {
  Future<Either<Failure, SignUpResponseModel>> signUp(SignUpRequestModel model);
}
