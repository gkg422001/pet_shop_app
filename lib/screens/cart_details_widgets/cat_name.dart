import 'package:flutter/material.dart';
import 'package:pet_shop_app/products_list.dart';

class CatName extends StatelessWidget {
  const CatName({super.key, required this.cat});
  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 300,
      left: 30,
      child: Container(
        width: 355,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.white,
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
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cat.name,
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    cat.location + '  •  8m',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Spacer(),
              Image.asset('assets/gender.png')
            ],
          ),
        ),
      ),
    );
  }
}
