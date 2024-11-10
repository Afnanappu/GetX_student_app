import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:student_app_getx/persistance/student/model/student_model.dart';

class ScreenStudentDetails extends StatelessWidget {
  const ScreenStudentDetails({super.key, required this.student});
  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(student.name),
      ),
      body: Center(
        child: Card(
          color: Colors.amber[50],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.amber[300]!),
          ),
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.amber[50],
                  backgroundImage: kIsWeb
                      ? MemoryImage(
                          base64Decode(student.profile),
                        )
                      : FileImage(
                          File(student.profile),
                        ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Name: ${student.name}',
                      style: CardTextStyle(),
                    ),
                    Text(
                      'Age: ${student.age}',
                      style: CardTextStyle(),
                    ),
                    Text(
                      'Guardian: ${student.father}',
                      style: CardTextStyle(),
                    ),
                    Text(
                      'Ph: ${student.phone}',
                      style: CardTextStyle(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle CardTextStyle() =>
      TextStyle(fontSize: 17, fontWeight: FontWeight.bold);
}
