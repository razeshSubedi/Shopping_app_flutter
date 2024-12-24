import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_appv2/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;

    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Your Cart"),
          ),
        ),
        body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];
            return ListTile(
              leading: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(cartItem['imageUrl'].toString()),
              ),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                    
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: AlertDialog(
                            title: Text(
                              "Delete Product",
                              style: Theme.of(context).textTheme.titleMedium,
                              textAlign: TextAlign.center,
                            ),
                            content: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Are you sure you want to remove \"${cartItem['title']}\" from the cart?",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  context
                                      .read<CartProvider>()
                                      .removeProduct(cartItem);

                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Remove',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                            actionsAlignment: MainAxisAlignment.center,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        );
                      });
                },
                icon: Icon(
                  Icons.delete,
                  size: 30,
                  color: Colors.red,
                ),
              ),
              focusColor: Colors.amber,
              title: Text(
                cartItem['title'].toString(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text("Size: ${cartItem['sizes'].toString()}",
                  style: Theme.of(context).textTheme.bodySmall),
            );
          },
        ));
  }
}
