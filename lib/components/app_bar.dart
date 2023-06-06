import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/viewmodel/products_cubit.dart';

import '../constants/constants.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Shopping e-Mall",
        style: TextStyle(color: textColor),
      ),
      backgroundColor: backgroundColor,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
              height: 150.0,
              width: 30.0,
              child: GestureDetector(
                onTap: () {},
                child: Stack(
                  children: <Widget>[
                    const IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.blueGrey,
                      ),
                      onPressed: null,
                    ),
                    context.watch<ProductsCubit>().cartList.isEmpty
                        ? Container()
                        : Positioned(
                            child: Stack(
                            children: <Widget>[
                              Icon(Icons.brightness_1,
                                  size: 20.0,
                                  color: Color.fromARGB(255, 255, 138, 138)),
                              Positioned(
                                  top: 3.0,
                                  right: 6.0,
                                  child: Center(
                                    child: Text(
                                      context
                                          .watch<ProductsCubit>()
                                          .cartList
                                          .length
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                            ],
                          )),
                  ],
                ),
              )),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
