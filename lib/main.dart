import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_notifier.dart';
import 'login_screen.dart';
import 'home_screen.dart';
import 'otp_screen.dart';
import 'add_task_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          themeNotifier.loadTheme(); // Load theme from SharedPreferences
          return MaterialApp(
            title: 'To-Do App',
            theme: themeNotifier.getTheme(),
            initialRoute: '/login',
            routes: {
              '/login': (context) => LoginScreen(),
              '/home': (context) => HomeScreen(),
              '/otp': (context) => OTPScreen(),
              '/add_task': (context) => AddTaskScreen(),
            },
          );
        },
      ),
    );
  }
}
