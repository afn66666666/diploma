part of 'authorization_bloc.dart';


class AuthorizationState{}

class AuthorizationInitial extends AuthorizationState {}

class LoadingAuthorization extends AuthorizationState {}

class SuccessAuthorized extends AuthorizationState {
  final User user;

  SuccessAuthorized({required this.user});
}

class FailedAuthorized extends AuthorizationState {
  final Object? exc;
  FailedAuthorized(this.exc);
  
}