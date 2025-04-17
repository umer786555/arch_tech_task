part of 'all_launches_bloc.dart';

@immutable
sealed class AllLaunchesEvent {}

class FetchAllLaunches extends AllLaunchesEvent {}

class CardTapped extends AllLaunchesEvent {
  final String flightNumber;

  CardTapped({required this.flightNumber});

}