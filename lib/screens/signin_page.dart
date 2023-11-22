import 'package:flutter/material.dart';
import 'package:my_project/screens/forgot_password_page.dart';
import 'package:my_project/screens/signup_page.dart';

class Signin_Page extends StatefulWidget {
  const Signin_Page({super.key});

  @override
  State<Signin_Page> createState() => _LoginPage1State();
}

class _LoginPage1State extends State<Signin_Page> {
  final loginkey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  bool passwordVisible = false;
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        body: SingleChildScrollView(
          child: Form(
            key: loginkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 25),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 180,
                        width: 300,
                        child: Stack(
                          children: [
                            // Center(
                            //   child: Image(
                            //       image: AssetImage(
                            //     'assets/images1/nikeshoelogo3.png',
                            //   )),
                            // )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      "Login here",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                const Text(
                  "Welcome back! You've Been Missed",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 50,
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                              color: Colors.white,
                            )),
                        hintText: "E-mail",
                        hintStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        prefixIcon: Icon(Icons.mail)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email can't be empty";
                      }
                      if (!RegExp(
                              r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                          .hasMatch(value)) {
                        return "Enter a valid email adress";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: !passwordVisible,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.greenAccent)),
                        hintText: "Password",
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                            icon: Icon(passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        hintStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        prefixIcon: Icon(
                          Icons.lock,
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password can't be empty";
                      }
                      if (!RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,12}$')
                          .hasMatch(value)) {
                        return "Incorrect Password";
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context) {
                                  return ForgotPassword();
                                },
                              ));
                            });
                          },
                          child: const Text(
                            "Forgot your password?",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30)),
                    width: 150,
                    height: 55,
                    child: TextButton(
                        onPressed: () {
                          if (loginkey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Success")),
                            );
                          }
                        },
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 23),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return SignupPage();
                            },
                          ));
                        });
                      },
                      child: const Text(
                        "New user? Create new account",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                ),
                const SizedBox(
                  width: 50,
                  height: 50,
                ),
                const Text(
                  "Or continue with",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Image(
                              image: AssetImage('assets/images1/google.png'))),
                    ),
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Image(
                              image: AssetImage('assets/images1/phone.png'))),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
