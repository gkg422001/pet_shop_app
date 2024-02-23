import 'package:flutter/material.dart';
import 'package:pet_shop_app/products_list.dart';
import 'package:pet_shop_app/screens/cat_details.dart';

class AboutCat extends StatelessWidget {
  const AboutCat({
    super.key,
    required this.cat,
  });

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 35,
          height: 35,
          child: Image.asset(
            'assets/pet.png',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'About ' + cat.name,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
