import 'dart:async';

import 'package:cis_assignment/controller/gettingQuestions.dart';
import 'package:cis_assignment/view/scorePage.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

//Screen to play quiz
class SecondScreen extends StatefulWidget {
  SecondScreen({required this.limitQuestion, required this.questionNumber});
  int limitQuestion;
  int questionNumber;
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  //Declaring the data variables

  int ques = 0;
  int ans = 1;
  int num = 1;
  int score = 0;
  int flex = 1;
  int plex = 9;
  bool valueA = false;
  bool valueB = false;
  bool valueC = false;
  bool valueD = false;

  var time = 30;
  Timer? hey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        //Appbar of an app.
        
        backgroundColor: Colors.purple,
        title: Text("Smiley App"),
        elevation: 0,
        centerTitle: true,
      ),
      body: Consumer(

        //Wrapping body with Consumer so update makes UI rebuild.

        builder: ((context, ref, child) {
          var question = ref.watch(getQuestion);

          return question.value != null
              ? Container(
                  color: Colors.grey[350],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Question $num/${widget.questionNumber}",
                        style: TextStyle(color: Colors.black, fontSize: 28),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 200,
                        width: 550,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1,
                                spreadRadius: 1,
                              )
                            ]),
                        child: Image.network("${question.value![ques]}"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Solve the given ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          InkWell(
                            child: Container(
                              height: 40,
                              width: 380,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                        color: Colors.grey)
                                  ]),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("${question.value![ans] - 1}",
                                        style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.purple))
                                  ]),
                            ),
                            onTap: () {
                              ques < widget.limitQuestion //Checking whether the answer is right or wrong.
                                  ? setState(() {
                                      num++;
                                      ques = ques + 2;
                                      ans = ans + 2;
                                      flex = flex + 1;
                                      plex = plex - 1;

                                      score = score + 0;
                                    })
                                  : Get.to(() => ScorePage(
                                        score: score,
                                      ));
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            child: Container(
                              height: 40,
                              width: 380,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                        color: Colors.grey)
                                  ]),
                              child: Center(
                                child: Text("${question.value![ans]}",
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple)),
                              ),
                            ),
                            onTap: () {
                              ques < widget.limitQuestion
                                  ? setState(() {
                                      num++;
                                      ques = ques + 2;
                                      ans = ans + 2;
                                      flex = flex + 1;
                                      plex = plex - 1;

                                      score = score + 10;
                                    })
                                  : Get.to(() => ScorePage(
                                        score: score,
                                      ));
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: (() {
                              ques < widget.limitQuestion
                                  ? setState(() {
                                      num++;
                                      ques = ques + 2;
                                      ans = ans + 2;
                                      flex = flex + 1;
                                      plex = plex - 1;

                                      score = score + 0;
                                    })
                                  : Get.to(() => ScorePage(
                                        score: score,
                                      ));
                            }),
                            child: Container(
                              height: 40,
                              width: 380,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                        color: Colors.grey)
                                  ]),
                              child: Center(
                                child: Text("${question.value![ans] + 1}",
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            child: Container(
                              height: 40,
                              width: 380,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                        color: Colors.grey)
                                  ]),
                              child: Center(
                                child: Text(
                                  "${question.value![ans] + 2}",
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.purple),
                                ),
                              ),
                            ),
                            onTap: () {
                              ques < widget.limitQuestion
                                  ? setState(() {
                                      num++;
                                      ques = ques + 2;
                                      ans = ans + 2;
                                      flex = flex + 1;
                                      plex = plex - 1;

                                      score = score + 0;
                                    })
                                  : Get.to(() => ScorePage(
                                        score: score,
                                      ));
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              : Center(
                  child: Column(
                    children: const [
                      CircularProgressIndicator(
                        color: Colors.purple,
                      ),
                      Text("Wait while fetching questions...")
                    ],
                  ),
                );
        }),
      ),
    );
  }
}
