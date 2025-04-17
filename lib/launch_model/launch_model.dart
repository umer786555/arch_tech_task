// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'launch_model.g.dart';

@JsonSerializable()
class LaunchModel {
  final int flight_number;
  final String? mission_name;
  final String? launch_year;
  final bool? launch_success;
  final Links links;
  final String? details;
  LaunchModel(
      {required this.flight_number,
      required this.mission_name,
      required this.launch_year,
      required this.launch_success,
      required this.links,
      required this.details});

  factory LaunchModel.fromJson(Map<String, dynamic> json) =>
      _$LaunchModelFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchModelToJson(this);
}

@JsonSerializable()
class Links {
  final String? mission_patch;
  final String? mission_patch_small;
  final String? video_link;
  final String? youtube_id;

  Links(
      {required this.mission_patch,
      required this.mission_patch_small,
      required this.video_link,
      required this.youtube_id});

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}
