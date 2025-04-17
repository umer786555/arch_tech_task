import 'package:arch_tech_task/common_utilities/error_ui.dart';
import 'package:arch_tech_task/common_utilities/lottie_view.dart';
import 'package:arch_tech_task/features/video_player/bloc/video_player_bloc.dart';
import 'package:arch_tech_task/features/video_player/bloc/video_player_event.dart';
import 'package:arch_tech_task/features/video_player/bloc/video_player_state.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

@RoutePage()
class VideoPlayerScreen extends StatelessWidget {
  const VideoPlayerScreen({
    super.key,
    required this.videoId,
  });

  final String videoId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          VideoPlayerBloc()..add(InitializeVideoPlayer(videoId: videoId)),
      child: BlocConsumer<VideoPlayerBloc, VideoPlayerState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is VideoPlayerLoading) {
            return const LottieView(
                lottieToShow: 'assets/rocket_launching.json',
                message: 'Loading...');
          } else if (state is VideoPlayerReady) {
            return _buildPlayerWidget(context, state.controller);
          } else if (state is VideoPlayerError) {
            return ErrorView(
              errorMessage: 'Something went wrong try again.',
              onRetry: () {
                context
                    .read<VideoPlayerBloc>()
                    .add(InitializeVideoPlayer(videoId: videoId));
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildPlayerWidget(
      BuildContext context, YoutubePlayerController controller) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () =>
          context.read<VideoPlayerBloc>().add(ExitFullScreen()),
      onEnterFullScreen: () =>
          context.read<VideoPlayerBloc>().add(EnterFullScreen()),
      player: YoutubePlayer(
        controller: controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
      builder: (context, player) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              controller.pause();
              context.router.maybePop();
            },
          ),
          title: const Text(
            'Video Player',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: player,
      ),
    );
  }
}
