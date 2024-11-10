import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/application/home/student_controller.dart';
import 'package:student_app_getx/presentation/home/widgets/grid_tile_builder.dart';
import 'package:student_app_getx/presentation/home/widgets/list_tile_builder.dart';
import 'package:student_app_getx/presentation/home/widgets/my_debounce.dart';
import 'package:student_app_getx/presentation/student_add/screen_student_add.dart';

// ignore: must_be_immutable
class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  final controller = Get.put(StudentController());
  var isGrid = false.obs;
  var isSearchOn = false.obs;
  final db = Debounce();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App bar
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () => isSearchOn.value = !isSearchOn.value,
            icon: const Icon(Icons.search),
          ),
          const SizedBox(
            width: 5,
          ),
          IconButton(
            onPressed: () => isGrid.value = !isGrid.value,
            icon: Obx(
              () => Icon(
                isGrid.value
                    ? Icons.format_list_bulleted_rounded
                    : Icons.grid_view_rounded,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),

      //Body
      body: Column(
        children: [
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(15),
              child: Visibility(
                  visible: isSearchOn.value,
                  child: SearchBar(
                    hintText: 'Search',
                    leading: const Icon(Icons.search),
                    onChanged: (value) {
                      db.debounce(
                        () => controller.fetchAllSearchedStudentsData(value),
                      );
                    },
                    // trailing: [
                    //   IconButton(onPressed: () {

                    //   }, icon: Icon(Icons.close)),
                    // ],
                  )),
            ),
          ),
          Obx(() {
            final studentList = controller.studentList.value;
            return RefreshIndicator.adaptive(
              onRefresh: () async {
                controller.fetchAllStudentData();
              },
              child: studentList.isNotEmpty
                  ? isGrid.value
                      ? CustomGridView(studentList: studentList)
                      : ListTileBuilder(studentList: studentList)
                  : const Center(
                      child: Text('No student'),
                    ),
            );
          }),
        ],
      ),

      //Floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => ScreenStudentAdd());
          // Navigator.of(context).push(MaterialPageRoute(
          //   builder: (context) => ScreenStudentAdd(),
          // ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

