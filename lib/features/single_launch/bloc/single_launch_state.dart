part of 'single_launch_bloc.dart';

sealed class SingleLaunchState extends Equatable {
  const SingleLaunchState();
  
 
}

final class SingleLaunchInitial extends SingleLaunchState {
  @override
  List<Object?> get props => [];
}

final class SingleLaunchLoading extends SingleLaunchState {
  @override
  List<Object?> get props => [];
}
final class SingleLaunchLoaded extends SingleLaunchState {
  final LaunchModel launch;

  const SingleLaunchLoaded({required this.launch});

  @override
  List<Object?> get props => [launch];
}
final class SingleLaunchError extends SingleLaunchState {
  final String message;

  const SingleLaunchError({required this.message});

  @override
  List<Object?> get props => [message];
}