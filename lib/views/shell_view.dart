import 'package:flutter/material.dart';

import '../models/product.dart';
import '../ui/common/app_colors.dart';
import '../ui/common/app_space.dart';
import '../ui/shared_widgets/glass_bar.dart';
import '../ui/shared_widgets/tab_pill.dart';
import '../viewmodels/app_viewmodel.dart';
import '../viewmodels/hudscan_viewmodel.dart';
import 'for_dig_view.dart';
import 'hem_view.dart';
import 'hudscan/hudscan_flow_view.dart';
import 'mina_view.dart';
import 'produkt_detalj_view.dart';

const _tabContentPadding = 128.0;

class ShellView extends StatefulWidget {
  const ShellView({
    super.key,
    required this.appViewModel,
  });

  final AppViewModel appViewModel;

  @override
  State<ShellView> createState() => _ShellViewState();
}

class _ShellViewState extends State<ShellView> {
  late final HudscanViewModel _hudscanViewModel;

  @override
  void initState() {
    super.initState();
    _hudscanViewModel = HudscanViewModel();
  }

  @override
  void dispose() {
    _hudscanViewModel.dispose();
    super.dispose();
  }

  void _openHudscan({bool startScan = false}) {
    widget.appViewModel.selectTab(AppTab.hudscan);
    _hudscanViewModel.reset();
    if (startScan) {
      _hudscanViewModel.startScan();
    }
  }

  void _openProduct(Product product) {
    Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (_) => ProduktDetaljView(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([widget.appViewModel, _hudscanViewModel]),
      builder: (context, _) {
        final tab = widget.appViewModel.tab;

        return Scaffold(
          backgroundColor: AppColors.bg,
          extendBody: true,
          body: IndexedStack(
            index: tab.index,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: _tabContentPadding),
                child: HemView(
                  onScanAgain: () => _openHudscan(startScan: true),
                  onOpenHudscan: () => _openHudscan(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: _tabContentPadding),
                child: ListenableBuilder(
                  listenable: _hudscanViewModel,
                  builder: (context, _) => HudscanFlowView(
                    viewModel: _hudscanViewModel,
                    onProductSelected: _openProduct,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: _tabContentPadding),
                child: ForDigView(onProductTap: _openProduct),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: _tabContentPadding),
                child: const MinaView(),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpace.screen,
              0,
              AppSpace.screen,
              AppSpace.xl,
            ),
            child: GlassBar(
              borderRadius: BorderRadius.circular(AppSpace.xxl),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TabPill(
                        icon: Icons.home_rounded,
                        label: 'Hem',
                        selected: tab == AppTab.hem,
                        axis: Axis.vertical,
                        onTap: () => widget.appViewModel.selectTab(AppTab.hem),
                      ),
                    ),
                    Expanded(
                      child: TabPill(
                        icon: Icons.face_retouching_natural_rounded,
                        label: 'Hudscan',
                        selected: tab == AppTab.hudscan,
                        axis: Axis.vertical,
                        onTap: () => widget.appViewModel.selectTab(AppTab.hudscan),
                      ),
                    ),
                    Expanded(
                      child: TabPill(
                        icon: Icons.explore_rounded,
                        label: 'För dig',
                        selected: tab == AppTab.forDig,
                        axis: Axis.vertical,
                        onTap: () => widget.appViewModel.selectTab(AppTab.forDig),
                      ),
                    ),
                    Expanded(
                      child: TabPill(
                        icon: Icons.auto_awesome_rounded,
                        label: 'Mina',
                        selected: tab == AppTab.mina,
                        axis: Axis.vertical,
                        onTap: () => widget.appViewModel.selectTab(AppTab.mina),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
