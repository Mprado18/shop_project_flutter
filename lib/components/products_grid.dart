import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/product_grid_item.dart';
import 'package:shop/models/product.dart';
import 'package:shop/providers/product_list_provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavoriteOnly;
  const ProductsGrid(this.showFavoriteOnly, {super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductListProvider>(context);
    final List<Product> loadedProducts = showFavoriteOnly
        ? provider.favoriteProducts
        : provider.products;

    return GridView.builder(
      padding: EdgeInsets.all(16),
      itemCount: loadedProducts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (ctx, index) {
        return ChangeNotifierProvider.value(
          value: loadedProducts[index],
          child: ProductGridItem(),
        );
      },
    );
  }
}
