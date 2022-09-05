import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod_demo/pages/notes_page.dart';
import 'package:flutter_riverpod_demo/theme/custom_theme.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void didChangeDependencies() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: CustomTheme.black,
    ));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Riverpod Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: CustomTheme.black,
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: CustomTheme.elevatedButtonStyle,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: CustomTheme.black,
        ),
      ),
      home: const NotesPage(),

      /// RENOMEAR PARA NOTES
    );
  }
}
