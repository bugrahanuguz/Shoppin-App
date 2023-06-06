import 'package:flutter/material.dart';

import '../constants/constants.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
          child: Text(
        "Shopping e-Mall",
        style: TextStyle(color: textColor),
      )),
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
                        color: Color.fromARGB(255, 80, 79, 79),
                      ),
                      onPressed: null,
                    ),
                    1 == 0
                        ? Container()
                        : const Positioned(
                            child: Stack(
                            children: <Widget>[
                              Icon(Icons.brightness_1,
                                  size: 20.0, color: Colors.orange),
                              Positioned(
                                  top: 3.0,
                                  right: 6.0,
                                  child: Center(
                                    child: Text(
                                      "2",
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
