import 'package:flutter/material.dart';
import 'package:quis/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = false;
  bool isValidate = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
          backgroundColor: Color.fromRGBO(218, 41, 28, 1),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(children: [
              _createImage(),
              _usernameField(),
              _passwordField(),
              _loginButton(context),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _createImage() {
    return Container(
        child: Image.network("https://id.images.search.yahoo.com/search/images;?p=logo%20music#id=10&iurl=https%3A%2F%2Fstatic.turbosquid.com%2FPreview%2F2014%2F07%2F04__09_28_51%2FView1.jpg49ed5df3-b385-413d-987a-949923062104Original.jpg&action=click")
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          hintText: 'Username',
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide:
            BorderSide(color: (isValidate) ? Colors.blue : Colors.red),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        obscureText: true,
        onChanged: (value) {
          password = value;
        },
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide:
            BorderSide(color: (isValidate) ? Colors.blue : Colors.red),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: (isValidate)
              ? Color.fromRGBO(218, 41, 28, 1)
              : Colors.blue, // background
          onPrimary: Colors.white, // foreground
        ),
        onPressed: () {
          String text = "";
          if (password == "123") {
            setState(() {
              text = "Login Success";
              isLoginSuccess = true;
              isValidate = true;
            });
            _loginProcess(context);
          } else {
            setState(() {
              text = "Login Failed";
              isLoginSuccess = false;
              isValidate = false;
            });
          }
          print("isLoginSuccess : $isLoginSuccess");
          SnackBar snackBar = SnackBar(
            content: Text(text),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Login'),
      ),
    );
  }

  void _loginProcess(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return HomePage();
    }));
  }
}