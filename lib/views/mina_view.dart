import 'package:flutter/material.dart';

import '../services/mock_data_service.dart';
import '../ui/common/app_colors.dart';
import '../ui/common/app_radius.dart';
import '../ui/common/app_shadows.dart';
import '../ui/common/app_space.dart';
import '../ui/shared_widgets/pressable_card.dart';
import '../ui/shared_widgets/section_header.dart';
import 'widgets/caia_header.dart';

class MinaView extends StatelessWidget {
  const MinaView({super.key});

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
                  'Mina',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
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
                  padding: const EdgeInsets.all(AppSpace.lg),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(AppRadius.pill),
                        child: Image.asset(
                          'assets/images/hem_lifestyle_face.jpg',
                          width: 56,
                          height: 56,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      const SizedBox(width: AppSpace.lg),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Elsa',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              profile.typeAndUndertone,
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
                const SizedBox(height: AppSpace.section),
                const SectionHeader(title: 'Favoritter'),
                const SizedBox(height: AppSpace.lg),
                _FavoriteTile(
                  title: 'Dewy Drops Serum Concealer',
                  subtitle: '295 kr',
                  imageAsset: 'assets/images/product_concealer.jpg',
                ),
                const SizedBox(height: AppSpace.lg),
                Transform.translate(
                  offset: const Offset(-10, 0),
                  child: _FavoriteTile(
                    title: 'Wake Me Up Cream',
                    subtitle: '295 kr',
                    imageAsset: 'assets/images/product_wake_me_up.jpg',
                  ),
                ),
                const SizedBox(height: AppSpace.section),
                const SectionHeader(title: 'Inställningar'),
                const SizedBox(height: AppSpace.lg),
                Container(
                  padding: const EdgeInsets.all(AppSpace.lg),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(AppRadius.card),
                    boxShadow: AppShadows.cardShadow,
                  ),
                  child: Column(
                    children: [
                      _SettingsRow(label: 'Notiser', value: 'På'),
                      Divider(color: AppColors.hairline, height: AppSpace.section),
                      _SettingsRow(label: 'Språk', value: 'Svenska'),
                      Divider(color: AppColors.hairline, height: AppSpace.section),
                      _SettingsRow(label: 'Marknad', value: 'Sverige'),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpace.xxl),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _FavoriteTile extends StatelessWidget {
  const _FavoriteTile({
    required this.title,
    required this.subtitle,
    required this.imageAsset,
  });

  final String title;
  final String subtitle;
  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        boxShadow: AppShadows.cardShadow,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(AppRadius.card),
            ),
            child: Image.asset(
              imageAsset,
              width: 72,
              height: 72,
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
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: AppSpace.xs),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: AppColors.ink,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsRow extends StatelessWidget {
  const _SettingsRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: const TextStyle(fontSize: 15)),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(color: AppColors.inkMuted, fontSize: 14),
        ),
      ],
    );
  }
}
