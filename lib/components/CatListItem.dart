import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wanted_cats/pages/CatDetails.dart';

class CatItem extends StatelessWidget {
  final int id;
  final String title;
  final String place;
  final int reward;
  final int date;

  final color;

  const CatItem (
  {
    Key? key,
    required this.id,
    required this.title,
    required this.place,
    required this.reward,
    required this.date,
    required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CatDetails(id: id)));
        },
        child: new Container(
          decoration: BoxDecoration(
              color: color
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                child: Image(
                    image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title),
                  SizedBox(
                    height: 10,
                  ),
                  Text(reward.toString()),
                  SizedBox(
                    height: 10,
                  ),
                  Text(place)
                ],
              ),
              Flexible(
                fit: FlexFit.tight,
                child: SizedBox(),
              ),
              Container(
                height: 100,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                        time(),
                        style: TextStyle(
                            color: Colors.blueGrey[100]
                        )
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String time(){
    DateTime _time = DateTime.fromMillisecondsSinceEpoch(date * 1000);
    return DateFormat('dd-mm-yyy').format(_time);
  }
}