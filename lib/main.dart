import 'package:el3wnn/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants/styles.dart';

import 'features/SplashScreen/Splash.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "El3wn",
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme(
          Theme.of(context).textTheme,
        ),

        colorScheme: ColorScheme.light(background: kBackgroundColro, primary: kMainButColor),

        useMaterial3: true,
      ),

      home: MyCustomSplashScreen(),
    );
  }
}
