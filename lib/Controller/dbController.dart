import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:note/Models/notesModel.dart';
import 'package:http/http.dart' as http;

class Dbcontroller extends GetxController {
  String url = "https://6729e7bd6d5fa4901b6eea45.mockapi.io/note";

  RxList<notesmodel> notesList = RxList<notesmodel>();

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController titleDetail = TextEditingController();
  TextEditingController descriptionDetail = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    getNotes();
  }

  Future<void> getNotes() async {

    final response = await http.get(Uri.parse(url));
    var notes = jsonDecode(response.body);

    notesList.clear();
    for (var note in notes) {
      notesList.add(notesmodel.fromJson(note));
    }
    print("Note Get");
  }

  Future<void> addNotes() async {
    var newNotes = notesmodel(
      title: title.text,
      description: description.text,
      date: DateTime.now().toString(),
      time: TimeOfDay.now().toString(),
    );

    if(title.text != "" || description.text !=""){
    var response = await http.post(Uri.parse(url),
        body: jsonEncode(newNotes.toJson()),
        headers: {"Content-type": "application/json"});

        if(response.statusCode == 201 ){
        // if(title.text.isNotEmpty && description.text.isNotEmpty && response.statusCode == 201){

          title.clear();
          description.clear();
          print("Note added!!");
          getNotes();
          Get.snackbar("Success", "Note added successfully");
          
        } else {
      Get.snackbar("Error", "Please fill in all fields");
    }
  }
}
}