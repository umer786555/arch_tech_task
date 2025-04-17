part of 'single_launch_bloc.dart';

sealed class SingleLaunchEvent {
  const SingleLaunchEvent();
}

class FetchSingleLaunch extends SingleLaunchEvent {
  final String flightNumber;

  const FetchSingleLaunch({required this.flightNumber});
}
