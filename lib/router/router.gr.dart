// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:arch_tech_task/all_launcehes_screen.dart' as _i1;
import 'package:auto_route/auto_route.dart' as _i2;

abstract class $AppRouter extends _i2.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    AllLauncehesRoute.name: (routeData) {
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AllLauncehesScreen(),
      );
    }
  };
}

/// generated route for
/// [_i1.AllLauncehesScreen]
class AllLauncehesRoute extends _i2.PageRouteInfo<void> {
  const AllLauncehesRoute({List<_i2.PageRouteInfo>? children})
      : super(
          AllLauncehesRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllLauncehesRoute';

  static const _i2.PageInfo<void> page = _i2.PageInfo<void>(name);
}
