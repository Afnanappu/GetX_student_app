import 'dart:developer';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_app_getx/application/home/student_controller.dart';
import 'package:student_app_getx/core/debug/debug_student.dart';
import 'package:student_app_getx/core/functions/generate_unique_id.dart';
import 'package:student_app_getx/persistance/student/model/student_model.dart';

class StudentDB {
  final Box<StudentModel> _box = Hive.box('studentBox');
  final _logger = DebugStudent();

  List<StudentModel> fetchAllStudent() {
    return _box.values.toList();
  }

  StudentModel? getStudent(int studentId) {
    return _box.get(studentId);
  }

  List<StudentModel> searchForStudents(String value) {
    if (value.isEmpty) fetchAllStudent();
    return _box.values
        .where((student) => student.name.startsWith(value))
        .toList();
  }

  Future<void> addStudent(StudentModel student) async {
    student.id = generateUniqueId();
    log(student.id.toString());
    await _box.put(student.id, student);
    _logger.addStudentLog(student);
    Get.find<StudentController>().fetchAllStudentData();
  }

  Future<void> updateStudent(StudentModel student) async {
    // await student.save();
    // log(student.id);
    await _box.put(student.id, student);
    _logger.updateStudentLog(student);
    Get.find<StudentController>().fetchAllStudentData();
  }

  Future<void> deleteStudent(StudentModel student) async {
    await _box.delete(student.id);
    _logger.deleteStudentLog(student);
    Get.find<StudentController>().fetchAllStudentData();
  }
}
