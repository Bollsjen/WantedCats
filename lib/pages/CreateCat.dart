import 'package:flutter/material.dart';
import 'package:wanted_cats/models/Cat.dart';
import 'package:wanted_cats/models/CatViewModel.dart';
import 'dart:convert';

import 'package:wanted_cats/pages/HomePage.dart';

class CreateCat extends StatefulWidget {
  const CreateCat({super.key});

  @override
  State<CreateCat> createState() => _CreateCatState();
}

class _CreateCatState extends State<CreateCat> {

  final viewModel = CatViewModel();

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final placeController = TextEditingController();
  final rewardController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Cat'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Text(
                'Create cat details',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(58, 58, 58, 1)
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Cat name...'
              ),
              controller: nameController,
            ),
          ),



          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Cat description...'
              ),
              controller: descriptionController,
            ),
          ),



          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Gone missing place...'
              ),
              controller: placeController,
            ),
          ),



          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Reward...'
              ),
              controller: rewardController,
            ),
          ),



          Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 48),
            child: GestureDetector(
              onTap: () {
                CreateCat();
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue[400],
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Center(
                    child: Text(
                        'CREATE',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        )
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      )
    );
  }

  void CreateCat(){
    Cat cat = Cat(id: 0, name: nameController.text, description: descriptionController.text, place: placeController.text, reward: int.parse(rewardController.text), userId: 'fisk', date: ((DateTime.now().millisecondsSinceEpoch / 1000)).floor(), pictureUrl: 'null');
    viewModel.postCat(cat);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
  }
}