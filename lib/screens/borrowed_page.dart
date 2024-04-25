import 'package:flutter/material.dart';
import 'package:pet_shop_app/models.dart';
import 'package:pet_shop_app/screens/belonging_page.dart';
import 'package:pet_shop_app/screens/borrowed_widgets/add_borrowing.dart';
import 'package:pet_shop_app/screens/borrowed_widgets/grid_view_borrowed.dart';
import 'package:pet_shop_app/screens/friend_page.dart';
import 'package:pet_shop_app/screens/homepage.dart';
import 'package:pet_shop_app/services.dart';

class BorrowedPage extends StatefulWidget {
  BorrowedPage({Key? key, required this.index}) : super(key: key);
  final int index;
  late ApiService apiService;

  @override
  _BorrowedState createState() => _BorrowedState();
}

class _BorrowedState extends State<BorrowedPage> {
  late int _currentIndex;
  List<Borrowed> _foundBorrowed = [];
  List<Friend> _foundFriends = [];
  List<Belonging> _foundBelongings = [];

  @override
  void initState() {
    _fetchBelongings();
    _fetchBorrowed();
    _fetchFriends();
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

  Future<void> _fetchBorrowed() async {
    try {
      List<Borrowed> borrowed = await ApiService().fetchBorrowed();
      setState(() {
        _foundBorrowed = borrowed;
      });
    } catch (e) {
      print("Failed");
      // Handle any errors
      print(e);
    }
  }

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
            AddBorrowing(
              reloadState: _fetchBorrowed,
            ),
            SizedBox(
              height: 10,
            ),
            gridViewBorrowed(
              currentIndex: _currentIndex,
              borrowedList: _foundBorrowed,
              friendList: _foundFriends,
              belongingList: _foundBelongings, //MODIFIED
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Color.fromARGB(255, 136, 92, 211),
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
