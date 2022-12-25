import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";

  String password = "";

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff131834),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Sign In',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white)),
            Image.asset(
              ('assets/images/logo_movie.png'),
              width: 300,
              height: 300,
            ),
            SizedBox(height: 0),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Form(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: TextFormField(
                      cursorColor: Color(0xffc1071e),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.people),
                        filled: true,
                        fillColor: Colors.white24,
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: 'Input your Username',
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.white24,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color(0xffffF5C518),
                            width: 2.0,
                          ),
                        ),
                      ),
                      onChanged: (String value) {
                        username = value;
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: TextFormField(
                      style: TextStyle(fontSize: 15, color: Colors.white),
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        filled: true,
                        fillColor: Colors.white24,
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: 'Input your Password',
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.white24,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color(0xffffF5C518),
                            width: 2.0,
                          ),
                        ),
                      ),
                      onChanged: (String value) {
                        password = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: SizedBox(
                      width: 1300,
                      height: 50,
                      child: Builder(builder: (context) {
                        return ElevatedButton(
                          onPressed: () {
                            String text = '';
                            if (username == "admin" && password == "admin") {
                              _isObscure = true;
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()));
                            } else {
                              text = "Gagal Login";
                              _isObscure = false;
                            }
                            SnackBar snackBar = SnackBar(
                              content: Text(text),
                              duration: Duration(seconds: 2),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          child:
                              Text('Sign In', style: TextStyle(fontSize: 15)),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xffc1071e),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
