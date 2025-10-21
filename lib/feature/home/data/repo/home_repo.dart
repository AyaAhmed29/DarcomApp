import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darcom_app/feature/home/data/model/category_model.dart';
import 'package:darcom_app/feature/home/data/model/slider_model.dart';
import 'package:dartz/dartz.dart';

class HomeRepo {
  final _refCategories = FirebaseFirestore.instance.collection('categories');
  final _refSlider = FirebaseFirestore.instance.collection('slider');

  Future<Either<String, List<CategoryModel>>> getCategories() async {
    try {
      final snapshot = await _refCategories.get();
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

  Future<Either<String, List<SliderModel>>> getSlider() async {
    try {
      final snapshot = await _refSlider.get();
      final categories = snapshot.docs.map((doc) {
        final data = doc.data();
        return SliderModel.fromJson({'id': doc.id, ...data});
      }).toList();

      if (categories.isEmpty) {
        return const Left('No Slider found');
      }

      return Right(categories);
    } on FirebaseException catch (e) {
      return Left('Firebase error: ${e.message}');
    } catch (e) {
      return Left('Unknown error: $e');
    }
  }
}
