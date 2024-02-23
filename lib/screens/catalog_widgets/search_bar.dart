import 'package:flutter/material.dart';

class searchBar extends StatelessWidget {
  searchBar({super.key, required this.runFilter});
  final Function(String) runFilter;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 225, 224, 224),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
      width: 360,
      height: 45,
      child: Row(
        children: [
          Container(
            width: 25,
            height: 25,
            child: Icon(Icons.search),
          ),
          SizedBox(width: 10),
          Container(
            width: 270,
            height: 45,
            child: TextField(
              onChanged: (value) => runFilter(value),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search Product or Brand',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 178, 173, 173),
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
