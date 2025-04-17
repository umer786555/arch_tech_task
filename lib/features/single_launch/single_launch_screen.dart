import 'package:arch_tech_task/common_utilities/error_ui.dart';
import 'package:arch_tech_task/common_utilities/lottie_view.dart';
import 'package:arch_tech_task/features/all_launches/ui/launch_card.dart';
import 'package:arch_tech_task/features/single_launch/bloc/single_launch_bloc.dart';
import 'package:arch_tech_task/launches_repository/launches_repository.dart';
import 'package:arch_tech_task/router/router.gr.dart';
import 'package:arch_tech_task/service_locator/service_locator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

@RoutePage()
class SingleLaunchScreen extends StatelessWidget {
  const SingleLaunchScreen({super.key, required this.flightNumber});

  final String flightNumber;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SingleLaunchBloc(getIt<LaunchesRepository>())
        ..add(FetchSingleLaunch(flightNumber: flightNumber)),
      child: BlocBuilder<SingleLaunchBloc, SingleLaunchState>(
        builder: (context, state) {
          if (state is SingleLaunchLoading) {
            return const LottieView(
                lottieToShow: 'assets/rocket_launching.json',
                message: 'Loading...');
          }
          if (state is SingleLaunchError) {
            return ErrorView(
              errorMessage: 'Something went wrong try again.',
              onRetry: () {
                context
                    .read<SingleLaunchBloc>()
                    .add(FetchSingleLaunch(flightNumber: flightNumber));
              },
            );
          }

          if (state is SingleLaunchLoaded) {
            return Scaffold(
              appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.white),
                title: const Text(
                  'Launch Details',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Colors.black,
              ),
              backgroundColor: Colors.black,
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: CachedImageWidget(
                              imageUrl:
                                  state.launch.links.mission_patch_small ?? '',
                              size: 250,
                            )),
                        Text(
                          state.launch.mission_name ?? '',
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Flight #${state.launch.flight_number}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Mission Result: ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                state.launch.launch_success == true
                                    ? 'Success'
                                    : 'Failed',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            state.launch.details ?? '',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Visibility(
                          visible: state.launch.links.youtube_id != null,
                          child: Bounceable(
                            onTap: () => context.router.push(VideoPlayerRoute(
                                videoId: state.launch.links.youtube_id!)),
                            child: const Icon(Icons.play_circle_fill,
                                color: Colors.red, size: 100),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return const Center(
            child: Text(
              'No data available',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
