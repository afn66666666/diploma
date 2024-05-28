part of 'authorization_bloc.dart';

class AuthorizationEvent{}

class Authorize extends AuthorizationEvent{
    final String login;
    final String password;
    Authorize({required this.login, required this.password});
}