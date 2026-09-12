import 'package:flutter/material.dart';

import 'ui/common/app_theme.dart';
import 'viewmodels/app_viewmodel.dart';
import 'views/shell_view.dart';
import 'views/splash_view.dart';

class CaiaApp extends StatefulWidget {
  const CaiaApp({super.key});

  @override
  State<CaiaApp> createState() => _CaiaAppState();
}

class _CaiaAppState extends State<CaiaApp> {
  late final AppViewModel _appViewModel;

  @override
  void initState() {
    super.initState();
    _appViewModel = AppViewModel();
  }

  @override
  void dispose() {
    _appViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CAIA Cosmetics',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: ListenableBuilder(
        listenable: _appViewModel,
        builder: (context, _) {
          if (_appViewModel.showSplash) {
            return SplashView(onFinished: _appViewModel.finishSplash);
          }
          return ShellView(appViewModel: _appViewModel);
        },
      ),
    );
  }
}
