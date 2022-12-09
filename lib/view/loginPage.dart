import 'package:cis_assignment/controller/loginProvider.dart';
import 'package:cis_assignment/view/homePage.dart';
import 'package:cis_assignment/view/mainPage.dart';
import 'package:cis_assignment/view/signupPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

//LoginPage for user login

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _form = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: const Text("Smile App"), // title of page
      ),
      body: Form(
        key: _form,
        child: Consumer(builder: (context, ref, child) {
          return ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w300),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //Creating Textform Field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  // Input validation for more authentic result.
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Null Value";
                    }
                  },
                  controller: emailcontroller,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.supervised_user_circle),
                      hintText: "Enter UserName"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  // Textformfield for password
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Null Value";
                    }
                  },
                  controller: passcontroller,
                  decoration: const InputDecoration(
                      hintText: "Enter Password",
                      prefixIcon: Icon(Icons.verified_user),
                      suffixIcon: Icon(Icons.visibility)),
                ),
              ),
              const Padding(
                //Forget passwod button
                padding: const EdgeInsets.all(8.0),
                child: Text("Forget Password?"),
              ),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                  child: Center(
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
                          //Login Button for User that make change in event.
                          child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  onTap: () async {
                    _form.currentState!.save();
                    if (_form.currentState!.validate()) {
                      //Checking whether the user validate or not.
                      final response = await ref.read(authprovider).login(
                          emailcontroller.text.trim(),
                          passcontroller.text.trim());

                      if (response != "Successfully") {
                        Get.defaultDialog(middleText: "$response");
                      } else if (response == "Loading") {
                        Get.defaultDialog(middleText: "Loading");
                      } else {
                        Get.to(() => const MyHomePage());
                      }
                    } else {
                      Get.defaultDialog(title: "Validation Error");
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  TextButton(
                      onPressed: (() {
                        Get.to(() =>
                            const SignUpPage()); //Navigating to SignUp Screen.
                      }),
                      child: const Text("Create an Account.")),
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}
