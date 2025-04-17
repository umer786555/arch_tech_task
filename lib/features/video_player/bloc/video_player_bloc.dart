import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'video_player_event.dart';
import 'video_player_state.dart';

class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {
  YoutubePlayerController? _controller;

  VideoPlayerBloc() : super(VideoPlayerInitial()) {
    on<InitializeVideoPlayer>(_onInitializeVideoPlayer);
    on<VideoPlayerStateChanged>(_onVideoPlayerStateChanged);
    on<EnterFullScreen>(_onEnterFullScreen);
    on<ExitFullScreen>(_onExitFullScreen);
    on<DisposeVideoPlayer>(_onDisposeVideoPlayer);
  }

  void _onInitializeVideoPlayer(
    InitializeVideoPlayer event,
    Emitter<VideoPlayerState> emit,
  ) {
    emit(VideoPlayerLoading());
    try {
      _controller = YoutubePlayerController(
        initialVideoId: event.videoId,
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
        ),
      );

      _controller!.addListener(() {
        if (_controller!.value.playerState != PlayerState.unknown) {
          add(VideoPlayerStateChanged(playerState: _controller!.value.playerState));
        }
      });

      emit(VideoPlayerReady(
        controller: _controller!,
        playerState: PlayerState.playing,
      ));
    } catch (e) {
      emit(VideoPlayerError(message: 'Failed to initialize player: ${e.toString()}'));
    }
  }

  void _onVideoPlayerStateChanged(
    VideoPlayerStateChanged event,
    Emitter<VideoPlayerState> emit,
  ) {
    if (state is VideoPlayerReady) {
      final currentState = state as VideoPlayerReady;
      emit(currentState.copyWith(playerState: event.playerState));
    }
  }

  void _onEnterFullScreen(
    EnterFullScreen event,
    Emitter<VideoPlayerState> emit,
  ) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  void _onExitFullScreen(
    ExitFullScreen event,
    Emitter<VideoPlayerState> emit,
  ) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _onDisposeVideoPlayer(
    DisposeVideoPlayer event,
    Emitter<VideoPlayerState> emit,
  ) {
    _controller?.dispose();
  }

  @override
  Future<void> close() {
    _controller?.dispose();
    return super.close();
  }
}
