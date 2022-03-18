import 'package:ecommerce_app/model/model.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}
