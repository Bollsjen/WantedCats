import 'package:flutter/cupertino.dart';
import 'package:wanted_cats/repositories/CatRepository.dart';
import 'package:wanted_cats/models/Cat.dart';

class CatViewModel {
  final repository = CatRepository();
  List<Cat> catsList = List.empty();

  Future<void> reload() async{
    catsList = await repository.getCats();
  }

  Future<Cat?> getCat(int id) async{
    return await repository.getCat(id);
  }

  void postCat(Cat cat){
    repository.postCat(cat);
  }

  List<Cat> sortCats(List<dynamic> chips){
    List<Cat> list = List.empty(growable: true);

    catsList.forEach((element) {
      list.add(element);
    });

    if(chips[0].checked == 1){
      list.sort((a,b) => a.date.compareTo(b.date));
    }else if (chips[0].checked == 2){
      list.sort((a,b) => b.date.compareTo(a.date));
    }

    if(chips[1].checked == 1){
      list.sort((a,b) => a.name.compareTo(b.name));
    }else if(chips[1].checked == 2){
      list.sort((a,b) => b.name.compareTo(a.name));
    }

    if(chips[2].checked == 1){
      list.sort((a,b) => b.place.compareTo(a.place));
    }else if(chips[2].checked == 2){
      list.sort((a,b) => a.place.compareTo(b.place));
    }

    if(chips[3].checked == 1){
      list.sort((a,b) => b.reward.compareTo(a.reward));
    }else if(chips[3].checked == 2){
      list.sort((a,b) => a.reward.compareTo(b.reward));
    }

    return list;
  }

  List<Cat> myCats(String userId){
    List<Cat> list = List.empty(growable: true);

    catsList.forEach((element) {
      list.add(element);
    });
    list = list.where((element) => element.userId == userId).toList();
    debugPrint(list.toString());

    return list;
  }
}