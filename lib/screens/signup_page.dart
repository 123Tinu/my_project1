import 'package:flutter/material.dart';
import 'package:my_project/screens/signin_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _LoginPage1State();
}

class _LoginPage1State extends State<SignupPage> {
  final loginkey = GlobalKey<FormState>();
  var name = TextEditingController();
  var emailController = TextEditingController();
  var password = TextEditingController();
  var confirm_password = TextEditingController();
  bool passwordVisible = false;
  bool passVisible = false;

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
                        width: 180,
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
                SizedBox(
                  height: 50,
                ),
                Padding(
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
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                              color: Colors.white,
                            )),
                        hintText: "Name",
                        hintStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        prefixIcon: Icon(Icons.person)),
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name can't be empty";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: !passwordVisible,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                            icon: Icon(passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        filled: true,
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.greenAccent)),
                        hintText: "Password",
                        hintStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        prefixIcon: Icon(
                          Icons.lock,
                        )),
                    controller: password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password can't be empty";
                      }
                      if (!RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,12}$')
                          .hasMatch(value)) {
                        return "Enter a strong password";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.greenAccent)),
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        prefixIcon: Icon(
                          Icons.lock,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passVisible = !passVisible;
                              });
                            },
                            icon: Icon(passVisible
                                ? Icons.visibility
                                : Icons.visibility_off))),
                    controller: confirm_password,
                    obscureText: !passVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password can't be empty";
                      } else if (value != password.text) {
                        return "Password Must Be Same";
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30)),
                    width: 200,
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
                              return Signin_Page();
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
                      width: 60,
                      height: 60,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Image(
                              image: AssetImage('assets/images1/google.png'))),
                    ),
                    SizedBox(
                      width: 60,
                      height: 60,
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
