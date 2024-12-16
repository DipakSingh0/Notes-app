// ignore: file_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/Models/notesModel.dart';
import 'package:http/http.dart' as http;
import 'package:note/Pages/homepage.dart';
import 'package:note/Pages/snackbar_widget.dart';

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

    if (title.text != "" || description.text != "") {
      var response = await http.post(Uri.parse(url),
          body: jsonEncode(newNotes.toJson()),
          headers: {"Content-type": "application/json"});

      if (response.statusCode == 201) {
        // if(title.text.isNotEmpty && description.text.isNotEmpty && response.statusCode == 201){
        title.clear();
        description.clear();
        showCustomSnackbar(title: 'Success',  message: 'Note Added',textColor: Colors.green, );
        getNotes();
          Get.to(() => HomePage());
        
      } else {
        showCustomSnackbar(title: 'Error',  message: 'Please fill in all fields',textColor: Colors.red, );

      }
    }
  }

  // Future<void> deleteNotes(String id) async {
  //   // var newUrl = "https://<PROJECT_TOKEN.mockapi.io/tasks/$id";
  //   // var newUrl = url ;
  //   var newUrl =  "https://6729e7bd6d5fa4901b6eea45.mockapi.io/note";
  //   final response = await http.delete(Uri.parse(newUrl));
  //   if (response.statusCode == 200) {
  //     print("Note Deleted!!");
  //       showCustomSnackbar(title: 'Success',  message: 'Note deleted !',textColor: Colors.blue, );

  //     getNotes();
  //     Get.back();
  //   } else {
  //     showCustomSnackbar(title: 'Error',  message: 'Failed to delete note!!',textColor: Colors.red, );

  //   }
  // }
  Future<void> deleteNotes(String id) async {
    // Construct the URL to include the specific note ID
    var newUrl = "https://6729e7bd6d5fa4901b6eea45.mockapi.io/note/$id";
    
    final response = await http.delete(Uri.parse(newUrl));
    
    if (response.statusCode == 200) {
       showCustomSnackbar(
            title: 'Success',  
            message: 'Note deleted!',
            textColor: Colors.blue,
        );
        print("Note Deleted!!");
        getNotes(); 
        Get.back(); 
    } else {
        showCustomSnackbar(
            title: 'Error',  
            message: 'Failed to delete note!!',
            textColor: Colors.red,
        );
    }
}

  Future<void> updateNotes(String id) async {
    var newUrl = "https://6729e7bd6d5fa4901b6eea45.mockapi.io/note/$id";
    // Create an instance of notesmodel with the updated title and description
    var updatedNote = notesmodel(
        title: titleDetail.text, 
        description: descriptionDetail.text
    );

    // Ensure that notesmodel has a toJson method to convert the object to JSON
    var response = await http.put(
        Uri.parse(newUrl),
        body: jsonEncode(updatedNote.toJson()), // Use updatedNote here
        headers: {"Content-type": "application/json"}
    );

    if (response.statusCode == 200) {
        getNotes();
        showCustomSnackbar(
            title: 'Success',  
            message: 'Note updated successfully!',
            textColor: Colors.green,
        );
    } else {
        showCustomSnackbar(
            title: 'Failed',  
            message: 'Note update failed',
            textColor: Colors.red, // Changed to red for failure
        );
    }
}

  // Future<void> updateNotes(String id) async {
  //   // var newUrl = "https://<PROJECT_TOKEN.mockapi.io/tasks/$id";
  //   // var newUrl = url ;
  //   var newUrl =  "https://6729e7bd6d5fa4901b6eea45.mockapi.io/note/$id";
  //   var updatedNote = notesmodel(
  //       title: titleDetail.text, description: descriptionDetail.text);

  //   var response = await http.put(Uri.parse(newUrl),
  //       body: jsonEncode(updateNotes),
  //       headers: {"Content-type": "application/json"});

  //   if (response.statusCode == 200) {
  //     getNotes();
  //       showCustomSnackbar(title: 'Success',  message: 'Note updated successfully!',textColor: Colors.green, );

  //   } else {
  //       showCustomSnackbar(title: 'Failed',  message: 'Note update failed',textColor: Colors.green, );

  //   }
  // }
}
