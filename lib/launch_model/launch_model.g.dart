// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchModel _$LaunchModelFromJson(Map<String, dynamic> json) => LaunchModel(
      flight_number: (json['flight_number'] as num).toInt(),
      mission_name: json['mission_name'] as String?,
      launch_year: json['launch_year'] as String?,
      launch_success: json['launch_success'] as bool?,
      links: Links.fromJson(json['links'] as Map<String, dynamic>),
      details: json['details'] as String?,
    );

Map<String, dynamic> _$LaunchModelToJson(LaunchModel instance) =>
    <String, dynamic>{
      'flight_number': instance.flight_number,
      'mission_name': instance.mission_name,
      'launch_year': instance.launch_year,
      'launch_success': instance.launch_success,
      'links': instance.links,
      'details': instance.details,
    };

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      mission_patch: json['mission_patch'] as String?,
      mission_patch_small: json['mission_patch_small'] as String?,
      video_link: json['video_link'] as String?,
      youtube_id: json['youtube_id'] as String?,
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'mission_patch': instance.mission_patch,
      'mission_patch_small': instance.mission_patch_small,
      'video_link': instance.video_link,
      'youtube_id': instance.youtube_id,
    };
