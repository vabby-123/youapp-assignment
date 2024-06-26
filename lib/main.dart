import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp/bloc/auth_bloc.dart';
import 'package:youapp/screens/login_screen.dart';
import 'package:youapp/screens/register_screen.dart';
import 'package:youapp/screens/profile_screen.dart';

void main() {
  runApp(YouApp());
}

class YouApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: 'YouApp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
        routes: {
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/profile': (context) => ProfileScreen(),
        },
      ),
    );
  }
}
