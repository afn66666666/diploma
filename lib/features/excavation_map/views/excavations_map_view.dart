import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/excavation_map/bloc/excavation_bloc.dart';
import 'package:flutter_application_2/features/excavation_map/map_screen.dart';
import 'package:flutter_application_2/repositories/excavations/excavations_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class ExcavationsMapView extends StatelessWidget {
  final _excavationBloc = ExcavationBloc(GetIt.I<ExcavationsRepository>());
  ExcavationsMapView({super.key}){
    _excavationBloc.add(LoadExcavations());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Карта раскопок')),
      body:Center(child: BlocBuilder<ExcavationBloc, ExcavationsState>(
        bloc: _excavationBloc,
        builder: (context, state) {
          if(state is ExcavationsLoading){
            return CircularProgressIndicator(); 
          }
          if(state is ExcavationsLoadingSuccess){
            
            return MapScreen.list(excavations: state.excavations);
          }
          return const CircularProgressIndicator();
        },
      ),),
    );
  }
}
