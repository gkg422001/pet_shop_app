import 'package:flutter/material.dart';
import 'package:pet_shop_app/products_list.dart';
import 'package:pet_shop_app/providers/cart_provider.dart';
import 'package:pet_shop_app/screens/cat_details.dart';
import 'package:provider/provider.dart';

class gridViewList extends StatelessWidget {
  const gridViewList(
      {super.key, required this.currentIndex, required this.newList});
  final int currentIndex;
  final List<Cat> newList;
  @override
  Widget build(BuildContext context) {
    CartProvider cartprovider = Provider.of<CartProvider>(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: GridView.builder(
        // shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: newList.length, // new value
        itemBuilder: (context, index) {
          Cat cat = newList[index]; // new value
          return Container(
            width: 100,
            height: 130,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(47, 44, 43, 43),
                    offset: Offset(0, 2),
                    blurRadius: 2,
                    spreadRadius: 1,
                  )
                ]),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CatDetailsPage(
                                    cat: cat,
                                    index: currentIndex,
                                  )),
                        );
                      },
                      child: Image.asset(cat.image)),
                  SizedBox(
                    height: 3,
                  ),
                  Text(cat.name),
                  Row(
                    children: [
                      Text(
                        '\$${cat.price.toString()}',
                        style: TextStyle(color: Colors.yellow),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          cartprovider.add(cat);
                        },
                        child: Container(
                          width: 20,
                          height: 20,
                          child: Icon(
                            Icons.shopping_cart,
                            color: Colors.yellow,
                          ),
                        ),
                      )
                    ],
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
