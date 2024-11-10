import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/core/functions/image_picker.dart';

class StudentAddProfile extends StatelessWidget {
  const StudentAddProfile({
    super.key,
    required this.image,
  });

  final Rx<String?> image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => image.value = await myImagePicker(),
      child: Obx(
        () => Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(189, 117, 117, 117)),
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(100),
            image: (image.value != null)
                ? DecorationImage(
                    fit: BoxFit.cover,
                    image: kIsWeb
                        ? MemoryImage(base64Decode(image.value!))
                        : FileImage(
                            File(image.value!),
                          ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
