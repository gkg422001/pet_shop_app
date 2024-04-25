import 'package:flutter/material.dart';
import 'package:pet_shop_app/models.dart';

class gridViewBorrowed extends StatelessWidget {
  const gridViewBorrowed(
      {super.key,
      required this.currentIndex,
      required this.borrowedList,
      required this.friendList,
      required this.belongingList});
  final int currentIndex;
  final List<Belonging> belongingList;
  final List<Borrowed> borrowedList;
  final List<Friend> friendList; //FROM Cat DATATYPE TO FRIEND
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: borrowedList.length, // new value
      itemBuilder: (context, index) {
        Borrowed borrowed = borrowedList[index]; //FROM Cat data type to Friend
        return Container(
          width: 110,
          height: 200,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 136, 92, 211),
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
                      print("hello");
                    },
                    // onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => CatDetailsPage(
                    //               cat: cat,
                    //               index: currentIndex,
                    //             )),
                    //   );
                    // },
                    child: Center(
                      child: Image.asset(
                        'assets/Czech.png',
                        height: 80,
                        width: 80,
                      ),
                    )),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    friendList.length > borrowed.toWhoId
                        ? friendList[borrowed.toWhoId - 1].name
                        : 'Unknown',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    belongingList.length > borrowed.whatId
                        ? belongingList[borrowed.whatId - 1].name
                        : 'Unknown',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Center(
                //   child: Text(
                //     borrowed.when.toString(),
                //     style: TextStyle(
                //       fontSize: 15,
                //       color: Colors.black,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ), //MODIFIED
              ],
            ),
          ),
        );
      },
    );
  }
}
