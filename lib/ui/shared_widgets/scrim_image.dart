import 'package:flutter/material.dart';

/// Photo with a bottom-weighted scrim so [onImage] type stays readable.
class ScrimImage extends StatelessWidget {
  const ScrimImage({
    super.key,
    required this.imageAsset,
    required this.aspectRatio,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.overlay,
    this.scrimStops = const [0.42, 1.0],
    this.scrimAlphas = const [0.0, 0.68],
  });

  final String imageAsset;
  final double aspectRatio;
  final BoxFit fit;
  final Alignment alignment;
  final Widget? overlay;
  final List<double> scrimStops;
  final List<double> scrimAlphas;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            imageAsset,
            fit: fit,
            alignment: alignment,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: scrimStops,
                colors: [
                  for (final alpha in scrimAlphas)
                    Colors.black.withValues(alpha: alpha),
                ],
              ),
            ),
          ),
          if (overlay != null) overlay!,
        ],
      ),
    );
  }
}

/// White type intended for scrim-backed photos.
TextStyle onImageTitleStyle(BuildContext context) {
  return Theme.of(context).textTheme.titleMedium!.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w700,
      );
}

TextStyle onImageBodyStyle(BuildContext context) {
  return Theme.of(context).textTheme.bodySmall!.copyWith(
        color: Colors.white.withValues(alpha: 0.92),
      );
}
