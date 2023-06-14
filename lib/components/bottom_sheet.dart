import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/components/cart_items_widget.dart';
import '../constants/constants.dart';
import '../model/cart_item_model.dart';
import '../viewmodel/cart_bloc.dart';
import 'cart_price_checkout_widget.dart';

bottomSheet(BuildContext context) {
  return showModalBottomSheet(
      constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height * 0.8),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      context: context,
      builder: (BuildContext context) {
        return BlocConsumer<CartBloc, List<CartItem>>(
          listener: (context, cartItems) {
            BlocProvider.of<CartBloc>(context);
          },
          builder: (context, cartItems) {
            return Column(
              children: [
                cartScreenTitle(),
                divider(),
                CartItemWidget(cartItems: cartItems),
                divider(),
                const TotalPriceCheckoutWidget()
              ],
            );
          },
        );
      });
}

Padding cartScreenTitle() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      "My Cart",
      style: TextStyle(
          color: textColor, fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}

Divider divider() {
  return const Divider(
    thickness: 1,
    indent: 20,
    endIndent: 20,
  );
}
