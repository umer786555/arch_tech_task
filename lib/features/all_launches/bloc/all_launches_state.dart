part of 'all_launches_bloc.dart';

@immutable
sealed class AllLaunchesState {}

final class AllLaunchesInitial extends AllLaunchesState {}

final class AllLaunchesLoading extends AllLaunchesState {}

final class AllLaunchesLoaded extends AllLaunchesState {
  final List<LaunchModel> launches;

  AllLaunchesLoaded({required this.launches});
}

final class AllLaunchesError extends AllLaunchesState {
  final String message;

  AllLaunchesError({required this.message});
}
