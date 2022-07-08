import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/view/pages/details_pages.dart';
import 'package:newsapp/view/pages/home_pages.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData.light().copyWith(
        platform: TargetPlatform.android,
        textTheme: GoogleFonts.latoTextTheme()
      ),
      home: Root_app(),
    );
  }
}

class Root_app extends StatelessWidget {
  const Root_app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      builder: (_, child) {
        return Material(
          child: child,
        );
      },
      child:Home_page()
    );
  }
}
