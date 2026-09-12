import 'dart:async';

import 'package:flutter/material.dart';

import '../ui/common/app_colors.dart';
import '../ui/common/app_space.dart';
import 'widgets/caia_header.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key, required this.onFinished});

  final VoidCallback onFinished;

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    unawaited(
      Future<void>.delayed(const Duration(milliseconds: 2200), () {
        if (mounted) widget.onFinished();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.bg,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/splash_store.jpg',
            fit: BoxFit.cover,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.15),
                  Colors.black.withValues(alpha: 0.55),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppSpace.screen),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CaiaLogo(fontSize: 32),
                  const Spacer(),
                  Text(
                    'Dewy glow,\nScandi-minimal',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: AppSpace.md),
                  Text(
                    'Upptäck smink och hudvård skräddarsytt för dig.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white.withValues(alpha: 0.92),
                        ),
                  ),
                  const SizedBox(height: AppSpace.xxl),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
