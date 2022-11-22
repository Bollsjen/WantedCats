import 'package:flutter/material.dart';

import '../components/CatListItem.dart';
import '../models/Cat.dart';
import '../models/CatViewModel.dart';
import 'package:async/async.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  final AsyncMemoizer _memoizer = AsyncMemoizer();
  final viewModel = CatViewModel();
  List<Cat> catList = List.empty();
  var loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView (
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 48),
              child: Text('My Page',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            GestureDetector(
              onTap: () {

              },
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: [
                        0.15,
                        0.9
                      ],
                      colors: [
                        Color.fromRGBO(144, 94, 181, 1),
                        Color.fromRGBO(71, 144, 211, 1)
                      ]
                    ),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Wrap(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Align(
                            alignment: Alignment.topRight,
                            child: Icon(
                                Icons.edit,
                            color: Colors.white,),
                        ),
                      ),

                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 48),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Wrap(
                                  children: [
                                    Text(
                                        'E-mail: ',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
                                    Text(
                                        'fisk@fisk.dk',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                        )
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Wrap(
                                  children: [
                                    Text(
                                        'Password: ',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
                                    Text(
                                        'password'.replaceAll(RegExp(r"."),"*"),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                        )
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Text(
                  'My cats',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            FutureBuilder(
                              future: init(),
                              builder: (context, AsyncSnapshot<void> snapshot) {
                                if(snapshot.hasData){
                                  return Container(
                                    child: RefreshIndicator(
                                      onRefresh: ScrollRefresh,
                                      child: Column(
                                        children: <Widget>[
                                          ...catList.map((item) {
                                            return CatItem(id: item.id, title: item.name, place: item.place, reward: item.reward, date: item.date, color: Colors.blue[400]!);
                                          }).toList(),
                                        ],
                                      ),
                                    ),
                                  );
                                }else{
                                  return Center(child: CircularProgressIndicator());
                                }
                              }),
          ],
        ),
      ),
    );
  }

  Future<void> init() async{
    return _memoizer.runOnce(() async {
      setState(() {
        loading = true;
      });
      debugPrint(loading.toString());
      await viewModel.reload();
      UpdateList();
      return 'loaded';
    });
  }

  Future<bool> ScrollRefresh() async {
    await viewModel.reload();
    UpdateList();
    return true;
  }

  void UpdateList() {
    setState(() {
      debugPrint('Updating');
      catList = viewModel.myCats('fisk');
      loading = false;
    });
  }
}