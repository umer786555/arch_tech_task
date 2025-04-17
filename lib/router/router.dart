import 'package:arch_tech_task/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AllLauncehesRoute.page, initial: true),
        AutoRoute(page: SingleLaunchRoute.page),
        AutoRoute(page: VideoPlayerRoute.page),
      ];
}
