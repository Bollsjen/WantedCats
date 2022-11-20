import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:wanted_cats/models/Cat.dart';

class CatRepository {
  final String url = "https://anbo-restlostcats.azurewebsites.net/api/Cats";
  List<Cat> CatsList = List.empty(growable: true);

  Future<List<Cat>> getCats() async {
    CatsList = List.empty(growable: true);
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      try {
        List<dynamic> myMap = json.decode(response.body);
        myMap.forEach((element) {
          CatsList.add(Cat(
              id: element['id'],
              name: element['name'],
              description: element['description'],
              place: element['place'],
              reward: element['reward'],
              userId: element['userId'],
              date: element['date'],
              pictureUrl: element['pictureUrl']
          ));
        });

        return CatsList.toList(growable: true);
        //return List.empty();
      } catch (e) {
        debugPrint(e.toString());
        return List.empty();
      }
    } else {
      return List.empty();
    }
  }

  Future<Cat?> getCat(int id) async{
    final response = await http.get(Uri.parse(url+"/"+id.toString()));

    if (response.statusCode == 200) {
      try {
        dynamic myMap = json.decode(response.body);
          Cat cat = Cat(
              id: myMap['id'],
              name: myMap['name'],
              description: myMap['description'],
              place: myMap['place'],
              reward: myMap['reward'],
              userId: myMap['userId'],
              date: myMap['date'],
              pictureUrl: myMap['pictureUrl']
          );

        return cat;
        //return List.empty();
      } catch (e) {
        debugPrint(e.toString());
        return null;
      }
    } else {
      return null;
    }
  }
}
