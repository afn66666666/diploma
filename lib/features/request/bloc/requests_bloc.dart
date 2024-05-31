import 'package:flutter_bloc/flutter_bloc.dart';

part 'requests_event.dart';
part 'requests_state.dart';


class RequestBloc extends Bloc<RequestEvent, RequestsState> {
  RequestBloc() : super(RequestsInitial()) {
    on<RequestEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}