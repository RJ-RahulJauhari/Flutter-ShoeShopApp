import 'package:flutter/material.dart';
import 'package:shoe_shop_app/providers/CartProvider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text(
          "Cart",
        )),
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];
            return ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                    barrierDismissible: false,
                    builder: (context) {
                        return AlertDialog(
                          title: Text(
                              "Delete Product",
                              style: Theme.of(context).textTheme.titleMedium),
                            content: const Text("Are you sure you want to delete this product?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("No",style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold
                              )),
                            ),
                            TextButton(
                              onPressed: () {
                                Provider.of<CartProvider>(context, listen: false).removeProduct(cartItem);
                                Navigator.of(context).pop();
                              },
                              child: const Text("Yes",style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold
                              )),
                            )
                          ],
                        );
                    }
                  );
                },
              ),
              title: Text(cartItem['title'].toString(),
                  style: Theme.of(context).textTheme.bodySmall),
              subtitle: Text("Size: ${cartItem['size']}"),
            );
          }),
    );
  }
}
