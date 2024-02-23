import 'package:flutter/material.dart';

class Cat {
  final int id;
  final double price;
  final String name;
  final String image;
  final String weight;
  final String height;
  final String color;
  final String description;
  final String location;

  Cat({
    required this.id,
    required this.price,
    required this.name,
    required this.image,
    required this.weight,
    required this.height,
    required this.color,
    required this.description,
    required this.location,
  });
}

final List<Cat> CatList = [
  Cat(
      id: 0,
      price: 60,
      name: 'Sphinx Cat',
      image: 'assets/Sphinx.png',
      weight: '3.5 kg',
      height: '22cm',
      color: 'brown',
      location: 'Canada',
      description:
          'The Sphinx cat, hairless and charming, boasts a velvety skin in various colors and patterns. Playful and affectionate, they capture hearts with their unique appearance and lively personalities.'),
  Cat(
      id: 1,
      price: 85,
      name: 'Persian Cat',
      image: 'assets/Persian.png',
      weight: '3.4 kg',
      height: '23cm',
      color: 'light brown',
      location: 'Columbia',
      description:
          'The Persian cat, hairless and charming, boasts a velvety skin in various colors and patterns. Playful and affectionate, they capture hearts with their unique appearance and lively personalities.'),
  Cat(
      id: 2,
      price: 90,
      name: 'Bengal Cat',
      image: 'assets/Bengal.png',
      weight: '3.6 kg',
      height: '26cm',
      color: 'black',
      location: 'Philippines',
      description:
          'The Bengal cat, hairless and charming, boasts a velvety skin in various colors and patterns. Playful and affectionate, they capture hearts with their unique appearance and lively personalities.'),
  Cat(
      id: 3,
      price: 75,
      name: 'Abyssinian Cat',
      image: 'assets/Abyssinian.png',
      weight: '3.3 kg',
      height: '21cm',
      color: 'white',
      location: 'Japan',
      description:
          'The Abyssinian cat, hairless and charming, boasts a velvety skin in various colors and patterns. Playful and affectionate, they capture hearts with their unique appearance and lively personalities.'),
  Cat(
      id: 4,
      price: 75,
      name: 'Burmese Cat',
      image: 'assets/Burmese.png',
      weight: '3.1 kg',
      height: '18cm',
      color: 'white',
      location: 'Malaysia',
      description:
          'The Burmese cat, hairless and charming, boasts a velvety skin in various colors and patterns. Playful and affectionate, they capture hearts with their unique appearance and lively personalities.'),
  Cat(
      id: 5,
      price: 60,
      name: 'Russian Blue Cat',
      image: 'assets/Russian.png',
      weight: '3.5 kg',
      height: '22cm',
      color: 'brown',
      location: 'Canada',
      description:
          'The Russian Blue cat, hairless and charming, boasts a velvety skin in various colors and patterns. Playful and affectionate, they capture hearts with their unique appearance and lively personalities.'),
];
