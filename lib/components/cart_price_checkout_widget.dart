import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/constants.dart';
import '../viewmodel/cart_bloc.dart';

class TotalPriceCheckoutWidget extends StatelessWidget {
  const TotalPriceCheckoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final totalPrice =
                context.select((CartBloc bloc) => bloc.calculateTotalPrice());
    return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "TOTAL",
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 14),
                          ),
                          Text(
                            "$totalPrice USD",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: buttonColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Checkout",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Icon(Icons.keyboard_arrow_right)
                              ],
                            )),
                      )
                    ],
                  ),
                );
  }
}