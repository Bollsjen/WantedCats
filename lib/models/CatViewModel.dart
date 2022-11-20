import 'package:flutter/cupertino.dart';
import 'package:wanted_cats/repositories/CatRepository.dart';
import 'package:wanted_cats/models/Cat.dart';

class CatViewModel {
  final repository = CatRepository();
  var catsList = List.empty();

  Future<void> reload() async{
    catsList = await repository.getCats();
  }

  Future<Cat?> getCat(int id) async{
    return await repository.getCat(id);
  }
}