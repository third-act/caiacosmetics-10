import 'package:flutter/material.dart';

import '../models/product.dart';
import '../services/mock_data_service.dart';
import '../ui/common/app_colors.dart';
import '../ui/common/app_radius.dart';
import '../ui/common/app_shadows.dart';
import '../ui/common/app_space.dart';
import '../ui/common/tab_shell.dart';
import '../ui/shared_widgets/pressable_card.dart';
import '../ui/shared_widgets/section_header.dart';
import 'widgets/caia_header.dart';
import 'widgets/product_card.dart';

class ForDigView extends StatelessWidget {
  const ForDigView({super.key, required this.onProductTap});

  final ValueChanged<Product> onProductTap;

  @override
  Widget build(BuildContext context) {
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
                  'För dig',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
                ),
                SizedBox(height: AppSpace.xs),
                Text(
                  'Utvalt efter din hudprofil och favoriter',
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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppRadius.card),
                    boxShadow: AppShadows.cardShadow,
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 10,
                        child: Image.asset(
                          'assets/images/for_dig_kits.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: AppSpace.lg,
                        bottom: AppSpace.lg,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gold Coast Kit',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            const SizedBox(height: AppSpace.xs),
                            Text(
                              '15 % rabatt på utvalda set',
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.9),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpace.section),
                const SectionHeader(title: 'Rekommenderat för dig'),
                const SizedBox(height: AppSpace.lg),
                for (var i = 0; i < MockDataService.forDigProducts.length; i++) ...[
                  if (i > 0) const SizedBox(height: AppSpace.lg),
                  ProductCard(
                    product: MockDataService.forDigProducts[i],
                    onTap: () => onProductTap(MockDataService.forDigProducts[i]),
                  ),
                ],
                const SizedBox(height: AppSpace.section),
                PressableCard(
                  padding: EdgeInsets.zero,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.card),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.asset(
                        'assets/images/for_dig_dontmiss.jpg',
                        fit: BoxFit.cover,
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
