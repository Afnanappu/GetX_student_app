import 'dart:developer';

import 'package:student_app_getx/persistance/student/model/student_model.dart';

class DebugStudent {
  void addStudentLog([StudentModel? student]) {
    if (student == null) {
      log(
        'New Student is added',
        name: 'Student',
        time: DateTime.now(),
      );
    } else {
      log(
        'New student added.\nid: ${student.id}\nname: ${student.name}\nage: ${student.age}',
        name: 'Student',
        time: DateTime.now(),
      );
    }
  }

  void updateStudentLog([StudentModel? student]) {
    if (student == null) {
      log(
        'Student data is updated',
        name: 'Student',
        time: DateTime.now(),
      );
    } else {
      log(
        'Student data is updated.\nid: ${student.id}\nname: ${student.name}\nage: ${student.age}',
        name: 'Student',
        time: DateTime.now(),
      );
    }
  }

  void deleteStudentLog([StudentModel? student]) {
    if (student == null) {
      log(
        'Student is deleted',
        name: 'Student',
        time: DateTime.now(),
      );
    } else {
      log(
        'Student is deleted.\nid: ${student.id}\nname: ${student.name}\nage: ${student.age}',
        name: 'Student',
        time: DateTime.now(),
      );
    }
  }
}
