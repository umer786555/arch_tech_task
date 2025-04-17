import 'package:equatable/equatable.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class VideoPlayerState extends Equatable {
  const VideoPlayerState();

  @override
  List<Object?> get props => [];
}

class VideoPlayerInitial extends VideoPlayerState {}

class VideoPlayerLoading extends VideoPlayerState {}

class VideoPlayerReady extends VideoPlayerState {
  final YoutubePlayerController controller;
  final PlayerState playerState;

  const VideoPlayerReady({
    required this.controller,
    this.playerState = PlayerState.playing,
  });

  VideoPlayerReady copyWith({
    YoutubePlayerController? controller,
    PlayerState? playerState,
  }) {
    return VideoPlayerReady(
      controller: controller ?? this.controller,
      playerState: playerState ?? this.playerState,
    );
  }

  @override
  List<Object?> get props => [controller, playerState];
}

class VideoPlayerError extends VideoPlayerState {
  final String message;

  const VideoPlayerError({required this.message});

  @override
  List<Object?> get props => [message];
}
