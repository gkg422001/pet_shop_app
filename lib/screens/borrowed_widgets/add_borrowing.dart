import 'package:flutter/material.dart';
import 'package:pet_shop_app/custom_text.dart';
import 'package:pet_shop_app/models.dart';
import 'package:pet_shop_app/screens/borrowed_widgets/belonging_txt_field.dart';
import 'package:pet_shop_app/screens/borrowed_widgets/name_txt_field.dart';
import 'package:pet_shop_app/services.dart';

class AddBorrowing extends StatelessWidget {
  AddBorrowing({super.key, required this.reloadState});
  final Function reloadState;
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final ApiService _apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: 170,
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
                        text: 'Enter Details',
                        color: Colors.white,
                        size: 25,
                        weight: FontWeight.bold),
                    SizedBox(
                      height: 15,
                    ),

                    nameTxtField(
                      controller: _controller1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    belongingTxtField(controller: _controller2),

                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        // print(_controller1.text);
                        Navigator.pop(context);
                        // Create a new Friend instance with the data from the text field
                        Borrowed newBorrowing = Borrowed(
                            whatId: int.parse(_controller2.text),
                            when: DateTime.now(),
                            toWhoId: int.parse(_controller1.text));
                        // Call the createFriend method from ApiService
                        try {
                          Borrowed createdBorrowed =
                              await _apiService.createBorrowed(newBorrowing);
                          // print('Friend created: ${createdBorrowed.name}');
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
        child: Text("Add Borrowing",
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
