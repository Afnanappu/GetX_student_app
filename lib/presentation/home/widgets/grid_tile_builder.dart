import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/persistance/student/model/student_model.dart';
import 'package:student_app_getx/persistance/student/student_db.dart';
import 'package:student_app_getx/presentation/home/widgets/home_tile_edit_and_delete_bottons.dart';
import 'package:student_app_getx/presentation/student_details/screen_student_details.dart';

class CustomGridView extends StatelessWidget {
  CustomGridView({
    super.key,
    required this.studentList,
  });

  final List<StudentModel> studentList;
  final services = Get.find<StudentDB>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: studentList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: ListTile(
            onTap: () => Get.to(
              () => ScreenStudentDetails(
                student: studentList[index],
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            tileColor: const Color.fromARGB(255, 255, 237, 176),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: kIsWeb
                      ? MemoryImage(base64Decode(studentList[index].profile))
                      : FileImage(File(studentList[index].profile)),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  studentList[index].name,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                HomeTileEditAndDeleteButtons(
                    services: services, student: studentList[index])
              ],
            ),
          ),
        );
      },
    );
  }
}
