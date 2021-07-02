import 'package:chat_app_example/Utils/Routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final _formkey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool btn = false;

  login() async {
    if (_formkey.currentState.validate()) {
      setState(() {
        btn = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homePage);
      setState(() {
        btn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset(
            "assets/login.png",
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          Text("welcome $name",
              style:
                  const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.red,
                      )),
                      hintText: "enter Email",
                      labelText: "Email",
                    ),
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    validator: (value) =>
                        value.isEmpty ? "enter a Valid Email" : null,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.red,
                      )),
                      hintText: "enter Password",
                      labelText: "Password",
                    ),
                    validator: (value) =>
                        value.isEmpty ? "enter a Valid Password" : null,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Material(
            borderRadius:
                btn ? BorderRadius.circular(60) : BorderRadius.circular(10),
            color: context.theme.buttonColor,
            child: InkWell(
              onTap: login,
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: 60,
                width: btn ? 60 : 120,
                alignment: Alignment.center,
                child: btn
                    ? const Icon(Icons.check, color: Colors.white)
                    : const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
