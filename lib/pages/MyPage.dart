import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {

              },
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Wrap(
                              children: [
                                Text('E-mail: '),
                                Text('fisk@fisk.dk')
                              ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Wrap(
                            children: [
                              Text(
                                  'Password: '),
                              Text(
                                'password'.replaceAll(RegExp(r"."),"*"),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}