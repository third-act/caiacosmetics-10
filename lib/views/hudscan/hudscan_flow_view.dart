import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../../models/skin_profile.dart';
import '../../services/mock_data_service.dart';
import '../../ui/common/app_colors.dart';
import '../../ui/common/app_haptics.dart';
import '../../ui/common/app_radius.dart';
import '../../ui/common/app_space.dart';
import '../../ui/common/tab_shell.dart';
import '../../ui/shared_widgets/pressable_card.dart';
import '../../ui/shared_widgets/section_header.dart';
import '../../viewmodels/hudscan_viewmodel.dart';
import '../widgets/caia_header.dart';
import '../widgets/metric_widgets.dart';
import '../widgets/product_card.dart';

class HudscanFlowView extends StatelessWidget {
  const HudscanFlowView({
    super.key,
    required this.viewModel,
    required this.onProductSelected,
  });

  final HudscanViewModel viewModel;
  final ValueChanged<Product> onProductSelected;

  @override
  Widget build(BuildContext context) {
    switch (viewModel.step) {
      case HudscanStep.home:
        return HudscanHomeView(
          onStartScan: viewModel.startScan,
          onViewResults: viewModel.showResultat,
        );
      case HudscanStep.scanning:
        return HudscanScanView(
          onComplete: viewModel.completeScan,
          onBack: viewModel.back,
        );
      case HudscanStep.resultat:
        return HudscanResultatView(
          onBack: viewModel.back,
          onShowRecommendations: viewModel.showRecommendations,
        );
      case HudscanStep.rekommendationer:
        return HudscanRekommendationerView(
          onBack: viewModel.back,
          onProductTap: (product) {
            viewModel.selectProduct(product.id);
            onProductSelected(product);
          },
        );
    }
  }
}

class HudscanHomeView extends StatelessWidget {
  const HudscanHomeView({
    super.key,
    required this.onStartScan,
    required this.onViewResults,
  });

  final VoidCallback onStartScan;
  final VoidCallback onViewResults;

  @override
  Widget build(BuildContext context) {
    final profile = MockDataService.skinProfile;

    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: FrostedHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CaiaLogo(),
                SizedBox(height: AppSpace.lg),
                Text(
                  'Hudscan',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
                ),
                SizedBox(height: AppSpace.xs),
                Text(
                  'Skanna ansiktet och få produkter som passar din hud',
                  style: TextStyle(color: AppColors.inkMuted, fontSize: 14),
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
                PressableCard(
                  onTap: onStartScan,
                  padding: const EdgeInsets.all(AppSpace.xl),
                  child: Column(
                    children: [
                      _FaceOval(
                        imageAsset: 'assets/images/hudscan_face.jpg',
                        size: 180,
                      ),
                      const SizedBox(height: AppSpace.lg),
                      const Text(
                        'Tryck för att skanna',
                        style: TextStyle(
                          color: AppColors.ink,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: AppSpace.sm),
                      Text(
                        'Senaste: glow-index ${profile.glowIndex}',
                        style: const TextStyle(color: AppColors.inkMuted),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpace.section),
                const SectionHeader(title: 'Senaste resultat'),
                const SizedBox(height: AppSpace.lg),
                PressableCard(
                  onTap: onViewResults,
                  padding: const EdgeInsets.all(AppSpace.lg),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(AppRadius.image),
                        child: Image.asset(
                          'assets/images/resultat_banner.jpg',
                          width: 72,
                          height: 72,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: AppSpace.lg),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Din hudprofil',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: AppSpace.xs),
                            Text(
                              profile.summary,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: AppColors.inkMuted,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right_rounded, color: AppColors.inkMuted),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        tabScrollBottomInset,
      ],
    );
  }
}

class HudscanScanView extends StatefulWidget {
  const HudscanScanView({
    super.key,
    required this.onComplete,
    required this.onBack,
  });

  final VoidCallback onComplete;
  final VoidCallback onBack;

  @override
  State<HudscanScanView> createState() => _HudscanScanViewState();
}

class _HudscanScanViewState extends State<HudscanScanView> {
  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(milliseconds: 2400), () {
      if (mounted) widget.onComplete();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpace.screen,
            AppSpace.lg,
            AppSpace.screen,
            AppSpace.md,
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: widget.onBack,
                icon: const Icon(Icons.chevron_left_rounded, color: AppColors.ink),
              ),
              const Expanded(
                child: Text(
                  'Skannar…',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(width: 48),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _FaceOval(
                  imageAsset: 'assets/images/hudscan_face.jpg',
                  size: 260,
                  scanning: true,
                ),
                const SizedBox(height: AppSpace.xl),
                const Text(
                  'Håll ansiktet inom ovalen',
                  style: TextStyle(
                    color: AppColors.ink,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: AppSpace.sm),
                Text(
                  'Analyserar fukt, jämnhet och röda toner',
                  style: TextStyle(color: AppColors.inkMuted.withValues(alpha: 1)),
                ),
                const SizedBox(height: kTabContentPadding),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _FaceOval extends StatelessWidget {
  const _FaceOval({
    required this.imageAsset,
    required this.size,
    this.scanning = false,
  });

  final String imageAsset;
  final double size;
  final bool scanning;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size * 1.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.elliptical(size / 2, size * 0.62)),
        border: Border.all(
          color: scanning ? AppColors.accent : AppColors.blush,
          width: scanning ? 3 : 2,
        ),
        boxShadow: scanning
            ? [
                BoxShadow(
                  color: AppColors.accent.withValues(alpha: 0.25),
                  blurRadius: 24,
                  spreadRadius: 2,
                ),
              ]
            : null,
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        imageAsset,
        fit: BoxFit.cover,
        alignment: const Alignment(0, -0.25),
      ),
    );
  }
}

class HudscanResultatView extends StatelessWidget {
  const HudscanResultatView({
    super.key,
    required this.onBack,
    required this.onShowRecommendations,
  });

  final VoidCallback onBack;
  final VoidCallback onShowRecommendations;

  @override
  Widget build(BuildContext context) {
    final profile = MockDataService.skinProfile;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpace.screen,
              AppSpace.lg,
              AppSpace.screen,
              AppSpace.md,
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: onBack,
                  icon: const Icon(Icons.chevron_left_rounded, color: AppColors.ink),
                ),
                const Expanded(
                  child: Text(
                    'Din hudprofil',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(width: 48),
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
                Text(
                  'Baserat på din senaste scanning',
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpace.lg),
                _AccentGlowCard(profile: profile),
                const SizedBox(height: AppSpace.section),
                Text(
                  profile.summary,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.inkMuted,
                        height: 1.5,
                      ),
                ),
                const SizedBox(height: AppSpace.section),
                Container(
                  padding: const EdgeInsets.all(AppSpace.lg),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(AppRadius.card),
                    boxShadow: const [
                      BoxShadow(color: Color(0x0D333333), blurRadius: 2, offset: Offset(0, 1)),
                      BoxShadow(color: AppColors.shadow, blurRadius: 24, offset: Offset(0, 8)),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Mätvärden',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: AppSpace.lg),
                      MetricBar(label: 'Fukt', value: profile.moisture),
                      MetricBar(label: 'Jämnhet', value: profile.evenness),
                      MetricBar(label: 'Röda toner', value: profile.redTones),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpace.section),
                Material(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(AppRadius.pill),
                  child: InkWell(
                    onTap: () {
                      AppHaptics.light();
                      onShowRecommendations();
                    },
                    borderRadius: BorderRadius.circular(AppRadius.pill),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: AppSpace.lg),
                      child: Center(
                        child: Text(
                          '✨ Se rekommendationer',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        tabScrollBottomInset,
      ],
    );
  }
}

/// Accent-owned surface — blush gradient hero on this screen only.
class _AccentGlowCard extends StatelessWidget {
  const _AccentGlowCard({required this.profile});

  final SkinProfile profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpace.xl),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.card),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF996466),
            Color(0xFFE0CCC7),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
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
                      fontSize: 56,
                      fontWeight: FontWeight.w800,
                      height: 1,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpace.md,
                  vertical: AppSpace.sm,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(AppRadius.pill),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.trending_up_rounded, color: Colors.white, size: 16),
                    SizedBox(width: 4),
                    Text(
                      '+8',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpace.xl),
          Container(height: 1, color: Colors.white.withValues(alpha: 0.25)),
          const SizedBox(height: AppSpace.lg),
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.25),
                ),
                alignment: Alignment.center,
                child: Text(
                  profile.shadeCode,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: AppSpace.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profile.typeAndUndertone,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Din matchning i DEWY DROPS SERUM FOUNDATION',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.85),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HudscanRekommendationerView extends StatelessWidget {
  const HudscanRekommendationerView({
    super.key,
    required this.onBack,
    required this.onProductTap,
  });

  final VoidCallback onBack;
  final ValueChanged<Product> onProductTap;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpace.screen,
              AppSpace.lg,
              AppSpace.screen,
              AppSpace.md,
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: onBack,
                  icon: const Icon(Icons.chevron_left_rounded, color: AppColors.ink),
                ),
                const Expanded(
                  child: Text(
                    'Rekommendationer',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(width: 48),
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadius.card),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      'assets/images/resultat_banner.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpace.lg),
                Text(
                  'Produkter som passar din hud',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: AppSpace.sm),
                Text(
                  'Baserat på glow-index ${MockDataService.skinProfile.glowIndex} och din hudtyp.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: AppSpace.section),
                for (var i = 0; i < MockDataService.recommendations.length; i++) ...[
                  if (i > 0) const SizedBox(height: AppSpace.lg),
                  ProductCard(
                    product: MockDataService.recommendations[i],
                    breakStack: i == 1,
                  onTap: () => onProductTap(MockDataService.recommendations[i]),
                  ),
                ],
              ],
            ),
          ),
        ),
        tabScrollBottomInset,
      ],
    );
  }
}
