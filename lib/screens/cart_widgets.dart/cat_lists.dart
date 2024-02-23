import 'package:flutter/material.dart';
import 'package:pet_shop_app/products_list.dart';
import 'package:pet_shop_app/providers/cart_provider.dart';

class catLists extends StatelessWidget {
  const catLists({
    super.key,
    required this.cartprovider,
  });

  final CartProvider cartprovider;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: cartprovider.items.length,
        itemBuilder: (context, index) {
          Cat cat = cartprovider.items[index];
          return Padding(
            padding: EdgeInsets.all(10),
            child: ListTile(
              leading: Container(
                width: 85,
                height: 85,
                child: Image.asset(cat.image),
              ),
              title: Text(cat.name),
              subtitle: Text(cat.location),
              trailing: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      cartprovider.remove(cat);
                    },
                    child: Icon(Icons.delete_outline),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '\$${cat.price.toString()}',
                    style: TextStyle(color: Colors.yellow),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
