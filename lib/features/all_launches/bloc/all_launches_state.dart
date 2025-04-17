part of 'all_launches_bloc.dart';

@immutable
sealed class AllLaunchesState extends Equatable {}

final class AllLaunchesInitial extends AllLaunchesState {
  @override
  List<Object?> get props => [];
}

final class AllLaunchesLoading extends AllLaunchesState {
  @override
  List<Object?> get props => [];
}

final class AllLaunchesLoaded extends AllLaunchesState {
  final List<LaunchModel> launches;
  final String? selectedFlightNumber;
  final bool navigate;

  AllLaunchesLoaded({
    required this.launches,
    this.selectedFlightNumber,
    this.navigate = false,
  });

  AllLaunchesLoaded copyWith({
    List<LaunchModel>? launches,
    String? selectedFlightNumber,
    bool? navigate,
  }) {
    return AllLaunchesLoaded(
      launches: launches ?? this.launches,
      selectedFlightNumber: selectedFlightNumber ?? this.selectedFlightNumber,
      navigate: navigate ?? this.navigate,
    );
  }

  @override
  List<Object?> get props => [launches, selectedFlightNumber, navigate];
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

