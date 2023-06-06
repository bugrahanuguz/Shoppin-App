import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_shopping_app/model/product_model.dart';

import 'IService.dart';

class ProductService extends IService {
  ProductService(Dio dio) : super(dio);

  @override
  Future<List<ProductModel?>> getElectronics() async {
    final response = await dio.get(electroniesPath);
    List<dynamic> productMaps = response.data;
    if (response.statusCode == HttpStatus.ok) {
      return productMaps
          .map((productMap) => ProductModel.fromJson(productMap))
          .toList();
    } else {
      return [];
    }
  }
  
  @override
  Future<List<ProductModel?>> getJewelery() async {
    final response = await dio.get(jeweleryPath);
    List<dynamic> productMaps = response.data;
    if (response.statusCode == HttpStatus.ok) {
      return productMaps
          .map((productMap) => ProductModel.fromJson(productMap))
          .toList();
    } else {
      return [];
    }
  }
  
  @override
  Future<List<ProductModel?>> getMensClothing() async {
    final response = await dio.get(mensPath);
    List<dynamic> productMaps = response.data;
    if (response.statusCode == HttpStatus.ok) {
      return productMaps
          .map((productMap) => ProductModel.fromJson(productMap))
          .toList();
    } else {
      return [];
    }
  }
  
  @override
  Future<List<ProductModel?>> getWomensClothing() async {
    final response = await dio.get(womensPath);
    List<dynamic> productMaps = response.data;
    if (response.statusCode == HttpStatus.ok) {
      return productMaps
          .map((productMap) => ProductModel.fromJson(productMap))
          .toList();
    } else {
      return [];
    }
  }
  
  @override
  Future<List<ProductModel?>> getProducts() async {
    final response = await dio.get(productsPath);
    List<dynamic> productMaps = response.data;
    if (response.statusCode == HttpStatus.ok) {
      return productMaps
          .map((productMap) => ProductModel.fromJson(productMap))
          .toList();
    } else {
      return [];
    }
  }
}
