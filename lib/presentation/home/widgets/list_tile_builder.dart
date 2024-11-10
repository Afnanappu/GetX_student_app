import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/persistance/student/model/student_model.dart';
import 'package:student_app_getx/persistance/student/student_db.dart';
import 'package:student_app_getx/presentation/home/widgets/home_tile_edit_and_delete_bottons.dart';
import 'package:student_app_getx/presentation/student_details/screen_student_details.dart';

class ListTileBuilder extends StatelessWidget {
  ListTileBuilder({
    super.key,
    required this.studentList,
  });

  final List<StudentModel> studentList;
  final services = Get.put(StudentDB());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: studentList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              onTap: () => Get.to(
                () => ScreenStudentDetails(student: studentList[index]),
              ),
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => ScreenStudentDetails(
              //     student: studentList[index],
              //   ),
              // )),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              title: Text(studentList[index].name),
              subtitle: Text(studentList[index].age),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: kIsWeb
                    ? MemoryImage(base64Decode(studentList[index].profile))
                    : FileImage(File(studentList[index].profile)),
              ),
              tileColor: Colors.amber[100],
              trailing: HomeTileEditAndDeleteButtons(
                  services: services, student: studentList[index]),
            ),
          );
        },
      ),
    );
  }
}
