import 'package:flutter/material.dart';
import 'package:pet_shop_app/products_list.dart';
import 'package:pet_shop_app/screens/cart_details_widgets/about_cat.dart';
import 'package:pet_shop_app/screens/cart_details_widgets/cat_description.dart';
import 'package:pet_shop_app/screens/cart_details_widgets/cat_name.dart';
import 'package:pet_shop_app/screens/cart_details_widgets/three_containers.dart';
import 'package:pet_shop_app/screens/cart_page.dart';
import 'package:pet_shop_app/screens/catalog_page.dart';
import 'package:pet_shop_app/screens/homepage.dart';

class CatDetailsPage extends StatefulWidget {
  CatDetailsPage({Key? key, required this.index, required this.cat})
      : super(key: key);
  final int index;
  final Cat cat;

  @override
  _CatDetailsState createState() => _CatDetailsState();
}

class _CatDetailsState extends State<CatDetailsPage> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // CartProvider cartprovider = Provider.of<CartProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                    width: screenWidth,
                    height: 340,
                    child: Image.asset(fit: BoxFit.cover, widget.cat.image)),
                CatName(cat: widget.cat),
              ],
            ),
            SizedBox(
              height: 75,
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: AboutCat(cat: widget.cat)),
            Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: ThreeContainers(cat: widget.cat)),
            CatDescription(cat: widget.cat),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        selectedFontSize: 17, // Font size when selected
        unselectedFontSize: 14,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Catalog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CatalogPage(index: _currentIndex)),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CartPage(index: _currentIndex)),
            );
          }
        },
      ),
    );
  }
}
