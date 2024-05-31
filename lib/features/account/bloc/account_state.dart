part of 'account_bloc.dart';

class AccountState{}

class AccountInitial extends AccountState{}

class LoadingAddData extends AccountState{}

class SuccessLoadedAddData extends AccountState{
  final Map<String,String> viewData;
  SuccessLoadedAddData(this.viewData);
}

class FailedLoadingAddData extends AccountState{
  final Object? exc;
  FailedLoadingAddData(this.exc);
}