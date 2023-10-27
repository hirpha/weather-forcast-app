import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/screens/home.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  Future loginUser() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Future.delayed(const Duration(seconds: 2), () {
      String? email = preferences.getString("email");
      String? password = preferences.getString("password");
      if (email == emailController.text &&
          passwordController.text == password) {
        isLoading = false;
        GoRouter.of(context).pushReplacementNamed('home');
      } else {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Color.fromARGB(255, 228, 26, 26),
            content:
                Text("Unable to open login, eamil or password is wrong ")));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff14306F),
      body: Form(
        key: formKey,
        child: Container(
          margin: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .15),
                    width: double.infinity,
                    height: 200,
                    child: Image.asset(
                      'assets/clouds.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: emailController,
                      validator: (email) {
                        final RegExp emailRegex = RegExp(
                            r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');

                        if (email.toString().isEmpty) {
                          return "Email must not be empty";
                        }
                        if (!emailRegex.hasMatch(email.toString().trim())) {
                          return "Please enter corrwnct email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email),
                          label: const Text("Email"),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: passwordController,
                      validator: (pass) {
                        if (pass.toString().isEmpty) {
                          return "Please enter password";
                        } else if (pass.toString().length < 4) {
                          return "Password must not lessthan 4 symbol";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email),
                          label: const Text("Password"),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      height: 60,
                      margin: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: const Color(0xff14306F),
                        ),
                        child: isLoading
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text("Signing in...")
                                ],
                              )
                            : const Text("Sigin in"),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            loginUser();
                          }
                        },
                      )),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * .33,
                            child: const Divider(
                              thickness: 2,
                              color: Colors.grey,
                            )),
                        TextButton(
                            onPressed: () {
                              GoRouter.of(context).pushNamed("signup");
                            },
                            child: const Text("Sigin up")),
                        Container(
                            width: MediaQuery.of(context).size.width * .33,
                            child: const Divider(
                              thickness: 2,
                              color: Colors.grey,
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
