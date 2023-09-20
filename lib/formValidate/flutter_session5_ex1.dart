import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginForm(),
        '/welcome': (context) => WelcomeScreen(),
      },
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
class _LoginFormState extends State<LoginForm> {

  bool _loginFailed = false;

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == "admin" && password == "password") {
      Navigator.pushNamed(
        context,
        '/welcome',
        arguments: username,
      );
    } else {
      setState(() {
        _loginFailed = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Login'),
      ),
      body: Padding(
        padding:const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration:const InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration:const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            if (_loginFailed)
             const Text(
                'Username or password is incorrect',
                style: TextStyle(color: Colors.red),
              ),
            ElevatedButton(
              onPressed: _login,
              child:const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final  username = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title:const Text('Welcome'),
        actions: <Widget>[
          IconButton(
            icon:const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome, $username!',
              style:const TextStyle(fontSize: 24),
            ),
          const  SizedBox(height: 16),
            ElevatedButton(
              child:const Text('Logout'),
              onPressed: () {
                _usernameController.clear();
                _passwordController.clear();
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
          ],
        ),
      ),
    );
  }
}