import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/Controller/dbController.dart';
import 'package:note/Models/notesModel.dart';

class NotesDetails extends StatelessWidget {
  final notesmodel note;

  const NotesDetails({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    Dbcontroller dbController = Get.put(Dbcontroller());
    dbController.titleDetail.text = note.title.toString();
    dbController.descriptionDetail.text = note.description.toString();

    return Scaffold(
        backgroundColor: Colors.deepPurple.shade100,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,

          title: Text("N O T E S-D E T A I L S",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  print(note.id);
                  dbController.deleteNotes(note.id!);
                },
                icon: Icon(Icons.delete))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              //...................title..................//
              TextFormField(
                controller: dbController.titleDetail,
                decoration: InputDecoration(
                    hintText: "Title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(color: Colors.deepPurple, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(color: Colors.deepPurple, width: 2),
                    ),
                    hintStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              TextFormField(
                controller: dbController.descriptionDetail,
                decoration: InputDecoration(
                    hintText: "Title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(color: Colors.deepPurple, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(color: Colors.deepPurple, width: 2),
                    ),
                    hintStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ),
                SizedBox(
                height: screenSize.height * 0.60,
              ),

              ElevatedButton(
                onPressed: () async {
                  dbController.updateNotes(note.id!);
                  print("Updated");
                },
                child: Text("UPDATE"),
              ),
            ],
          ),
        ));
  }
}
