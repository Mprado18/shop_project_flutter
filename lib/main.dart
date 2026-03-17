import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/presentation/product_detail_view.dart';
import 'package:shop/presentation/products_overview_view.dart';
import 'package:shop/providers/product_list_provider.dart';
import 'package:shop/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductListProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: .fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.light,
          ),
          fontFamily: 'Lato',
          appBarTheme: AppBarTheme(
            backgroundColor: ColorScheme.fromSeed(
              seedColor: Theme.of(context).colorScheme.primary,
            ).primary,
          ),
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.dark,
          ),
          fontFamily: 'Lato',
          appBarTheme: AppBarTheme(
            backgroundColor: ColorScheme.fromSeed(
              seedColor: Theme.of(context).colorScheme.primary,
            ).primary,
          ),
        ),
        home: ProductsOverviewView(),
        routes: {AppRoutes.productDetail: (ctx) => ProductDetailView()},
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
