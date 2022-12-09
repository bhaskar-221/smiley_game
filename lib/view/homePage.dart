import 'package:cis_assignment/controller/loginProvider.dart';
import 'package:cis_assignment/view/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
//HomePage of an App
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Scaffold(
        drawer: Drawer( //Creating drawer in home page
          child: InkWell(
            onTap: (() {
              ref.read(authprovider).logout(); // event to signing out from an app.
            }),
            child: const ListTile(
                title: Text(
                  "LogOut",
                ),
                trailing: Icon(Icons.logout)),
          ),
        ),
        appBar: AppBar(
          title: const Text("Smiley App"),
          backgroundColor: Colors.purple,
        ),
        body: SingleChildScrollView( //Scroll function using singlechildscrollview.
          child: Column(children: [
          const  SizedBox(
              height: 30,
            ),
           const Text(
              "Welcome to Smiley Quiz App ", // Text displayed in the body of the page.
              style: TextStyle(
                fontSize: 21,
              ),
            ),
           const SizedBox(  //SizedBox to create gap between two widgets
              height: 10,
            ),
           const Icon(
              Icons.person,
              size: 42,
            ),
           const SizedBox(
              height: 10,
            ),
           const Text(
              "Choose one of the category to play quiz ", // Text displayed in the body of the page.
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
           const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Arranging widgets horizontally.
              children: [
                InkWell(
                  onTap: (() {
                    Get.to(() => SecondScreen( //Navigation used by Inkwell widget.
                          limitQuestion: 8,
                          questionNumber: 5,
                        ));
                  }),
                  child: Container(
                      height: 200,
                      width: 200,
                      decoration:const BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 1,
                            spreadRadius: 1,
                            color: Colors.grey)
                      ]),
                      padding:const EdgeInsets.all(16),
                      child: Column( 
                        mainAxisAlignment: MainAxisAlignment.center, //arranging widgets at the center vertical of the page.
                        children: const[
                          Text(
                            "5",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 32),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Questions Quiz"),
                        ],
                      )),
                  
                ),
                InkWell(
                  child: Container(
                      height: 200,
                      width: 200,
                      decoration:const BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 1,
                            spreadRadius: 1,
                            color: Colors.grey)
                      ]),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const[
                          Text(
                            "10",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 32),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Questions Quiz"),
                        ],
                      )),
                  onTap: () {
                    Get.to(() => SecondScreen(
                          limitQuestion: 18,
                          questionNumber: 10,
                        ));
                  },
                ),
              ],
            ),
           const  SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  child: Container(
                      height: 200,
                      width: 200,
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 1,
                            spreadRadius: 1,
                            color: Colors.grey)
                      ]),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:const [
                          Text(
                            "15",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 32),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Questions Quiz"),
                        ],
                      )),
                  onTap: () {
                    Get.to(() => SecondScreen(
                          limitQuestion: 28,
                          questionNumber: 15,
                        ));
                  },
                ),
                InkWell(
                  child: Container(
                      height: 200,
                      width: 200,
                      decoration:const  BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 1,
                            spreadRadius: 1,
                            color: Colors.grey)
                      ]),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "20",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 32),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Questions Quiz"),
                        ],
                      )),
                  onTap: () {
                    Get.to(() => SecondScreen(
                          limitQuestion: 38,
                          questionNumber: 20,
                        ));
                  },
                ),
              ],
            ),
          ]),
        ),
      );
    });
  }
}
