part of 'cards_list_bloc.dart';


class CardsListEvent{}

class LoadCardsList extends CardsListEvent{
  LoadCardsList();
}

class RefreshCardsList extends CardsListEvent{}

class AddCard extends CardsListEvent{
  final ArchCard card;
  AddCard(this.card);
}