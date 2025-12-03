// ═══════════════════════════════════════════════════════════════
// BASE FAILURE CLASS
// ═══════════════════════════════════════════════════════════════

/// Base abstract class for all application failures
///
/// This class provides a foundation for all error types in the application,
/// ensuring consistent error handling and providing a common interface
/// for error messages across the entire codebase.
abstract class Failure implements Exception {
  /// Creates a new failure instance with the specified error message.
  const Failure(this.errorMessage, this.errorCode);

  /// The error message associated with this failure
  final String errorMessage;
  final int errorCode;

  /// Returns the error message as a string representation
  @override
  String toString() => errorMessage;
}

// abstract class ProductRepository {
//   Future<Either<Failure, List<Product>>> getProducts();

//   Future<Either<Failure, Product>> getProductById(String id);

//   Future<Either<Failure, void>> addProduct(Product product);

//   Future<Either<Failure, List<Product>>> getProductsFromFirestore();
// }


  // @override
  // Future<Either<Failure, List<Product>>> getProducts() async {
  //   try {
  //     // Make API call
  //     final response = await dio.get('/products');

  //     // Parse response
  //     final List<dynamic> data = response.data['products'] as List<dynamic>;
  //     final products = data
  //         .map((json) => Product.fromJson(json as Map<String, dynamic>))
  //         .toList();

  //     return Right(products);
  //   } on DioException catch (e) {
  //     return Left(ServerFailure.fromDioError(e));
  //   } catch (e) {
  //     return Left(ServerFailure('Unexpected error: ${e.toString()}'));
  //   }
  // }


  // @override
  // Future<Either<Failure, void>> addProduct(Product product) async {
  //   try {
  //     await firestore.collection('products').doc(product.id).set(
  //           product.toJson(),
  //         );
  //     return const Right(null);
  //   } on FirebaseException catch (e) {
  //     return Left(FirestoreFailure.fromFirestoreException(e));
  //   } catch (e) {
  //     return Left(FirestoreFailure('Unexpected error: ${e.toString()}'));
  //   }
  // }
