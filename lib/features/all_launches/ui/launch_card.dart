import 'package:arch_tech_task/launch_model/launch_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:shimmer/shimmer.dart';

class LaunchCard extends StatelessWidget {
  const LaunchCard({super.key, required this.launch, required this.onChevronTapped});

  final LaunchModel launch;
  final VoidCallback onChevronTapped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Bounceable(
        onTap: onChevronTapped,
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blueGrey,
                        width: 2.0,
                      ),
                    ),
                    child: CachedImageWidget(
                      imageUrl: launch.links.mission_patch_small ?? '',
                      size: 80,
                    )),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        launch.mission_name ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Flight #${launch.flight_number}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Text(
                            'Mission Result: ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            launch.launch_success == true ? 'Success' : 'Failure',
                            style: TextStyle(
                              color: launch.launch_success == true
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  size: 28,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CachedImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double size;

  const CachedImageWidget({
    super.key,
    required this.imageUrl,
    this.size = 60.0,
  });

  @override
  Widget build(BuildContext context) {
    final bool isValidUrl = imageUrl != null;

    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.blueGrey, width: 1),
      ),
      child: ClipOval(
        child: isValidUrl
            ? CachedNetworkImage(
                width: size,
                height: size,
                fit: BoxFit.cover,
                imageUrl: imageUrl!,
                placeholder: (context, url) => _shimmerPlaceholder(),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.rocket, size: 40),
              )
            : const Icon(Icons.rocket, size: 60),
      ),
    );
  }

  Widget _shimmerPlaceholder() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
      ),
    );
  }
}
