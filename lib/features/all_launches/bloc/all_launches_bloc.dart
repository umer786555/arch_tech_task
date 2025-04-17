import 'package:arch_tech_task/launch_model/launch_model.dart';
import 'package:arch_tech_task/launches_repository/launches_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'all_launches_event.dart';
part 'all_launches_state.dart';

class AllLaunchesBloc extends Bloc<AllLaunchesEvent, AllLaunchesState> {
  final LaunchesRepository launchesRepository;

  AllLaunchesBloc(this.launchesRepository) : super(AllLaunchesInitial()) {
    on<FetchAllLaunches>((event, emit) async {
      emit(AllLaunchesLoading());
      try {
        final getAllLaunches = await launchesRepository.getAllLaunches();
        emit(AllLaunchesLoaded(launches: getAllLaunches));
      } catch (e) {
        emit(AllLaunchesError(message: e.toString()));
      }
    });
  }
}
