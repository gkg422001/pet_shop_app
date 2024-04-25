import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pet_shop_app/models.dart';

class ApiService {
  //GET REQUESTS
  Future<List<Friend>> fetchData() async {
    var person_list = <Friend>[]; // Explicitly declare the type here
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/v1/friends/'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map<String, dynamic> item in data) {
        person_list.add(Friend.fromJson(item));
      }
      return person_list;
    } else {
      throw Exception('Failed to load friends');
    }
  }

  Future<List<Belonging>> fetchBelonging() async {
    var belonging_list = <Belonging>[]; // Explicitly declare the type here
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/v1/belongings/'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map<String, dynamic> item in data) {
        belonging_list.add(Belonging.fromJson(item));
      }
      return belonging_list;
    } else {
      throw Exception('Failed to load friends');
    }
  }

  Future<List<Borrowed>> fetchBorrowed() async {
    var borrowed_list = <Borrowed>[]; // Explicitly declare the type here
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/v1/borrowings/'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map<String, dynamic> item in data) {
        borrowed_list.add(Borrowed.fromJson(item));
      }
      return borrowed_list;
    } else {
      throw Exception('Failed to load friends');
    }
  }

  //POST REQUESTS
  Future<Friend> createFriend(Friend friend) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/v1/friends/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(friend.toJson()),
    );

    if (response.statusCode == 201) {
      // If the server returns a 201 CREATED response,
      // then parse the JSON response.
      return Friend.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create friend');
    }
  }

  Future<Belonging> createBelonging(Belonging belonging) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/v1/belongings/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(belonging.toJson()),
    );

    if (response.statusCode == 201) {
      // If the server returns a 201 CREATED response,
      // then parse the JSON response.
      return Belonging.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create friend');
    }
  }

  Future<Borrowed> createBorrowed(Borrowed borrowed) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/v1/borrowings/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(borrowed.toJson()),
    );

    if (response.statusCode == 201) {
      // If the server returns a 201 CREATED response,
      // then parse the JSON response.
      return Borrowed.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create friend');
    }
  }
}
