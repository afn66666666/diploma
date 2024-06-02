part of 'excavation_bloc.dart';


class ExcavationsState{}

class ExcavationsInitial extends ExcavationsState{}

class ExcavationsLoading extends ExcavationsState{}

class ExcavationsLoadingSuccess extends ExcavationsState{
  final List<Excavation> excavations;
  ExcavationsLoadingSuccess(this.excavations);
}

class ExcavationsLoadingFailed extends ExcavationsState{
  Object exc;
  ExcavationsLoadingFailed(this.exc);
}