import 'package:equatable/equatable.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class VideoPlayerEvent extends Equatable {
  const VideoPlayerEvent();

  @override
  List<Object?> get props => [];
}

class InitializeVideoPlayer extends VideoPlayerEvent {
  final String videoId;

  const InitializeVideoPlayer({required this.videoId});

  @override
  List<Object?> get props => [videoId];
}

class VideoPlayerStateChanged extends VideoPlayerEvent {
  final PlayerState playerState;

  const VideoPlayerStateChanged({required this.playerState});

  @override
  List<Object?> get props => [playerState];
}

class EnterFullScreen extends VideoPlayerEvent {}

class ExitFullScreen extends VideoPlayerEvent {}

class DisposeVideoPlayer extends VideoPlayerEvent {}
