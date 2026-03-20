import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/order_item.dart';
import 'package:shop/providers/order_list_provider.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<OrderListProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Meus pedidos')),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orders.itemsCount,
        itemBuilder: (ctx, index) => OrderItem(order: orders.items[index]),
      ),
    );
  }
}
