import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getQuestion = FutureProvider<List>((ref) async { //Use of Future Provider to get async value.
  List<dynamic> list = [];
  for (int i = 0; i <= 20; i++) {
    final dio = Dio(); //instantiating Dio Class.
    final response = await dio.get("https://marcconrad.com/uob/smile/api.php"); //dio library to read url.
    final result = json.decode(response.data);
    list.add(result['question']);
    list.add(result['solution']);
  }

  return list; // Adding list of questions and solutions to list.
});
