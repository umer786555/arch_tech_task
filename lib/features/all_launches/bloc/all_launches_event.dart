part of 'all_launches_bloc.dart';

@immutable
sealed class AllLaunchesEvent {}

class FetchAllLaunches extends AllLaunchesEvent {}
