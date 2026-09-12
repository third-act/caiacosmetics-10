import 'package:flutter/material.dart';

import '../models/product.dart';
import '../models/skin_profile.dart';
import '../services/mock_data_service.dart';
import '../ui/common/app_colors.dart';
import '../ui/common/app_haptics.dart';
import '../ui/common/app_radius.dart';
import '../ui/common/app_shadows.dart';
import '../ui/common/app_space.dart';
import '../ui/shared_widgets/pressable_card.dart';
import '../ui/shared_widgets/section_header.dart';
import '../ui/shared_widgets/snap_carousel.dart';
import 'widgets/caia_header.dart';
import 'widgets/metric_widgets.dart';
import 'widgets/product_card.dart';

class HemView extends StatelessWidget {
  const HemView({super.key, required this.onScanAgain, required this.onOpenHudscan});

  final VoidCallback onScanAgain;
  final VoidCallback onOpenHudscan;

  @override
  Widget build(BuildContext context) {
    final profile = MockDataService.skinProfile;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: FrostedHeader(
            trailing: IconButton(
              onPressed: () => AppHaptics.selection(),
              icon: const Icon(Icons.history_rounded, color: AppColors.ink),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CaiaLogo(),
                const SizedBox(height: AppSpace.lg),
                Text(
                  'Hej Elsa',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: AppSpace.xs),
                Text(
                  'Skannad för ${profile.scannedDaysAgo} dagar sedan · ${profile.typeAndUndertone}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpace.screen),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _ScanHeroCard(profile: profile, onTap: onOpenHudscan),
                const SizedBox(height: AppSpace.section),
                _PrimaryCta(onTap: onScanAgain),
                const SizedBox(height: AppSpace.section),
                const SectionHeader(title: 'Nästa steg i morgonrutinen'),
                const SizedBox(height: AppSpace.lg),
                ProductCard(
                  product: MockDataService.recommendations.first,
                  onTap: onOpenHudscan,
                ),
                const SizedBox(height: AppSpace.section),
                const SectionHeader(title: 'Populärt just nu'),
                const SizedBox(height: AppSpace.lg),
                SnapCarousel(
                  itemCount: MockDataService.forDigProducts.length,
                  itemBuilder: (context, index) {
                    final product = MockDataService.forDigProducts[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        right: index == MockDataService.forDigProducts.length - 1
                            ? 0
                            : AppSpace.md,
                      ),
                      child: _CompactProductTile(product: product),
                    );
                  },
                ),
                const SizedBox(height: AppSpace.section),
                _EditorialHero(),
                const SizedBox(height: AppSpace.xxl),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ScanHeroCard extends StatelessWidget {
  const _ScanHeroCard({required this.profile, required this.onTap});

  final SkinProfile profile;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return PressableCard(
      onTap: onTap,
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppRadius.card),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 11,
                  child: Image.asset(
                    'assets/images/hem_lifestyle_face.jpg',
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Positioned(
                top: AppSpace.lg,
                right: AppSpace.lg,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.92),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    profile.shadeCode,
                    style: const TextStyle(
                      color: AppColors.ink,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: AppSpace.lg,
                bottom: AppSpace.lg,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Glow-index',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.8,
                      ),
                    ),
                    Text(
                      '${profile.glowIndex}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 52,
                        fontWeight: FontWeight.w800,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpace.lg),
            child: MetricRow(
              moisture: profile.moisture,
              evenness: profile.evenness,
              redTones: profile.redTones,
            ),
          ),
        ],
      ),
    );
  }
}

class _PrimaryCta extends StatelessWidget {
  const _PrimaryCta({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.accentSoft,
      borderRadius: BorderRadius.circular(AppRadius.pill),
      child: InkWell(
        onTap: () {
          AppHaptics.light();
          onTap();
        },
        borderRadius: BorderRadius.circular(AppRadius.pill),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpace.lg),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.face_retouching_natural_rounded, color: AppColors.accent),
              SizedBox(width: AppSpace.sm),
              Text(
                'Skanna igen',
                style: TextStyle(
                  color: AppColors.accent,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CompactProductTile extends StatelessWidget {
  const _CompactProductTile({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        boxShadow: AppShadows.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppRadius.card),
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(product.imageAsset, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpace.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: AppSpace.xs),
                Text(
                  '${product.priceKr} kr',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.ink,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EditorialHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.card),
        boxShadow: AppShadows.cardShadow,
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(
              'assets/images/hem_hero_wakemeup.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: AppSpace.lg,
            bottom: AppSpace.lg,
            right: AppSpace.lg,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wake Me Up',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: AppSpace.xs),
                Text(
                  'Din shortcut till en utvilad, strålande look.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
