import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/model/product_model.dart';
import 'package:flutter_shopping_app/service/IService.dart';
import 'package:flutter_shopping_app/viewmodel/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final IService service;
  final TabController tabController;

  ProductsCubit(this.tabController, {required this.service})
      : super(ProductsInitial()) {
    getProducts();
  }

  Future<void> checkTabIndex(
      TabController tabController, BuildContext context) {
    if (tabController.index == 0) {
      return getProducts();
    } else if (tabController.index == 1) {
      return getElectronics();
    } else if (tabController.index == 2) {
      return getJewelery();
    } else if (tabController.index == 3) {
      return getMensClothing();
    } else {
      return getWomensClothing();
    }
  }

  Future<void> getProducts() async {
    final data = await service.getProducts();
    if (data is List<ProductModel>) {
      emit(ProductsComplete(data));
    }
  }

  Future<void> getElectronics() async {
    final data = await service.getElectronics();
    if (data is List<ProductModel>) {
      emit(ElectronicsComplete(data));
    }
  }

  Future<void> getJewelery() async {
    final data = await service.getJewelery();
    if (data is List<ProductModel>) {
      emit(JeweleryComplete(data));
    }
  }

  Future<void> getMensClothing() async {
    final data = await service.getMensClothing();
    if (data is List<ProductModel>) {
      emit(MensClothingComplete(data));
    }
  }

  Future<void> getWomensClothing() async {
    final data = await service.getWomensClothing();
    if (data is List<ProductModel>) {
      emit(WomensClothingComplete(data));
    }
  }
}
