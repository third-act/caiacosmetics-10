import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../../ui/common/app_colors.dart';
import '../../ui/common/app_radius.dart';
import '../../ui/common/app_space.dart';
import '../../ui/shared_widgets/pressable_card.dart';

/// Product tile with edge-to-edge image clip — no postage-stamp plate.
class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.breakStack = false,
  });

  final Product product;
  final VoidCallback? onTap;
  final bool breakStack;

  @override
  Widget build(BuildContext context) {
    final card = PressableCard(
      onTap: onTap,
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(AppRadius.card),
            ),
            child: Image.asset(
              product.imageAsset,
              width: 96,
              height: 96,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppSpace.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.ink,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: AppSpace.xs),
                  Text(
                    product.subtitle,
                    style: const TextStyle(
                      color: AppColors.inkMuted,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: AppSpace.sm),
                  Row(
                    children: [
                      Text(
                        '${product.matchPercent} % match',
                        style: const TextStyle(
                          color: AppColors.accent,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${product.priceKr} kr',
                        style: const TextStyle(
                          color: AppColors.ink,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    if (!breakStack) return card;

    return Transform.translate(
      offset: const Offset(12, -8),
      child: card,
    );
  }
}
