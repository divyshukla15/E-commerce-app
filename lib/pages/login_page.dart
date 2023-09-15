library globals;

import 'package:e_coommerce_app/utils/routes.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

//import 'utils/routes.dart';
String Name = "";
String Email = "";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();

  TextEditingController password = TextEditingController();
//String name="";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushReplacementNamed(context, MyRoute.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
              child: Form(
            key: _formKey,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 18.0, left: 10.0, right: 10.0, bottom: 10),
                child: Image.asset("assets/5101874.jpg", fit: BoxFit.cover),
              ),
              Text(
                'Welcome !!',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "User name can't be empty";
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter Username", label: Text("Username")),
                      onChanged: (value) {
                        Name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email address can't be empty";
                        } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return "Please Enter a Valid Email";
                        } else {
                           {
                      Email = value;
                          };
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter Email", label: Text("Email ID")),
                    ),
                    // ),onChanged: (value){
                    //         email=value;
                    //         setState(() {

                    //         });
                    //       },
                    TextFormField(
                      controller: password,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password can't be empty";
                        } else if (!RegExp(r'\S\w{4,}').hasMatch(value)) {
                          return "Password must be more than 4 characters";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter Password", label: Text("Password")),
                    ),
                    const SizedBox(height: 40.0),
                    Material(
                      color: dg(),
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton ? 50 : 150, height: 50,
                          alignment: Alignment.center,
                          // ignore: sort_child_properties_last
                          child: changeButton
                              ? const Icon(Icons.done, color: Colors.white)
                              : const Text("Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                          // decoration: BoxDecoration(
                          //    color: Colors.deepPurple,
                          //   ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]),
          )),
        ),
      ),
    );
  }
}
