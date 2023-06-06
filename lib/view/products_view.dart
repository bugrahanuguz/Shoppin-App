import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/viewmodel/products_cubit.dart';
import '../components/app_bar.dart';
import '../components/product_card.dart';
import '../constants/constants.dart';
import '../viewmodel/products_state.dart';

class ProductsView extends StatelessWidget {
  final TabController tabController;
  final List<String> categoryList;
  const ProductsView(
      {super.key, required this.tabController, required this.categoryList});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        BlocProvider.of<ProductsCubit>(context)
            .checkTabIndex(tabController, context);
      },
      builder: (context, state) {
        return Scaffold(
          appBar: const AppBarWidget(),
          body: DefaultTabController(
            length: categoryList.length,
            child: Column(
              children: [
                Container(
                  height: 60,
                  color: Colors.white,
                  child: TabBar(
                    controller: tabController,
                    isScrollable: true,
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 10),
                    unselectedLabelColor: textColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blueGrey),
                    tabs: [
                      buildTab(categoryList[0]),
                      buildTab(categoryList[1]),
                      buildTab(categoryList[2]),
                      buildTab(categoryList[3]),
                      buildTab(categoryList[4]),
                    ],
                  ),
                ),
                builTabBarView(tabController, state, context)
              ],
            ),
          ),
        );
      },
    );
  }
}

Expanded builTabBarView(
    TabController tabController, ProductsState state, BuildContext context) {
  return Expanded(
    child: TabBarView(
      controller: tabController,
      children: [
        state is ProductsComplete
            ? ProductCardWidget(model: state.model)
            : const Center(
                child: CircularProgressIndicator(),
              ),
        state is ElectronicsComplete
            ? ProductCardWidget(model: state.model)
            : const Center(
                child: CircularProgressIndicator(),
              ),
        state is JeweleryComplete
            ? ProductCardWidget(model: state.model)
            : const Center(
                child: CircularProgressIndicator(),
              ),
        state is MensClothingComplete
            ? ProductCardWidget(model: state.model)
            : const Center(
                child: CircularProgressIndicator(),
              ),
        state is WomensClothingComplete
            ? ProductCardWidget(model: state.model)
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ],
    ),
  );
}

Tab buildTab(String label) {
  return Tab(
    child: Container(
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(label),
      ),
    ),
  );
}
