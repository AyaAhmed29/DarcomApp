import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darcom_app/feature/home/data/model/category_model.dart';
import 'package:dartz/dartz.dart';

class HomeRepo {
  final _ref = FirebaseFirestore.instance.collection('categories');

  Future<Either<String, List<CategoryModel>>> getCategories() async {
    try {
      final snapshot = await _ref.get();
      final categories = snapshot.docs.map((doc) {
        final data = doc.data();
        return CategoryModel.fromJson({'id': doc.id, ...data});
      }).toList();

      if (categories.isEmpty) {
        return const Left('No categories found');
      }

      return Right(categories);
    } on FirebaseException catch (e) {
      return Left('Firebase error: ${e.message}');
    } catch (e) {
      return Left('Unknown error: $e');
    }
  }
}
