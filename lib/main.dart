import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/presentation/cart_view.dart';
import 'package:shop/presentation/orders_view.dart';
import 'package:shop/presentation/product_form_view.dart';
import 'package:shop/presentation/products_view.dart';
import 'package:shop/providers/cart_provider.dart';
import 'package:shop/presentation/product_detail_view.dart';
import 'package:shop/presentation/products_overview_view.dart';
import 'package:shop/providers/order_list_provider.dart';
import 'package:shop/providers/product_list_provider.dart';
import 'package:shop/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductListProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => OrderListProvider()),
      ],
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
              seedColor: Colors.deepPurple,
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
              seedColor: Colors.deepPurple,
            ).primary,
          ),
        ),
        // home: ProductsOverviewView(),
        routes: {
          AppRoutes.home: (ctx) => ProductsOverviewView(),
          AppRoutes.productDetail: (ctx) => ProductDetailView(),
          AppRoutes.cart: (ctx) => CartView(),
          AppRoutes.orders: (ctx) => OrdersView(),
          AppRoutes.products: (ctx) => ProductsView(),
          AppRoutes.productForm: (ctx) => ProductFormView(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
