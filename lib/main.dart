import 'package:flutter/material.dart';
import 'package:gutendex_app/config/app_theme.dart';
import 'package:gutendex_app/config/constants.dart';
import 'package:gutendex_app/providers/book_provider.dart';
import 'package:gutendex_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => BookProvider(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
