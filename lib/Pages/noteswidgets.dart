import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/Models/notesModel.dart';
// import 'package:note/Pages/newnotesPage.dart';

import 'notes_details.dart';

class NotesWidgets extends StatelessWidget {
  final notesmodel note;

  const NotesWidgets({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(NotesDetails(
          note: note,
        ));
      },
      child: Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(note.title!,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      Flexible(
                        child: Text(note.description!,
                            maxLines: 8,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
