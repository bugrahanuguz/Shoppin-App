import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../model/product_model.dart';

class ProductCardWidget extends StatelessWidget {
  final List<ProductModel?> model;
  const ProductCardWidget({super.key, required this.model});

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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.13,
                    child: Image.network(
                      model[index]!.image.toString(),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    model[index]!.title.toString(),
                    textAlign: TextAlign.center,
                  ),
                  RatingBarIndicator(
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    rating: model[index]!.rating!.rate!.toDouble(),
                    itemCount: 5,
                    itemSize: 15,
                  ),
                  Text(
                    "${model[index]!.price} USD",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Add To Cart"),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
