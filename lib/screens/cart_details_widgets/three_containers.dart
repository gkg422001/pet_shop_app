import 'package:flutter/material.dart';
import 'package:pet_shop_app/products_list.dart';

class ThreeContainers extends StatelessWidget {
  const ThreeContainers({
    super.key,
    required this.cat,
  });

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 110,
          height: 80,
          decoration: BoxDecoration(
              color: Color.fromARGB(217, 244, 243, 243),
              borderRadius: BorderRadius.circular(18)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Weight',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey)),
              Text(cat.weight,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.yellow))
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          width: 110,
          height: 80,
          decoration: BoxDecoration(
              color: Color.fromARGB(217, 244, 243, 243),
              borderRadius: BorderRadius.circular(18)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Height',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey)),
              Text(cat.height,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.yellow))
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          width: 110,
          height: 80,
          decoration: BoxDecoration(
              color: Color.fromARGB(217, 244, 243, 243),
              borderRadius: BorderRadius.circular(18)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Color',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey)),
              Text(cat.color,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.yellow))
            ],
          ),
        ),
      ],
    );
  }
}
