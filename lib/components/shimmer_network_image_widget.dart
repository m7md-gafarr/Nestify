import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;
  final BorderRadiusGeometry borderRadius;

  const ShimmerNetworkImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = BorderRadius.zero,
  });

  Widget _buildShimmer(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.surfaceContainerLow,
      highlightColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Container(
        width: width,
        height: height,
        color: Theme.of(context).colorScheme.surfaceContainerLow,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.network(
        imageUrl,
        fit: fit,
        width: width,
        height: height,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return _buildShimmer(context);
        },
        errorBuilder: (context, error, stackTrace) {
          return _buildShimmer(context);
        },
      ),
    );
  }
}
