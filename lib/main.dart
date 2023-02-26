import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:maritime/screens/home_screen.dart';
import 'package:maritime/utilities/bindings.dart';
import 'package:maritime/utilities/translation.dart';
import 'models/note_model.dart';
import 'utilities/theme.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>("notes");
  tz.initializeTimeZones();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      theme: CustomThemeData.customLightTheme,
      locale: const Locale("en", "US"),
      translations: Translation(),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      initialBinding: MainBinding(),
    );
  }
}
