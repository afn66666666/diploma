import 'package:flutter_application_2/repositories/user/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final UserRepository userRepository;

  AccountBloc(this.userRepository) : super(AccountInitial()) {
    on<LoadUserViewData>((event, emit) async{
      userRepository.getUser;
      emit(LoadingAddData());
      try{
      final orgName = await userRepository.getOrganizationName();
      final roleName = await userRepository.getUserRoleName();
      emit (SuccessLoadedAddData({'organization': orgName, 'role': roleName}));
      }
      on Exception catch(e){
        emit (FailedLoadingAddData(e));
      }
    });
  }
}