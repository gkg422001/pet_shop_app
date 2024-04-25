import 'package:flutter/material.dart';
import 'package:pet_shop_app/models.dart';
import 'package:pet_shop_app/screens/borrowed_page.dart';
import 'package:pet_shop_app/screens/belonging_page.dart';
import 'package:pet_shop_app/screens/friends_widgets/add_friend.dart';
import 'package:pet_shop_app/screens/friends_widgets/grid_view_list.dart';
import 'package:pet_shop_app/screens/homepage.dart';
import 'package:pet_shop_app/services.dart'; //NEW LINE ADDED

class CatalogPage extends StatefulWidget {
  CatalogPage({Key? key, required this.index}) : super(key: key);
  final int index;
  late ApiService apiService; //NEW LINE ADDED

  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<CatalogPage> {
  late int _currentIndex;
  List<Friend> _foundFriends = []; //NEW LINE ADDED

  @override
  void initState() {
    _fetchFriends(); //NEW LINE ADDED
    super.initState();
    _currentIndex = widget.index;
  }

  //NEW FUNCTION ADDED
  Future<void> _fetchFriends() async {
    try {
      List<Friend> friends = await ApiService().fetchData();
      setState(() {
        _foundFriends = friends;
      });
    } catch (e) {
      print("Failed");
      // Handle any errors
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // CartProvider cartprovider = Provider.of<CartProvider>(context);
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
            AddFriend(
              reloadState: _fetchFriends,
            ),
            SizedBox(
              height: 10,
            ),
            gridViewList(
              currentIndex: _currentIndex,
              newList: _foundFriends, //MODIFIED
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
