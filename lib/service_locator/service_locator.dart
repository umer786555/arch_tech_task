import 'package:arch_tech_task/data/data.dart';
import 'package:arch_tech_task/launches_repository/launches_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<DataService>(() => DataService());

  getIt.registerSingleton<LaunchesRepository>(
      LaunchesRepository(dataService: getIt<DataService>()));
}
