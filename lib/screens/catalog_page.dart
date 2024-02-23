import 'package:flutter/material.dart';
import 'package:pet_shop_app/products_list.dart';
import 'package:pet_shop_app/providers/cart_provider.dart';
import 'package:pet_shop_app/screens/cart_page.dart';
// import 'package:pet_shop_app/screens/cat_details.dart';
import 'package:pet_shop_app/screens/catalog_widgets/grid_view_list.dart';
import 'package:pet_shop_app/screens/catalog_widgets/search_bar.dart';
// import 'package:pet_shop_app/screens/catalog_widgets/search_bar.dart';
import 'package:pet_shop_app/screens/homepage.dart';
import 'package:provider/provider.dart';

class CatalogPage extends StatefulWidget {
  CatalogPage({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<CatalogPage> {
  late int _currentIndex;
  List<Cat> _foundCats = []; // new change

  @override
  void initState() {
    _foundCats = CatList; // new change
    super.initState();
    _currentIndex = widget.index;
  }

  void _runFilter(String enteredKeyword) {
    // new function
    List<Cat> results = [];
    if (enteredKeyword.isEmpty) {
      results = CatList;
    } else {
      results =
          CatList.where((cat) => cat.name.contains(enteredKeyword)).toList();
    }

    setState(() {
      _foundCats = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartprovider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
        child: Column(
          children: [
            Center(
              child: Text(
                "Store",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            searchBar(
              runFilter: _runFilter,
            ),
            SizedBox(
              height: 10,
            ),
            gridViewList(
              currentIndex: _currentIndex,
              newList: _foundCats,
            ),
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
