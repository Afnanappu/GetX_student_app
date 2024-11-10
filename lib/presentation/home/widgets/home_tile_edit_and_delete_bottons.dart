import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/persistance/student/model/student_model.dart';
import 'package:student_app_getx/persistance/student/student_db.dart';
import 'package:student_app_getx/presentation/student_add/screen_student_add.dart';

class HomeTileEditAndDeleteButtons extends StatelessWidget {
  const HomeTileEditAndDeleteButtons({
    super.key,
    required this.services,
    required this.student,
  });

  final StudentDB services;
  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        IconButton(
          onPressed: () {
            Get.to(() => ScreenStudentAdd(
                  isUpdate: true,
                  student: student,
                ));
          },
          icon: const Icon(
            Icons.edit,
            color: Colors.blue,
          ),
        ),
        IconButton(
            onPressed: () {
              Get.defaultDialog(
                  title: 'Delete student',
                  middleText: 'Are you sure?',
                  actions: [
                    TextButton(
                        onPressed: () async {
                          await services.deleteStudent(student);
                          Get.back();
                        },
                        child: const Text('Yes')),
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('No'))
                  ]);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ))
      ],
    );
  }
}
