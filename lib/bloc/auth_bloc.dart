import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp/bloc/auth_event.dart';
import 'package:youapp/bloc/auth_state.dart';
import 'package:youapp/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final String baseUrl = 'http://techtest.youapp.ai/api';

  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginEvent) {
      yield AuthLoading();
      try {
        final response = await http.post(
          Uri.parse('$baseUrl/login'),
          body: jsonEncode({'email': event.email, 'password': event.password}),
          headers: {'Content-Type': 'application/json'},
        );
        if (response.statusCode == 200) {
          final user = User.fromJson(jsonDecode(response.body));
          yield Authenticated(user);
        } else {
          yield AuthError('Login failed');
        }
      } catch (e) {
        yield AuthError('An error occurred');
      }
    } else if (event is RegisterEvent) {
      yield AuthLoading();
      try {
        final response = await http.post(
          Uri.parse('$baseUrl/register'),
          body: jsonEncode({'email': event.email, 'password': event.password}),
          headers: {'Content-Type': 'application/json'},
        );
        if (response.statusCode == 200) {
          final user = User.fromJson(jsonDecode(response.body));
          yield Authenticated(user);
        } else {
          yield AuthError('Registration failed');
        }
      } catch (e) {
        yield AuthError('An error occurred');
      }
    } else if (event is GetProfileEvent) {
      yield AuthLoading();
      try {
        final response = await http.get(
          Uri.parse('$baseUrl/profile'),
          headers: {'Content-Type': 'application/json'},
        );
        if (response.statusCode == 200) {
          final user = User.fromJson(jsonDecode(response.body));
          yield Authenticated(user);
        } else {
          yield AuthError('Failed to fetch profile');
        }
      } catch (e) {
        yield AuthError('An error occurred');
      }
    }
  }
}
