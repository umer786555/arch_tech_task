part of 'all_launches_bloc.dart';

@immutable
sealed class AllLaunchesState extends Equatable {}

final class AllLaunchesInitial extends AllLaunchesState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class AllLaunchesLoading extends AllLaunchesState {
  @override
  List<Object?> get props => [];
}

final class AllLaunchesLoaded extends AllLaunchesState {
  final List<LaunchModel> launches;

  AllLaunchesLoaded({required this.launches});

  @override
  List<Object?> get props => [launches];
}

final class AllLaunchesError extends AllLaunchesState {
  final String message;

  AllLaunchesError({required this.message});

  @override
  List<Object?> get props => [message];
}

final class AllLaunchesEmpty extends AllLaunchesState {
  @override
  List<Object?> get props => [];
}

final class NavigateToSingleLaunchScreenState extends AllLaunchesState {
  @override
  List<Object?> get props => [];
}
