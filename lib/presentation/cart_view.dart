import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/cart_item.dart';
import 'package:shop/providers/cart_provider.dart';
import 'package:shop/providers/order_list_provider.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final items = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(title: Text('Carrinho')),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: TextStyle(fontSize: 20)),
                  const SizedBox(width: 10),
                  Chip(
                    backgroundColor: Theme.of(context).secondaryHeaderColor,
                    label: Text(
                      'R\$ ${cart.totalAmout.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Theme.of(
                          context,
                        ).primaryTextTheme.headlineMedium?.color,
                      ),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Provider.of<OrderListProvider>(
                        context,
                        listen: false,
                      ).addNewOrder(cart);

                      cart.clear();
                    },
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    child: Text('Comprar'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (ctx, index) =>
                  CartItemWidget(cartItem: items[index]),
            ),
          ),
        ],
      ),
    );
  }
}
