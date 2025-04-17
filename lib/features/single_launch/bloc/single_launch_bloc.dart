import 'package:arch_tech_task/launch_model/launch_model.dart';
import 'package:arch_tech_task/launches_repository/launches_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'single_launch_event.dart';
part 'single_launch_state.dart';

class SingleLaunchBloc extends Bloc<SingleLaunchEvent, SingleLaunchState> {
  final LaunchesRepository launchesRepository;

  SingleLaunchBloc(this.launchesRepository) : super(SingleLaunchInitial()) {
    on<FetchSingleLaunch>(_onFetchSingleLaunch);
  }

  Future<void> _onFetchSingleLaunch(
    FetchSingleLaunch event,
    Emitter<SingleLaunchState> emit,
  ) async {
    emit(SingleLaunchLoading());
    try {
      final singleLaunch =
          await launchesRepository.getLauncheByFlightNumber(event.flightNumber);

      emit(SingleLaunchLoaded(launch: singleLaunch));
    } catch (e) {
      emit(SingleLaunchError(message: e.toString()));
    }
  }
}
