import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_app_getx/persistance/student/model/student_model.dart';
import 'package:student_app_getx/presentation/home/screen_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Hive initializing
  await Hive.initFlutter();

  //Registering student model if not already registered.
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }

  await Hive.openBox<StudentModel>('studentBox');

  //Main
  runApp(
    //App

    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Student App GetX',
      theme: ThemeData(
          primarySwatch: Colors.amber,
          // colorSchemeSeed: Colors.amber,
          // primaryColor: Colors.amber,

          appBarTheme: const AppBarTheme(
              color: Colors.amberAccent,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Color.fromARGB(63, 129, 102, 7))),
          colorScheme:
              // ColorScheme(
              //   brightness: Brightness.light,
              //   primary: Colors.amber,
              //   onPrimary: const Color.fromARGB(255, 0, 0, 0),
              //   secondary: Colors.amberAccent,
              //   onSecondary: Colors.white,
              //   error: Colors.red,
              //   onError: Colors.white,
              //   surface: const Color.fromARGB(255, 255, 255, 255)!,
              //   onSurface: Colors.black,
              // ),

              ColorScheme.fromSwatch(
            primarySwatch: Colors.amber,
            accentColor: Colors.amberAccent,
            errorColor: Colors.red,
            brightness: Brightness.light,
          ),
          buttonTheme:
              ButtonThemeData(colorScheme: Theme.of(context).colorScheme)),
      home: ScreenHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
