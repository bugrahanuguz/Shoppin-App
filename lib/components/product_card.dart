import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../constants/constants.dart';
import '../model/product_model.dart';
import '../viewmodel/cart_bloc.dart';

class ProductCardWidget extends StatelessWidget {
  final List<ProductModel?> model;
  final int quantity;
  const ProductCardWidget({super.key, required this.model,  this.quantity=1});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 4 / 7,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: model.length,
        itemBuilder: (BuildContext context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  productImage(context, index),
                  productTitle(index),
                  productRating(index),
                  productPrice(index),
                  addToCartButton(context, index)
                ],
              ),
            ),
          );
        });
  }

  SizedBox addToCartButton(BuildContext context, int index) {
    return SizedBox(
                  height: 20,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(buttonColor)),
                    onPressed: () {
                      final cartBloc = BlocProvider.of<CartBloc>(context);
                      cartBloc.addToCart(model[index]!, quantity);
                    },
                    child: const Text("Add To Cart"),
                  ),
                );
  }

  Text productPrice(int index) {
    return Text(
                  "${model[index]!.price} USD",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                );
  }

  Row productRating(int index) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBarIndicator(
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      rating: model[index]!.rating!.rate!.toDouble(),
                      itemCount: 5,
                      itemSize: 15,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      "(${model[index]!.rating!.count})",
                      style: TextStyle(fontSize: 11, color: textColor),
                    )
                  ],
                );
  }

  Text productTitle(int index) {
    return Text(
                  model[index]!.title.toString(),
                  textAlign: TextAlign.center,
                );
  }

  SizedBox productImage(BuildContext context, int index) {
    return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.13,
                  child: Image.network(
                    model[index]!.image.toString(),
                    fit: BoxFit.fill,
                  ),
                );
  }
}
