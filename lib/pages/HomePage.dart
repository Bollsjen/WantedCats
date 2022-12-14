import 'package:flutter/material.dart';
import 'package:wanted_cats/components/CatListItem.dart';
import 'package:wanted_cats/models/CatViewModel.dart';
import 'package:wanted_cats/pages/CreateCat.dart';
import 'package:async/async.dart';
import 'package:wanted_cats/components/ChipButton.dart';
import 'package:wanted_cats/pages/Signin.dart';
import 'package:wanted_cats/pages/MyPage.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  final AsyncMemoizer _memoizer = AsyncMemoizer();
  final viewModel = CatViewModel();
  var catList = List.empty();
  var loading = false;
  var signedIn = false;

  _MyHomePageState(){
    CheckSignedIn();
  }

  late final chips = [
    ChipButton(
      title: 'Date',
      function: () {
        Sort();
      },
      checked: 0,
      checkAble: true,
    ),

    ChipButton(
      title: 'Name',
      function: () {
        Sort();
      },
      checked: 0,
      checkAble: true,
    ),

    ChipButton(
      title: 'Place',
      function: () {
        Sort();
      },
      checked: 0,
      checkAble: true,
    ),

    ChipButton(
      title: 'Reward',
      function: () {
        Sort();
      },
      checked: 0,
      checkAble: true,
    ),
  ];

  void CheckSignedIn() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        setState(() {
          signedIn = false;
        });

      } else {
        setState(() {
          signedIn = true;
          debugPrint("User is signed in");
        });
      }
    });
    setState(() {
      signedIn = false;
    });
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
                  child: !signedIn ? Text('Login') : Text('Sign out')
              ),
            ];
          },
          onSelected: (value) async {
            if(value == 0) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyPage()));
            }else if (value == 1){
              debugPrint("Settings");
            }else if (value == 2) {
              if(!signedIn) {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Signin()));
              }else{
                  await Firebase.initializeApp(
                    options: DefaultFirebaseOptions.currentPlatform,
                  );
                  await FirebaseAuth.instance.signOut();
                  CheckSignedIn();
              }
            }
          }),
        ],
      ),
      body: Column(
          children: [
            Container(
              height: 45,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: ListView.builder(
                    itemCount: 1,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Wrap(
                          children: <Widget> [
                          Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: GestureDetector(
                              onTap: () => showDialog(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    title: const Text('Filter'),
                                    actions: [
                                      Padding(padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white
                                          ),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: 'Text'
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                              child: Chip(
                                label: Text('Filter'),
                              ),
                            ),
                          ),
                            Wrap(
                              children:
                                chips.toList(),
                            )
                        ],
                      );
                    }),
              ),
            ),

            FutureBuilder(
                future: init(),
                builder: (context, AsyncSnapshot<void> snapshot) {
                  if(snapshot.hasData){
                    return Expanded(
                      child: RefreshIndicator(
                        onRefresh: ScrollRefresh,
                        child: !loading ?
                        ListView.builder(
                          itemCount: catList.length,
                          itemBuilder: (context, index) {
                            final item = catList[index];
                            return CatItem(id: item.id, title: item.name, place: item.place, reward: item.reward, date: item.date, color: Colors.blue[400]!);
                          },
                        )
                            : Center(
                            child: CircularProgressIndicator()
                        ),
                      ),
                    );
                  }else{
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ),
      floatingActionButton: signedIn ? FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateCat()));
        },
        backgroundColor: Colors.green[400],
        child: Icon(Icons.add),
      ) : null,
    );
  }

  Future<void> init() async{
    return this._memoizer.runOnce(() async {
      setState(() {
        loading = true;
      });
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

  void UpdateList(){
    setState(() {
      catList = viewModel.catsList;
      ResetSorting();
      loading = false;
    });
  }

  void ResetSorting(){
    setState(() {
      for(var i = 0; i < chips.length; i++){
        chips[i].checked = 0;
      }
    });
  }

  void Sort(){
    setState(() {
      loading = true;
      catList = viewModel.sortCats(chips);
      loading = false;
    });
  }
}