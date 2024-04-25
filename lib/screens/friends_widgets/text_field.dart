import 'package:flutter/material.dart';

class nameTextField extends StatelessWidget {
  nameTextField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
      width: 220,
      height: 45,
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter Name',
          hintStyle: TextStyle(
            color: Color(0xFF9EB3C2),
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
