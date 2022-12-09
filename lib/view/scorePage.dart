import 'package:cis_assignment/controller/loginProvider.dart';
import 'package:cis_assignment/view/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class ScorePage extends StatelessWidget {  //Score Page that dispalys the final score of the quiz.
  ScorePage({super.key, required this.score});
  int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text("Smiley App"),
        backgroundColor: Colors.purple,
      ),
      body: Consumer(builder: (context, ref, child) {
        return Column(
          children: [
           const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                "Congratulations!!!",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300),
              ),
            ),
          const  SizedBox(
              height: 20,
            ),
            Center(child: Text(" You have Secured $score points")), //Use of String Interpolation to display score.
           const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Get.to(() => const MyHomePage()); // ElevatedButton to navigate to home screen
                    },
                    child:const Text("Home Page")),
                // ElevatedButton(
                //     onPressed: () {
                //       ref.read(authprovider).logout();
                //     },
                //     child: const Text("Log Out")),
              ],
            )
          ],
        );
      }),
    );
  }
}
