import 'package:arch_tech_task/common_utilities/error_ui.dart';
import 'package:arch_tech_task/common_utilities/lottie_view.dart';
import 'package:arch_tech_task/features/all_launches/bloc/all_launches_bloc.dart';
import 'package:arch_tech_task/features/all_launches/ui/launch_card.dart';
import 'package:arch_tech_task/launches_repository/launches_repository.dart';
import 'package:arch_tech_task/service_locator/service_locator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AllLauncehesScreen extends StatefulWidget {
  const AllLauncehesScreen({super.key});

  @override
  State<AllLauncehesScreen> createState() => _AllLauncehesScreenState();
}

class _AllLauncehesScreenState extends State<AllLauncehesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AllLaunchesBloc(getIt<LaunchesRepository>())..add(FetchAllLaunches()),
      child: BlocConsumer<AllLaunchesBloc, AllLaunchesState>(
        listener: (context, state) {
          if (state is NavigateToSingleLaunchScreenState) {
            print('object');
          }
        },
        builder: (context, state) {
          if (state is AllLaunchesLoading) {
            return const LottieView(
                lottieToShow: 'assets/rocket_launching.json',
                message: 'Loading...');
          }

          if (state is AllLaunchesLoaded) {
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'All Launches',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Colors.black,
              ),
              backgroundColor: Colors.black,
              body: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView.builder(
                    itemCount: state.launches.length,
                    itemBuilder: (BuildContext context, int index) {
                      final launch = state.launches[index];
                      return LaunchCard(
                          launch: launch,
                          onChevronTapped: () {
                            context.read<AllLaunchesBloc>().add(CardTapped(
                                flightNumber: launch.flight_number.toString()));
                          });
                    }),
              ),
            );
          } else {
            return ErrorUi(
              errorMessage: 'Something went wrong try again.',
              onRetry: () {
                context.read<AllLaunchesBloc>().add(FetchAllLaunches());
              },
            );
          }
        },
      ),
    );
  }
}
