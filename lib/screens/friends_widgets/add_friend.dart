import 'package:flutter/material.dart';
import 'package:pet_shop_app/custom_text.dart';
import 'package:pet_shop_app/models.dart';
import 'package:pet_shop_app/screens/friends_widgets/text_field.dart';
import 'package:pet_shop_app/services.dart';

class AddFriend extends StatelessWidget {
  AddFriend({super.key, required this.reloadState});
  final Function reloadState;
  final TextEditingController _controller = TextEditingController();
  final ApiService _apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: 150,
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                height: 650,
                width: screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // backBtn(),
                    SizedBox(
                      height: 15,
                    ),
                    customText(
                        text: 'Enter Friend Name',
                        color: Colors.white,
                        size: 25,
                        weight: FontWeight.bold),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        nameTextField(
                          controller: _controller,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        print(_controller.text);
                        Navigator.pop(context);
                        // Create a new Friend instance with the data from the text field
                        Friend newFriend = Friend(name: _controller.text);
                        // Call the createFriend method from ApiService
                        try {
                          Friend createdFriend =
                              await _apiService.createFriend(newFriend);
                          print('Friend created: ${createdFriend.name}');
                          reloadState();
                        } catch (e) {
                          print('Failed to create friend: $e');
                        }
                      },
                      child: Text('Submit'),
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.black), // Change button color
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
        child: Text("Add Friend",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          foregroundColor: MaterialStateProperty.all<Color>(
              Colors.black), // Change button color
        ),
      ),
    );
  }
}
