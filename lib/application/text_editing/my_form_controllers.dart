import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/persistance/student/model/student_model.dart';

class MyFormController extends GetxController {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneController = TextEditingController();
  final fatherController = TextEditingController();

  void updateFormField([StudentModel? student]) {
    if (student != null) {
      nameController.text = student.name;
      ageController.text = student.age;
      phoneController.text = student.phone;
      fatherController.text = student.father;
    }
  }

  String? nameValidator(String? value) {
    if (value != null &&
        !RegExp(r"^[a-zA-Z]+([ '-][a-zA-Z]+)*$").hasMatch(value)) {
      return 'Name must only contain letters and spaces';
    }
    return null;
  }

  String? phoneNumberValidator(String? value) {
    if (value != null && !RegExp(r"^\d{10}$").hasMatch(value)) {
      return 'Phone number must only contain number without spaces and letters';
    }
    return null;
  }

  String? ageValidator(String? value) {
    if (value != null &&
        !RegExp(r"^(?:1[01][0-9]|120|[1-9]?[0-9])$").hasMatch(value)) {
      return 'Age must only contain number without spaces and letters';
    }
    return null;
  }

  @override
  void onClose() {
    nameController.dispose();
    ageController.dispose();
    phoneController.dispose();
    fatherController.dispose();
    super.onClose();
  }

  // void disposeController() {
  //   nameController.dispose();
  //   ageController.dispose();
  //   phoneController.dispose();
  //   fatherController.dispose();
  // }
}
