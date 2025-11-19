import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:goal_poacher_mobile/screens/menu.dart';
import 'package:goal_poacher_mobile/screens/login.dart';


void main() {
  runApp(const GoalPoacher());
}

class GoalPoacher extends StatelessWidget {
  const GoalPoacher({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Goal Poacher',
        theme: ThemeData(
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xFF004D40),  
            onPrimary: Colors.white,
            secondary: Color(0xFFFFD700), 
            onSecondary: Colors.white,
            error: Colors.red,
            onError: Colors.white,
            background: Colors.white, 
            onBackground: Colors.white,
            surface: Colors.white,
            onSurface: Colors.black,
          ),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF004D40),
            foregroundColor: Colors.white,
          ),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.white), 
          ),
        ),
        home: const LoginPage(),
      ),
    );
  }
}

