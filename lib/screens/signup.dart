import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  bool _visiblePassword = false;
  final formKey = GlobalKey<FormState>();
  bool _visiblePasswordconfirm = false;
  bool isLoading = false;
  Future signupUser() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Future.delayed(const Duration(seconds: 2), () {
      preferences.setString("name", nameController.text);
      preferences.setString("email", emailController.text);
      preferences.setString("password", passwordController.text);
      preferences.setBool("isNew", false);

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Color.fromARGB(255, 43, 104, 2),
          content: Text("You have successfully registered ")));
      GoRouter.of(context).pushReplacementNamed('home');
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
                        top: MediaQuery.of(context).size.height * .1),
                    width: double.infinity,
                    height: 100,
                    child: const Text(
                      "Register for Weather app",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: nameController,
                      validator: (email) {
                        if (email.toString().isEmpty) {
                          return "Name must not be empty";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          label: const Text("Full name"),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
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
                      obscureText: !_visiblePassword,
                      validator: (pass) {
                        if (pass.toString().isEmpty) {
                          return "Please enter password";
                        } else if (pass.toString().length < 4) {
                          return "Password must not lessthan 4 symbol";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _visiblePassword = !_visiblePassword;
                                });
                              },
                              icon: Icon(_visiblePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          label: const Text("Password"),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: confirmPassController,
                      validator: (pass) {
                        if (pass.toString() != passwordController.text) {
                          return "Password not much";
                        }
                        return null;
                      },
                      obscureText: !_visiblePasswordconfirm,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _visiblePasswordconfirm =
                                      !_visiblePasswordconfirm;
                                });
                              },
                              icon: Icon(_visiblePasswordconfirm
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          label: const Text("Confirm Password"),
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
                            : const Text("Sign up"),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            signupUser();
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
                              context.pushNamed('signin');
                            },
                            child: const Text("Sign in")),
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
