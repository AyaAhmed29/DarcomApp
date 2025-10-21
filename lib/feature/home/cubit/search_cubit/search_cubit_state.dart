import 'package:darcom_app/feature/home/data/model/product_model.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<ProductModel> products;
  SearchLoaded(this.products);
}

class SearchFailure extends SearchState {
  final String error;
  SearchFailure(this.error);
}
