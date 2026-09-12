import 'package:flutter/material.dart';

import '../../ui/common/app_colors.dart';
import '../../ui/common/app_space.dart';

class CaiaLogo extends StatelessWidget {
  const CaiaLogo({super.key, this.fontSize = 28});

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      'CAIA',
      style: TextStyle(
        color: AppColors.ink,
        fontSize: fontSize,
        fontWeight: FontWeight.w800,
        letterSpacing: 4,
        height: 1,
      ),
    );
  }
}

class FrostedHeader extends StatelessWidget {
  const FrostedHeader({
    super.key,
    required this.child,
    this.trailing,
  });

  final Widget child;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpace.screen,
          AppSpace.sm,
          AppSpace.screen,
          AppSpace.md,
        ),
        child: Row(
          children: [
            Expanded(child: child),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
