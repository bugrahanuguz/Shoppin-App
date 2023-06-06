import 'package:dio/dio.dart';
import 'package:flutter_shopping_app/model/product_model.dart';

abstract class IService {
  final Dio dio;

  IService(this.dio);

  final String electroniesPath = ILoginServicePath.ELECTRONIES.rawValue;
  final String jeweleryPath = ILoginServicePath.JEWELERY.rawValue;
  final String mensPath = ILoginServicePath.MENSCLOTHING.rawValue;
  final String womensPath = ILoginServicePath.WOMENSCLOTHING.rawValue;
  final String productsPath = ILoginServicePath.PRODUCTS.rawValue;

  Future<List<ProductModel?>> getElectronics();
  Future<List<ProductModel?>> getProducts();
  Future<List<ProductModel?>> getJewelery();
  Future<List<ProductModel?>> getMensClothing();
  Future<List<ProductModel?>> getWomensClothing();
}

enum ILoginServicePath {
  PRODUCTS,
  ELECTRONIES,
  JEWELERY,
  MENSCLOTHING,
  WOMENSCLOTHING
}

extension ILoginServicePathExtension on ILoginServicePath {
  String get rawValue {
    switch (this) {
      case ILoginServicePath.PRODUCTS:
        return '/products';
      case ILoginServicePath.ELECTRONIES:
        return '/products/category/electronics';
      case ILoginServicePath.JEWELERY:
        return '/products/category/jewelery';
      case ILoginServicePath.MENSCLOTHING:
        return "/products/category/men's clothing";
      case ILoginServicePath.WOMENSCLOTHING:
        return "/products/category/women's clothing";
    }
  }
}
