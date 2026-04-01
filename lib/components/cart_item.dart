import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart_item.dart';
import 'package:shop/providers/cart_provider.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  const CartItemWidget({required this.cartItem, super.key});

  // TODO incluir uma fun de add/remove em cada item direto no carrinho
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        color: Theme.of(context).colorScheme.errorContainer,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: Icon(Icons.delete, color: Colors.white, size: 40),
      ),
      confirmDismiss: (_) {
        return showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Tem certeza?'),
            content: Text('Quer remover o item do carrinho?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text('Sim'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text('Não'),
              ),
            ],
          ),
        );
      },
      onDismissed: (_) {
        Provider.of<CartProvider>(
          context,
          listen: false,
        ).removeItem(cartItem.productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsetsGeometry.all(4),
              child: FittedBox(child: Text('${cartItem.price}')),
            ),
          ),
          title: Text(cartItem.name),
          subtitle: Text(
            'Total: R\$ ${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}',
          ),
          trailing: Text('${cartItem.quantity}x'),
        ),
      ),
    );
  }
}
