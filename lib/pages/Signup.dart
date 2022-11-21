import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                        'Signup',
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
                              hintText: 'E-mail...',
                              border: InputBorder.none,

                            ),
                            controller: emailController,
                          ),
                        )
                    )
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
                            obscureText: true,
                            controller: usernameController,
                          ),
                        )
                    )
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
                            'Signup',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18
                            )
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}