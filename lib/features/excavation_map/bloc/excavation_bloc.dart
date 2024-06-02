import 'package:flutter_application_2/repositories/excavations/excavations_repository.dart';
import 'package:flutter_application_2/repositories/excavations/models/excavation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'excavation_event.dart';
part 'excavation_state.dart';



class ExcavationBloc extends Bloc<ExcavationEvent, ExcavationsState> {
  ExcavationsRepository excavationsRepository;
  List<Excavation> _excavations = [];
  ExcavationBloc(this.excavationsRepository) : super(ExcavationsInitial()) {
    on<LoadExcavations>((event, emit) async{
      try{
      final loadedData = await excavationsRepository.getExcavations();
      emit (ExcavationsLoadingSuccess(loadedData));
      }
      on Exception catch(e){
        emit (ExcavationsLoadingFailed(e));
      }
    });
  }
}