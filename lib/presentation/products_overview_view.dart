import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/products_grid.dart';
import 'package:shop/providers/cart_provider.dart';
import 'package:shop/utils/app_routes.dart';

enum FilterOptions { favorite, all }

class ProductsOverviewView extends StatefulWidget {
  const ProductsOverviewView({super.key});

  @override
  State<ProductsOverviewView> createState() => _ProductsOverviewViewState();
}

class _ProductsOverviewViewState extends State<ProductsOverviewView> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha loja'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                value: FilterOptions.favorite,
                child: Text('Somente Favoritos'),
              ),
              PopupMenuItem(value: FilterOptions.all, child: Text('Todos')),
            ],
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.favorite) {
                  _showFavoriteOnly = true;
                } else {
                  _showFavoriteOnly = false;
                }
              });
            },
          ),
          Consumer<CartProvider>(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.cart);
              },
              icon: Icon(Icons.shopping_cart),
            ),
            builder: (ctx, cart, child) => Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Badge(
                label: Text(
                  cart.itemsCount > 99 ? '99+' : cart.itemsCount.toString(),
                ),
                child: child,
              ),
            ),
          ),
        ],
      ),
      body: ProductsGrid(_showFavoriteOnly),
      drawer: AppDrawer(),
    );
  }
}
