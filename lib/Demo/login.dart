import 'package:flutter/material.dart';

class loginPage extends StatefulWidget{
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/images/anh-troll-4.jpg', width: 50,),
                const SizedBox(height: 16.0),
                const Text('FISH'),
              ],
            ),
            const SizedBox(height: 30.0),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            ButtonBar(
              children: <Widget>[
                TextButton(
                    onPressed: (){
                      _usernameController.clear();
                      _passwordController.clear();
                    },
                    child: const Text('CANCEL')),
                ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: const Text('LOGIN'),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}