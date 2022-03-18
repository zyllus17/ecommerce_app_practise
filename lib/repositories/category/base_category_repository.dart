import 'package:ecommerce_app/model/model.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getAllCategories();
}
