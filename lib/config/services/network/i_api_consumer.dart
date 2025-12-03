import 'package:dio/dio.dart';

abstract class IApiConsumer {
  Future<Response<Map<String, dynamic>>> get({
    required String endPoint,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    bool overrideDefaultHeaders = false,
  });

  Future<Response<Map<String, dynamic>>> post({
    required String endPoint,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    bool overrideDefaultHeaders = false,
  });

  Future<Response<Map<String, dynamic>>> put({
    required String endPoint,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    bool overrideDefaultHeaders = false,
  });

  Future<Response<Map<String, dynamic>>> delete({
    required String endPoint,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    bool overrideDefaultHeaders = false,
  });
}

// ✅ Correct: Use the Abstract Class (Interface)
// final ApiConsumer client;

// ❌ Avoid: Don't use DioConsumer directly here
// final DioConsumer dioConsumer;

// In your Dependency Injection (e.g., main.dart or GetIt)
// Register the Interface to return the Implementation
// sl.registerLazySingleton<ApiConsumer>(() => DioConsumer());


// final response = await _client.post(
//         endPoint: AppEndPoints.register,
//         body: student.toJson(),
//       );
//       final String message = response.data?['message'];

//       if (response.statusCode == 200) {
//         return Right(message);
//       } else {
//         return Left(ApiErrorModel(message: message));
//       }