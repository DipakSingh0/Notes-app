import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/Controller/dbController.dart';
import 'package:note/Pages/newnotesPage.dart';

import 'noteswidgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Dbcontroller dbcontroller = Get.put(Dbcontroller());
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          "A P I - N O T E",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                dbcontroller.getNotes();
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => Newnotespage());
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: dbcontroller.notesList
                    .map((e) => NotesWidgets(
                          note: e,
                        ))
                    .toList()),
          )),
    );
  }
}
