import 'dart:convert';

import 'package:arch_tech_task/data/data.dart';
import 'package:arch_tech_task/endpoints/endpoints.dart';
import 'package:arch_tech_task/launch_model/launch_model.dart';

class LaunchesRepository {
  final DataService dataService;

  LaunchesRepository({required this.dataService});

  Future<List<LaunchModel>> getAllLaunches() async {
    try {
      final response = await dataService.get('${Endpoints.baseUrl}/launches');
      if (response.statusCode == 200) {
        final List<dynamic> decodedJson = jsonDecode(response.body);
        final List<LaunchModel> launches =
            decodedJson.map((json) => LaunchModel.fromJson(json)).toList();
        return launches;
      } else {
        throw Exception('Failed to load launches');
      }
    } catch (e) {
      throw Exception('Failed to load launches: $e');
    }
  }

  Future<LaunchModel> getLauncheByFlightNumber(String flightNumber) async {
    try {
      final response =
          await dataService.get('${Endpoints.baseUrl}/launches/$flightNumber');
      if (response.statusCode == 200) {
        final dynamic decodedJson = jsonDecode(response.body);
        final LaunchModel launches =
            decodedJson.map((json) => LaunchModel.fromJson(json));
        return launches;
      } else {
        throw Exception('Failed to load launches');
      }
    } catch (e) {
      throw Exception('Failed to load launches: $e');
    }
  }
}
