import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
      color: Colors.black,
    );
  }
}
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Asperos',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              color: Colors.white,
              iconSize: 60,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>loginpage()));
              },
            ),
          ],
        ),
      ),
          );
  }
}

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Asperob'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.account_circle),
            color: Colors.black,
            iconSize: 60,
            onPressed: () {},
          ),
          ConstrainedBox(constraints: BoxConstraints.tight(Size(200, 75)),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter User ID';
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: 'User ID'
            ),
          ),
          ),
          ConstrainedBox(constraints: BoxConstraints.tight(Size(200, 75)),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Password';
              }
              return null;
            },
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                labelText: 'Password'
            ),
          ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Proccessing Data......')),
                );
              }
            },
            child: Text('Login'),
            style: ElevatedButton.styleFrom(
              primary: Colors.black
            ),
            ),
          Text('Forget Password?'),
        ElevatedButton(
          child: Text('New User Registration'),
            onPressed: () {},
        )
        ],
      ),
      ),
      )
      );
  }
}


