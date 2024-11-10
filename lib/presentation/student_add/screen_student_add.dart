import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/application/text_editing/my_form_controllers.dart';
import 'package:student_app_getx/persistance/student/model/student_model.dart';
import 'package:student_app_getx/persistance/student/student_db.dart';
import 'package:student_app_getx/presentation/student_add/widgets/custom_text_form_field.dart';
import 'package:student_app_getx/presentation/student_add/widgets/student_add_profile.dart';

// ignore: must_be_immutable
class ScreenStudentAdd extends StatelessWidget {
  ScreenStudentAdd({
    super.key,
    this.isUpdate = false,
    StudentModel? student,
  }) {
    if (student != null) {
      formController.updateFormField(student);
      image.value = student.profile;
      studentId = student.id!;
    }
  }
  final _formKey = GlobalKey<FormState>();
  final service = Get.put(StudentDB());
  final bool isUpdate;
  String studentId = '';
  final MyFormController formController = Get.put(MyFormController());

  Rx<String?> image = Rx(null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StudentAddProfile(image: image),

                //name

                CustomTextFormField(
                  controller: formController.nameController,
                  label: 'Name',
                  validator: formController.nameValidator,
                ),

                //age
                CustomTextFormField(
                  controller: formController.ageController,
                  label: 'Age',
                  validator: formController.ageValidator,
                ),

                //phone
                CustomTextFormField(
                  controller: formController.phoneController,
                  label: 'Phone',
                  validator: formController.phoneNumberValidator,
                ),

                //guardian
                CustomTextFormField(
                  controller: formController.fatherController,
                  label: 'Guardian',
                  validator: formController.nameValidator,
                ),
                const SizedBox(
                  height: 10,
                ),
                //Save Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate() &&
                              image.value != null) {
                            try {
                              final student = StudentModel(
                                name: formController.nameController.value.text
                                    .trim(),
                                age: formController.ageController.text.trim(),
                                phone:
                                    formController.phoneController.text.trim(),
                                father:
                                    formController.fatherController.text.trim(),
                                profile: image.string.trim(),
                              );
                              log('Before update');
                              if (isUpdate) {
                                student.id = studentId;
                                await service.updateStudent(student);
                              } else {
                                await service.addStudent(student);
                              }

                              Get.back();
                            } on Exception catch (e) {
                              log(e.toString());
                            }
                          } else {
                            Get.showSnackbar(
                              GetSnackBar(
                                message: isUpdate
                                    ? 'Updating student failed, try to fill the fields'
                                    : 'Adding student is failed, try to fill the fields',
                                borderRadius: 10,
                                backgroundColor: Colors.red,
                                duration: const Duration(seconds: 3),
                                margin: const EdgeInsets.all(10),
                              ),
                            );
                          }
                        },
                        child: Text(
                          isUpdate ? 'Update' : 'Save',
                          style: const TextStyle(color: Colors.black),
                        )),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
