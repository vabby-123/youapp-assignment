import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp/bloc/auth_bloc.dart';
import 'package:youapp/bloc/auth_event.dart';
import 'package:youapp/bloc/auth_state.dart';
import 'package:youapp/models/user.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Authenticated) {
            User user = state.user;
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text('Email: ${user.email}'),
                  Text('First Name: ${user.firstName}'),
                  Text('Last Name: ${user.lastName}'),
                  Text('Zodiac Sign: ${user.zodiacSign}'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Handle profile update
                    },
                    child: Text('Update Profile'),
                  ),
                ],
              ),
            );
          } else if (state is AuthLoading) {
            return CircularProgressIndicator();
          } else {
            return Center(child: Text('No profile data'));
          }
        },
      ),
    );
  }
}
