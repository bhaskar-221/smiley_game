import 'package:cis_assignment/controller/loginProvider.dart';
import 'package:cis_assignment/view/loginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

//SignUp Page for user registration
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

final _form = GlobalKey<FormState>();
final emailcontroller =
    TextEditingController(); //controller to hold the text inside TextFormField.
final passwordcontroller = TextEditingController();
final fullnamecontroller = TextEditingController();
final confirmpasswordcontroller = TextEditingController();

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Design of AppBar
        backgroundColor: Colors.purple,
        title: const Text("Smiley App"),
        centerTitle: true,
      ),
      body: Form(
        key: _form,
        child: Consumer(
          builder: (context, ref, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                      child: Text(
                    "Sign Up",
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 22),
                  )),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {

                        //Validating textformfield.
                        
                        if (value == null) {
                          return "Null value";
                        } else {
                          return null;
                        }
                      },
                      controller: fullnamecontroller,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.supervised_user_circle),
                          hintText: "Full Name"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Null value";
                        } else {
                          return null;
                        }
                      },
                      controller: emailcontroller,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.supervised_user_circle),
                          hintText: "Email Id"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Null value";
                        } else {
                          return null;
                        }
                      },
                      controller: passwordcontroller,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.supervised_user_circle),
                          hintText: "Password"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Null value";
                        } else {
                          return null;
                        }
                      },
                      controller: confirmpasswordcontroller,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.supervised_user_circle),
                          hintText: "Confirm Password"),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: InkWell(
                      child: Container(
                        height: 40,
                        width: 350,
                        decoration: const BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: const Center(
                            child: Text(
                          "SignUp",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                      ),
                      onTap: () async {
                        _form.currentState!
                            .save(); // to Save the Current State of the form
                        if (_form.currentState!.validate()) {
                          FocusScope.of(context).unfocus();

                          final response = await ref.read(authprovider).signup(
                              // Uploading data using riverpod provider.
                              emailcontroller.text.trim(),
                              passwordcontroller.text.trim());

                          if (response != "Successfully") {
                            //checking whether data uploaded successfully or not.
                            Get.defaultDialog(middleText: "$response");
                          } else {
                            Get.defaultDialog(
                                middleText: "Registered Succesfully",
                                confirm: TextButton(
                                    onPressed: () {
                                      Get.to(() =>
                                          LoginPage()); //Navigating to Login Page once user registered.
                                    },
                                    child: Text("Ok")));
                          }
                        } else {
                          return;
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        onTap: (() {
                          Get.to(() => const LoginPage());
                        }),
                        child: const Text("Already have an account? Login"),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
