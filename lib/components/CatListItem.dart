import 'package:flutter/material.dart';

class CatItem extends StatelessWidget {
  final String title;
  final String place;
  final int reward;
  final int date;

  final color;

  const CatItem (
  {
    Key? key,
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
      child: Container(
        decoration: BoxDecoration(
          color: color
        ),
        child: Row(
          children: [
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
                Text(reward.toString()),
                Text(place)
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(date.toString())
              ],
            )
          ]
        ),
      ),
    );
  }
}