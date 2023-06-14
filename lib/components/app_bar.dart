import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/model/cart_item_model.dart';
import '../constants/constants.dart';
import '../viewmodel/cart_bloc.dart';
import 'bottom_sheet.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: appBarTitle(),
      backgroundColor: backgroundColor,
      actions: <Widget>[cartButton()],
    );
  }

  Text appBarTitle() {
    return Text(
      "Shopping e-Mall",
      style: TextStyle(color: textColor),
    );
  }

  Padding cartButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
          height: 150.0,
          width: 30.0,
          child: BlocBuilder<CartBloc, List<CartItem>>(
            builder: (context, cartItems) {
              return Stack(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.blueGrey,
                    ),
                    onPressed: () {
                      bottomSheet(context);
                    },
                  ),
                  cartItems.isEmpty
                      ? Container()
                      : Stack(
                          children: <Widget>[
                            const Icon(Icons.brightness_1,
                                size: 20.0,
                                color: Color.fromARGB(255, 255, 138, 138)),
                            Positioned(
                                top: 3.0,
                                right: 6.0,
                                child: Center(
                                  child: Text(
                                    cartItems.length.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )),
                          ],
                        ),
                ],
              );
            },
          )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
