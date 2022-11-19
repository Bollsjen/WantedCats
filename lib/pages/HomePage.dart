import 'package:flutter/material.dart';
import 'package:wanted_cats/components/CatListItem.dart';
import 'package:wanted_cats/models/CatViewModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  final viewModel = CatViewModel();
  var catList = List.empty();
  var catItemList;

  _MyHomePageState(){
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wanted Cats'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextButton(onPressed: () {
            Reload();
          }, child: Text("UPDATE")),
          Expanded(child: ListView.builder(
              itemCount: viewModel.catsList.length,
              itemBuilder: (context, index) {
                final item = viewModel.catsList[index];
                return CatItem(title: item.name, place: item.place, reward: item.reward, date: item.date, color: Colors.blue[400]);
              })),
        ],
      ),
    );
  }

  void init() async{
    await viewModel.reload();
    UpdateList();
    //catItemList = List<ListItem>.generate(viewModel.catsList.length, (index) => CatListItem(viewModel.catsList[index].name, viewModel.catsList[index].place, viewModel.catsList[index].reward, viewModel.catsList[index].date))
  }

  void Reload() async{
    await viewModel.reload();
    UpdateList();
  }

  void UpdateList(){
    setState(() {
      catList = viewModel.catsList;
    });
  }
}