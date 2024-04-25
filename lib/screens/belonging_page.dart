import 'package:flutter/material.dart';
import 'package:pet_shop_app/models.dart';
import 'package:pet_shop_app/screens/belonging_widgets/add_belonging.dart';
import 'package:pet_shop_app/screens/belonging_widgets/grid_view.dart';
import 'package:pet_shop_app/screens/borrowed_page.dart';
import 'package:pet_shop_app/screens/friend_page.dart';
import 'package:pet_shop_app/screens/homepage.dart';
import 'package:pet_shop_app/services.dart';

class BelongingsPage extends StatefulWidget {
  BelongingsPage({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  _BelongingsState createState() => _BelongingsState();
}

class _BelongingsState extends State<BelongingsPage> {
  late int _currentIndex;
  List<Belonging> _foundBelongings = [];

  @override
  void initState() {
    _fetchBelongings();
    super.initState();
    _currentIndex = widget.index;
  }

  Future<void> _fetchBelongings() async {
    try {
      List<Belonging> belongings = await ApiService().fetchBelonging();
      setState(() {
        _foundBelongings = belongings;
      });
    } catch (e) {
      print("Failed");
      // Handle any errors
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
        child: Column(
          children: [
            Center(
              child: Text(
                "Friends",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            AddBelongings(
              reloadState: _fetchBelongings,
            ),
            SizedBox(
              height: 10,
            ),
            gridView(
              currentIndex: _currentIndex,
              newList: _foundBelongings, //MODIFIED
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: const Color.fromARGB(255, 136, 92, 211),
        selectedFontSize: 17, // Font size when selected
        unselectedFontSize: 14,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Borrowed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Belongings',
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
                  builder: (context) => BorrowedPage(index: _currentIndex)),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BelongingsPage(index: _currentIndex)),
            );
          }
        },
      ),
    );
  }
}
