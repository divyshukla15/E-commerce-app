import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email =TextEditingController();
  
  TextEditingController password =TextEditingController();
  var name="";
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(children: [
                Image.asset("assets/undraw_Authentication_re_svpt.png",
      fit: BoxFit.cover),
      Text(
        'data ${name}',
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
      ),
      const SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
        child: Column(
          children: [
            TextFormField(
              controller: email,
              decoration:  const InputDecoration(
                  hintText: "username", label: Text("username")),
                  onChanged: (value){
                    name=value;
                    setState(() {
                      
                    });
                  },
            ),
            TextFormField(
              controller: password,
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: "password", label: Text("password")),
            ),
            Container(
              width: 150, height: 50,
              alignment: Alignment.center,
              child: const Text("Login",
              style:TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18)),
            )
          ],
        ),
      ),
    ]));
  }
}
