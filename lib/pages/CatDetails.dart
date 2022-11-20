import 'package:flutter/material.dart';
import 'package:wanted_cats/models/CatViewModel.dart';
import 'package:wanted_cats/models/Cat.dart';
import 'package:intl/intl.dart';

class CatDetails extends StatefulWidget {
  const CatDetails({super.key, required this.id});
  final int id;

  @override
  State<CatDetails> createState() => _CatDetailsState(id);
}

class _CatDetailsState extends State<CatDetails> {

  _CatDetailsState(int id){
    this.id = id;
  }

  late int id;
  final viewModel = CatViewModel();
  late Cat? cat;


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GetCat(),
        builder: (context, AsyncSnapshot<void> snapshot) {
          if(snapshot.hasData){
            return Scaffold(
              appBar: AppBar(
                title: Text('Cat Details'),
              ),
              body: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 2, color: Colors.black45)
                          )
                        ),
                        child: Text(
                          cat!.name,
                          style: TextStyle(
                            fontSize: 26,

                          ),
                        ),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(width: 2, color: Colors.black45)
                            )
                        ),
                        child: Text(
                          cat!.description,
                          style: TextStyle(
                            fontSize: 26,

                          ),
                        ),
                      ),
                    ),



                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(width: 2, color: Colors.black45)
                            )
                        ),
                        child: Text(
                          cat!.place,
                          style: TextStyle(
                            fontSize: 26,

                          ),
                        ),
                      ),
                    ),



                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(width: 2, color: Colors.black45)
                            )
                        ),
                        child: Text(
                          cat!.reward.toString(),
                          style: TextStyle(
                            fontSize: 26,

                          ),
                        ),
                      ),
                    ),



                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(width: 2, color: Colors.black45)
                            )
                        ),
                        child: Text(
                          time(),
                          style: TextStyle(
                            fontSize: 26,

                          ),
                        ),
                      ),
                    ),


                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 8),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue[400],
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                              child: Center(
                                child: Text(
                                  'BACK',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                    ),
                                ),
                              ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }else {
            return CircularProgressIndicator();
          }
        });
  }

  Future<Cat?> GetCat() async{
    Cat? _cat = await viewModel.getCat(id);
    cat = _cat;
    return _cat;
  }

  String time(){
    DateTime _time = DateTime.fromMillisecondsSinceEpoch(cat!.date * 1000);
    return DateFormat('dd-mm-yyy').format(_time);
  }
}