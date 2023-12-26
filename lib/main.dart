import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/ui/main_screen/main_screen_page.dart';
import 'package:music_player/utilities/main_controller_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  MaterialColor createMaterialColor(Color color) {
    final strengths = <double>[.05];
    final swatch = <int, Color>{};
    final red = color.red;
    final green = color.green;
    final blue = color.blue;

    for (var i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (final strength in strengths) {
      final ds = 0.5 - strength;

      swatch[(strength * 1000).round()] = Color.fromRGBO(
        red + ((ds < 0 ? red : (255 - red)) * ds).round(),
        green + ((ds < 0 ? green : (255 - green)) * ds).round(),
        blue + ((ds < 0 ? blue : (255 - blue)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialBinding: MainBinding(),
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF212A32),
        textTheme: GoogleFonts.poppinsTextTheme(),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white, width: 1.5),
          shape: const StadiumBorder(),
        )),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFF75191),
            shape: const StadiumBorder(),
          ),
        ),
        appBarTheme: AppBarTheme(
            color: Colors.transparent,
            elevation: 0,
            titleTextStyle: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700)),
        colorScheme: ColorScheme.dark(
            primary: createMaterialColor(const Color(0xFF212A32)),
            secondary: const Color(0xFFF75191)),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Color(0xFF303033),
        ),
        useMaterial3: false,
      ),
      home: const MainScreenPage(),
    );
  }
}
