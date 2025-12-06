import 'package:dartz/dartz.dart';

import '../../../../config/errors/failures/failure.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';

abstract class ISignInRepo {
  Future<Either<Failure, LoginResponseModel>> signIn(LoginRequestModel model);
}
