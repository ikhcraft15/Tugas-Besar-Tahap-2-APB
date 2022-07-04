import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tubes_uas_final/screens/login/reset_password_screen.dart';
import 'package:tubes_uas_final/screens/sign_up/sign_up_screen.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  //inisialisasi controller email dan password
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //mekanisme untuk sign In
  Future signIn() async {
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
    );
  }

  //mekanisme untuk melepaskan memori yg dialokasikan ke variabel saat objek dihapus secara permanen
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  //mekanisme reset password dengan verifikasi menggunakan email
  Future resetPassword() async {
    FirebaseAuth.instance.sendPasswordResetEmail(
      email: _emailController.text.trim(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Judul
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Container(
                  child: const Text("Healing Time",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0, color: Colors.blue),
                  textAlign: TextAlign.center,),
                ),
              ),

              // Textfield untuk email
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
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

              // Textfield untuk password
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

              // Button untuk sign in
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child: TextButton(
                  onPressed: signIn,
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              //button untuk ke halaman reset password
              TextButton(
                child: const Text("Forgot Password",style: TextStyle(fontSize: 18.0),),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ResetPasswordScreen())
                  );
                },
              ),

              //button untuk ke halaman register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Does not have an account?", style: TextStyle(fontSize: 15.0, color: Colors.black),),
                  TextButton(
                    child: const Text("Sign Up", style: TextStyle(fontSize: 20.0),),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpScreen()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
