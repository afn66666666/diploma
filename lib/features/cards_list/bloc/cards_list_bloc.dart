import 'dart:developer';

import 'package:flutter_application_2/repositories/cards_list/cards_list_repository.dart';
import 'package:flutter_application_2/repositories/cards_list/models/card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cards_list_state.dart';
part 'cards_list_event.dart';


class CardsListBloc extends Bloc<CardsListEvent, CardsListState> {
  CardsListRepository cardsListRepository;
  CardsListBloc(this.cardsListRepository) : super(CardsListInitial()) {
    on<LoadCardsList>((event, emit) async {
      log('cards list bloc loaded');
      try{
      final cardsList = await cardsListRepository.getCards();
      emit(CardsListLoaded(cards: cardsList));
      } catch(exc){
        emit (CardsListLoadingFailed(exc));
      }
      // TODO: implement event handler
    });
  }
}