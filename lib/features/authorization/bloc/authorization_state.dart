part of 'authorization_bloc.dart';


class AuthorizationState{}

class AuthorizationInitial extends AuthorizationState {}

class AuthorizationLoading extends AuthorizationState {}

class AuthorizationSuccessful extends AuthorizationState {
  final User user;

  AuthorizationSuccessful({required this.user});

}

class AuthorizationFailed extends AuthorizationState {
  final Object? exc;
  AuthorizationFailed(this.exc);
  
}