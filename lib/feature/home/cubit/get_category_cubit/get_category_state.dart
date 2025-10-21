
import 'package:darcom_app/feature/home/data/model/category_model.dart';

sealed class GetCategoryState {}

final class GetCategoryInitial extends GetCategoryState {}


final class GetCategoryLoading extends GetCategoryState {}

final class GetCategorysSuccess extends GetCategoryState {
  final List<CategoryModel> categorys;

  GetCategorysSuccess(this.categorys);
}



final class GetCategoryFailure extends GetCategoryState {
  final String errorMessage;

  GetCategoryFailure(this.errorMessage);
}
