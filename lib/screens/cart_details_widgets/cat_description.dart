import 'package:flutter/material.dart';
import 'package:pet_shop_app/products_list.dart';

class CatDescription extends StatelessWidget {
  const CatDescription({
    super.key,
    required this.cat,
  });

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 200,
      child: Text(
        cat.description,
        style: TextStyle(
            fontSize: 17, fontWeight: FontWeight.w400, color: Colors.grey),
      ),
    );
  }
}
