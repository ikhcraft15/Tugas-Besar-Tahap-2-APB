import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //inisialisasi controller name,email,password,username,contact
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _contactController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;

  //mekanisme untuk melepaskan memori yg dialokasikan ke variabel saat objek dihapus secara permanen
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _contactController.dispose();
    super.dispose();
  }

  //mekanisme untuk sign up menggunakan email dan password
  Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
    addUserDetails(
      _nameController.text.trim(),
      _usernameController.text.trim(),
      int.parse(_contactController.text.trim()),
    );
  }

  // mekenisme untuk menyimpan name,username,contact ke collection users di firestore
  Future addUserDetails(String name, String username, int contact) async {
    await FirebaseFirestore.instance.collection('users').add({
      'displayName':name,
      'username':username,
      'contact':contact,
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //tittle
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Container(
                  child: const Text("Healing Time",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0, color: Colors.blue),
                    textAlign: TextAlign.center,),
                ),
              ),

              //name
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Container(
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: "Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),

              //email
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 5.0),
                child: Container(
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),

              //username
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 5.0),
                child: Container(
                  child: TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      hintText: "User Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),

              //contact
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 5.0),
                child: Container(
                  child: TextField(
                    controller: _contactController,
                    decoration: const InputDecoration(
                      hintText: "Contact",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),

              //password
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 5.0),
                child: Container(
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),

              //button
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child: Container(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      signUp();
                      Navigator.pop(context);
                    },child: const Text("Register", style: TextStyle(fontSize: 20.0),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
