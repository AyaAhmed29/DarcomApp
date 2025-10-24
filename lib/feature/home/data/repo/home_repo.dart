import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darcom_app/feature/home/data/model/category_model.dart';
import 'package:darcom_app/feature/home/data/model/product_model.dart';
import 'package:darcom_app/feature/home/data/model/slider_model.dart';
import 'package:dartz/dartz.dart';

class HomeRepo {
  final _refCategories = FirebaseFirestore.instance.collection('categories');
  final _refSlider = FirebaseFirestore.instance.collection('slider');
  final _refProducts = FirebaseFirestore.instance.collection('products');
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

  Future<Either<String, List<ProductModel>>> getProducts() async {
    try {
      final snapshot = await _refProducts.get();
      final products = snapshot.docs.map((doc) {
        final data = doc.data();
        return ProductModel.fromJson({'id': doc.id, ...data});
      }).toList();

      if (products.isEmpty) {
        return const Left('No roduct found');
      }

      return Right(products);
    } on FirebaseException catch (e) {
      return Left('Firebase error: ${e.message}');
    } catch (e) {
      return Left('Unknown error: $e');
    }
  }

  Future<Either<String, List<ProductModel>>> searchProducts(
    String query,
  ) async {
    try {
      final snapshot = await _refProducts.get();
      final products = snapshot.docs
          .map((doc) {
            final data = doc.data();
            return ProductModel.fromJson({'id': doc.id, ...data});
          })
          .where((product) {
            final name = product.name.toLowerCase();
            final search = query.toLowerCase();
            return name.contains(search);
          })
          .toList();

      if (products.isEmpty) {
        return const Left('No products found');
      }

      return Right(products);
    } on FirebaseException catch (e) {
      return Left('Firebase error: ${e.message}');
    } catch (e) {
      return Left('Unknown error: $e');
    }
  }

  static Future<Either<String, void>> saveSearchQuery(
    String query,
    String? userId,
  ) async {
    try {
      if (query.trim().isEmpty) return const Left('Query is empty');

      await FirebaseFirestore.instance.collection('search_history').add({
        'query': query.trim(),
        'userId': userId ?? 'guest',
        'timestamp': FieldValue.serverTimestamp(),
      });

      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
