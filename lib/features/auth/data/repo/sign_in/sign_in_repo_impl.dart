import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../config/errors/failures/failure.dart';
import '../../../../../config/errors/failures/server_failure.dart';
import '../../../../../config/services/network/api_config.dart';
import '../../../../../config/services/network/i_api_consumer.dart';
import '../../models/sign_up/sign_in_request_model.dart';
import '../../models/sign_up/sign_in_response_model.dart';
import 'i_sign_in_repo.dart';

class SignInRepoImpl implements ISignInRepo {
  const SignInRepoImpl(this._client);

  final IApiConsumer _client;

  @override
  Future<Either<Failure, SignInResponseModel>> signIn(
    SignInRequestModel model,
  ) async {
    try {
      final response = await _client.post(
        endPoint: ApiConfig.signIn,
        body: model.toJson(),
      );

      final SignInResponseModel responseModel = SignInResponseModel().fromJson(
        response.data as Map<String, dynamic>,
      );

      if (responseModel.code != 200 && responseModel.data == null) {
        return Left(ServerFailure(responseModel.message!, responseModel.code!));
      }

      return Right(responseModel);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      rethrow;
    }
  }
}
