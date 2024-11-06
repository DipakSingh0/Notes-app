import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/Controller/dbController.dart';

class Newnotespage extends StatelessWidget {
  final Dbcontroller dbcontroller = Get.put(Dbcontroller());
  // const Newnotespage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dbcontroller dbcontroller = Get.put(Dbcontroller());

    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text(
            'New Notes',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.deepPurple.shade100,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [

      //...................title..................//
              TextFormField(
                controller: dbcontroller.title,
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

      //...................Description..................//
              TextFormField(
                controller: dbcontroller.description,
                decoration: InputDecoration(
                    hintText: "Description",
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



      //...................SAVE BUTTON..................//
              ElevatedButton(
                onPressed: () async {
                  dbcontroller.addNotes();
                  print("saved");
                },
                style: ElevatedButton.styleFrom(
                  iconColor: Colors.white,
                  backgroundColor: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(
                      horizontal: 20, vertical: 15), // Padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                  elevation: 5, // Shadow elevation
                ),
                child: Text(
                  "S A V E",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18, // Text size
                    fontWeight: FontWeight.bold, // Text weight
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
