import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/persistance/student/model/student_model.dart';
import 'package:student_app_getx/persistance/student/student_db.dart';

class StudentController extends GetxController {
  // //Constructor that fetch data from the DB for the initial state.
  // StudentController() {
  //   log('Controller is created');
  // }

  @override
  void onInit() {
    fetchAllStudentData();
    super.onInit();
  }

  var studentList = Rx<List<StudentModel>>([]);
  final _service = StudentDB();

  void fetchAllStudentData() {
    studentList.value = _service.fetchAllStudent();
  }

  void fetchAllSearchedStudentsData(String value) {
    final list = _service.searchForStudents(value.trim());
    if (!listEquals(list, studentList.value)) studentList.value = list;
  }

  // StudentModel? getStudent(int studentId) {
  //   return _service.getStudent(studentId);
  // }
}
