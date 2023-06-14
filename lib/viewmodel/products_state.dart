import '../model/product_model.dart';

abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ElectronicsComplete extends ProductsState {
  final List<ProductModel?> model;
  ElectronicsComplete(this.model);
}

class ProductsComplete extends ProductsState {
  final List<ProductModel?> model;
  ProductsComplete(this.model);
}

class JeweleryComplete extends ProductsState {
  final List<ProductModel?> model;
  JeweleryComplete(this.model);
}

class MensClothingComplete extends ProductsState {
  final List<ProductModel?> model;
  MensClothingComplete(this.model);
}

class WomensClothingComplete extends ProductsState {
  final List<ProductModel?> model;
  WomensClothingComplete(this.model);
}
