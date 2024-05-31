part of 'cards_list_bloc.dart';

class CardsListState {}

class CardsListInitial extends CardsListState {}

class CardsListLoading extends CardsListState {}

class CardsListLoaded extends CardsListState {
  CardsListLoaded({required this.cards});
  final List<ArchCard> cards;
}

class CardsListLoadEnded extends CardsListState{
  CardsListLoadEnded({required this.cards});
  final List<ArchCard> cards;
}

class CardsListLoadingFailed extends CardsListState {
  final Object? exc;
  CardsListLoadingFailed(this.exc);
  
}
