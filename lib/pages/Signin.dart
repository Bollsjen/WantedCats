import 'package:flutter/material.dart';
import 'package:wanted_cats/pages/Signup.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Signin> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Padding(
        padding: EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 8),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 24, left: 8, bottom: 48, right: 8),
                child: Center(
                  child: Text(
                    'Signin',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Username...',
                        border: InputBorder.none,

                      ),
                      controller: usernameController,
                    ),
                  )
                )
              ),

              Padding(
                  padding: EdgeInsets.only(bottom: 0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Password...',
                            border: InputBorder.none,

                          ),
                          obscureText: true,
                          controller: passwordController,
                        ),
                      )
                  )
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 2),
                child: TextButton(
                  onPressed: () {

                  },
                  child: Text(
                    'Recover Password',
                    style: TextStyle(
                      color: Colors.grey.shade500
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red[300],
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: TextButton(
                      onPressed: () {

                      },
                      child: Text(
                          'Sign in',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                          )
                      ),
                    ),
                  ),
                ),
              ),

              Center(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Wrap(
                    children: [
                      Text('Not a member?'),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Signup()));
                          },
                          child: Text(
                              'Register now',
                              style: TextStyle(
                                  color: Colors.blue[400]
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}