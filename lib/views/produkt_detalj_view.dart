import 'package:flutter/material.dart';

import '../models/product.dart';
import '../ui/common/app_colors.dart';
import '../ui/common/app_haptics.dart';
import '../ui/common/app_radius.dart';
import '../ui/common/app_space.dart';
import '../ui/shared_widgets/pressable_card.dart';

class ProduktDetaljView extends StatelessWidget {
  const ProduktDetaljView({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpace.sm),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.chevron_left_rounded, color: AppColors.ink),
                  ),
                  Expanded(
                    child: Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  AppSpace.screen,
                  AppSpace.md,
                  AppSpace.screen,
                  AppSpace.xxl,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppRadius.card),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.asset(product.imageAsset, fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: AppSpace.section),
                    Text(
                      product.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: AppSpace.sm),
                    Row(
                      children: [
                        Text(
                          '${product.matchPercent} % match för din hud',
                          style: const TextStyle(
                            color: AppColors.accent,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '${product.priceKr} kr',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpace.lg),
                    Text(
                      product.description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.inkMuted,
                            height: 1.5,
                          ),
                    ),
                    const SizedBox(height: AppSpace.section),
                    PressableCard(
                      padding: const EdgeInsets.all(AppSpace.lg),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.secondaryPink,
                              borderRadius: BorderRadius.circular(AppRadius.pill),
                            ),
                            child: const Icon(Icons.favorite_border_rounded, color: AppColors.accent),
                          ),
                          const SizedBox(width: AppSpace.md),
                          const Expanded(
                            child: Text(
                              'Spara som favorit',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpace.screen),
              child: Material(
                color: AppColors.accentSoft,
                borderRadius: BorderRadius.circular(AppRadius.pill),
                child: InkWell(
                  onTap: () => AppHaptics.medium(),
                  borderRadius: BorderRadius.circular(AppRadius.pill),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSpace.lg),
                    child: Center(
                      child: Text(
                        'Lägg till i varukorg (mock)',
                        style: TextStyle(
                          color: AppColors.accent,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
