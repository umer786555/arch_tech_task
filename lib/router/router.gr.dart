// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:arch_tech_task/features/all_launches/all_launches_screen.dart'
    as _i1;
import 'package:arch_tech_task/features/single_launch/single_launch_screen.dart'
    as _i2;
import 'package:arch_tech_task/features/video_player/video_player.screen.dart'
    as _i3;
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    AllLauncehesRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AllLauncehesScreen(),
      );
    },
    SingleLaunchRoute.name: (routeData) {
      final args = routeData.argsAs<SingleLaunchRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.SingleLaunchScreen(
          key: args.key,
          flightNumber: args.flightNumber,
        ),
      );
    },
    VideoPlayerRoute.name: (routeData) {
      final args = routeData.argsAs<VideoPlayerRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.VideoPlayerScreen(
          key: args.key,
          videoId: args.videoId,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AllLauncehesScreen]
class AllLauncehesRoute extends _i4.PageRouteInfo<void> {
  const AllLauncehesRoute({List<_i4.PageRouteInfo>? children})
      : super(
          AllLauncehesRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllLauncehesRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SingleLaunchScreen]
class SingleLaunchRoute extends _i4.PageRouteInfo<SingleLaunchRouteArgs> {
  SingleLaunchRoute({
    _i5.Key? key,
    required String flightNumber,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          SingleLaunchRoute.name,
          args: SingleLaunchRouteArgs(
            key: key,
            flightNumber: flightNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'SingleLaunchRoute';

  static const _i4.PageInfo<SingleLaunchRouteArgs> page =
      _i4.PageInfo<SingleLaunchRouteArgs>(name);
}

class SingleLaunchRouteArgs {
  const SingleLaunchRouteArgs({
    this.key,
    required this.flightNumber,
  });

  final _i5.Key? key;

  final String flightNumber;

  @override
  String toString() {
    return 'SingleLaunchRouteArgs{key: $key, flightNumber: $flightNumber}';
  }
}

/// generated route for
/// [_i3.VideoPlayerScreen]
class VideoPlayerRoute extends _i4.PageRouteInfo<VideoPlayerRouteArgs> {
  VideoPlayerRoute({
    _i5.Key? key,
    required String videoId,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          VideoPlayerRoute.name,
          args: VideoPlayerRouteArgs(
            key: key,
            videoId: videoId,
          ),
          initialChildren: children,
        );

  static const String name = 'VideoPlayerRoute';

  static const _i4.PageInfo<VideoPlayerRouteArgs> page =
      _i4.PageInfo<VideoPlayerRouteArgs>(name);
}

class VideoPlayerRouteArgs {
  const VideoPlayerRouteArgs({
    this.key,
    required this.videoId,
  });

  final _i5.Key? key;

  final String videoId;

  @override
  String toString() {
    return 'VideoPlayerRouteArgs{key: $key, videoId: $videoId}';
  }
}
