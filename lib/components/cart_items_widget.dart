import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/cart_item_model.dart';
import '../viewmodel/cart_bloc.dart';

class CartItemWidget extends StatelessWidget {
  final List<CartItem> cartItems;
  const CartItemWidget({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<CartBloc>(context);
    return Expanded(
      child: ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: ((context, index) {
            final cartItem = cartItems[index];
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: Card(
                elevation: 15,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                margin: const EdgeInsets.all(6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    cartImage(context, cartItem),
                    cartTitle(context, cartItem),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        removeCart(cartBloc, cartItem),
                        changeQuantity(cartBloc, cartItem),
                        cartItemPrice(cartBloc, cartItem),
                      ],
                    )
                  ],
                ),
              ),
            );
          })),
    );
  }

  Text cartItemPrice(CartBloc cartBloc, CartItem cartItem) {
    return Text(
      "${cartBloc.calculateProductPrice(cartItem.product.price!, cartItem.quantity)} USD",
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  GestureDetector removeCart(CartBloc cartBloc, CartItem cartItem) {
    return GestureDetector(
        onTap: () {
          cartBloc.removeFromCart(cartItem.product);
        },
        child: const Icon(
          Icons.delete_outline,
          color: Colors.black,
          size: 20,
        ));
  }

  SizedBox cartTitle(BuildContext context, CartItem cartItem) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Text(
        cartItem.product.title!,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }

  SizedBox cartImage(BuildContext context, CartItem cartItem) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.14,
      child: Image.network(
        cartItem.product.image!,
        fit: BoxFit.contain,
      ),
    );
  }

  Row changeQuantity(CartBloc cartBloc, CartItem cartItem) {
    return Row(
      children: [
        GestureDetector(
            onTap: () {
              cartBloc.decreaseQuantity(cartItem.product);
            },
            child: const Icon(
              Icons.remove_circle_outline,
              color: Colors.black,
              size: 20,
            )),
        Text(
          cartItem.quantity.toString(),
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
        GestureDetector(
            onTap: () {
              cartBloc.increaseQuantity(cartItem.product);
            },
            child: const Icon(
              Icons.add_circle_outline,
              color: Colors.black,
              size: 20,
            ))
      ],
    );
  }
}
