import 'package:flutter/material.dart';
import 'package:wanted_cats/components/CatListItem.dart';
import 'package:wanted_cats/models/CatViewModel.dart';
import 'package:wanted_cats/pages/CreateCat.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  final viewModel = CatViewModel();
  var catList = List.empty();

  _MyHomePageState(){
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wanted Cats'),
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem<int>(
                value: 0,
                  child: Text('My Account')
              ),
              PopupMenuItem<int>(
                  value: 1,
                  child: Text('Settings')
              ),
              PopupMenuItem<int>(
                  value: 2,
                  child: Text('Login')
              ),
            ];
          },
          onSelected: (value) {
            if(value == 0) {
              debugPrint("My account");
            }else if (value == 1){
              debugPrint("Settings");
            }else if (value == 2) {
              debugPrint("Login");
            }
          }),
        ],
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
                return CatItem(id: item.id, title: item.name, place: item.place, reward: item.reward, date: item.date, color: Colors.blue[400]);
              })),
        ],
      ),
      floatingActionButton: 1 == 1 ? FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateCat()));
        },
        backgroundColor: Colors.blue[400],
        child: Icon(Icons.add),
      ) : null,
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