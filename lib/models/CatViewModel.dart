import 'package:flutter/cupertino.dart';
import 'package:wanted_cats/repositories/CatRepository.dart';

class CatViewModel {
  final repository = CatRepository();
  var catsList = List.empty();

  Future<void> reload() async{
    catsList = await repository.getCats();
  }
}