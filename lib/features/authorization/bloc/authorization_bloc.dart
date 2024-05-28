import 'package:flutter_application_2/repositories/user/models/user.dart';
import 'package:flutter_application_2/repositories/user/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authorization_state.dart';
part 'authorization_event.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  AuthorizeRepository authorizationRepository;
  AuthorizationBloc(this.authorizationRepository)
      : super(AuthorizationInitial()) {
    on<Authorize>((event, emit) async {
      try {
        emit(AuthorizationLoading());
        final user =
            await authorizationRepository.getUser(event.login, event.password);
        emit(AuthorizationSuccessful(user: user));
      } on Exception catch (e) {
        emit(AuthorizationFailed(e));
      }
    });
  }
}
