import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/model/product_model.dart';

import '../model/cart_item_model.dart';

class CartBloc extends Cubit<List<CartItem>> {
  CartBloc() : super([]);

  void addToCart(ProductModel product, int quantity) {
    final existingItemIndex = state.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingItemIndex != -1) {
      final updatedItems = List<CartItem>.from(state);
      updatedItems[existingItemIndex].quantity += quantity;
      emit(updatedItems);
    } else {
      emit([
        ...state,
        CartItem(product: product, quantity: quantity),
      ]);
    }
  }

  void removeFromCart(ProductModel product) {
    final updatedItems = List<CartItem>.from(state);
    updatedItems.removeWhere((item) => item.product.id == product.id);
    emit(updatedItems);
  }

  void decreaseQuantity(ProductModel product) {
    final existingItemIndex = state.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingItemIndex != -1) {
      final updatedItems = List<CartItem>.from(state);
      if (updatedItems[existingItemIndex].quantity > 1) {
        updatedItems[existingItemIndex].quantity--;
      } else {
        updatedItems.removeAt(existingItemIndex);
      }
      emit(updatedItems);
    }
  }

  void increaseQuantity(ProductModel product) {
    final existingItemIndex = state.indexWhere(
      (item) => item.product.id == product.id,
    );
    if (existingItemIndex != -1) {
      final updatedItems = List<CartItem>.from(state);
      updatedItems[existingItemIndex].quantity++;
      emit(updatedItems);
    }
  }

  String calculateTotalPrice() {
    double totalPrice = 0;
    state.forEach((item) {
      totalPrice += item.product.price! * item.quantity;
    });
    return totalPrice.toStringAsFixed(2);
  }

  String calculateProductPrice(num price, int quantity) {
    num totalPrice = price * quantity;
    return totalPrice.toStringAsFixed(2);
  }
}
