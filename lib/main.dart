import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/service/product_service.dart';

import 'package:flutter_shopping_app/view/products_view.dart';
import 'package:flutter_shopping_app/viewmodel/cart_bloc.dart';
import 'package:flutter_shopping_app/viewmodel/products_cubit.dart';

import 'constants/constants.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController =
        TabController(length: categoryList.length, vsync: this);

    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductsCubit>(
              create: (BuildContext context) => ProductsCubit(
                tabController,
                service: ProductService(Dio(BaseOptions(baseUrl: baseUrl))),
              ),
            ),
            BlocProvider<CartBloc>(
              create: (BuildContext context) => CartBloc(),
            ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductsView(
          tabController: tabController,
          categoryList: categoryList,
        ),
      ),
    );
  }
}
