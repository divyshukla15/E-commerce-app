import 'package:e_coommerce_app/utils/routes.dart';
import 'package:flutter/material.dart';
//import 'utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email =TextEditingController();
  
  TextEditingController password =TextEditingController();
  var name="";
  bool changeButton=false;
  final _formKey= GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if(_formKey.currentState!.validate()){
    setState(() {
                      changeButton=true;
                    });
                    await Future.delayed(const Duration(seconds:1));
                   // ignore: use_build_context_synchronously
                   await Navigator.pushNamed(context, MyRoute.homeRoute);
                    setState(() {
                      changeButton=false;
                    });
  }}
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Form(
          key: _formKey,
          child: Column(children: [
                  Image.asset("assets/images/undraw_Authentication_re_svpt.png",
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
                validator:(value) {
                  if(value!.isEmpty){
                    return "User name can't be empty";}
                    return null;},
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
                validator:(value) {
                  if(value!.isEmpty){
                    return "Password can't be empty";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    hintText: "password", label: Text("password")),
              ),SizedBox(height:40.0),
              Material(
                  color:Colors.deepPurple,
                  borderRadius: BorderRadius.circular( changeButton ? 50: 8),
        
                child: InkWell(
                  onTap:()=> moveToHome(context),
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: changeButton? 50:150 , height: 50,
                    alignment: Alignment.center,
                    // ignore: sort_child_properties_last
                    child: changeButton? const Icon(Icons.done,
                    color:Colors.white): const Text("Login",
                    style:TextStyle(color: Colors.white,
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
        ));
  }
}
