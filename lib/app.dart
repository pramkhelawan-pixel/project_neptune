import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/marine/presentation/providers/marine_provider.dart';

class NeptuneApp extends ConsumerStatefulWidget {
  const NeptuneApp({super.key});

  @override
  ConsumerState<NeptuneApp> createState() => _NeptuneAppState();
}

class _NeptuneAppState extends ConsumerState<NeptuneApp>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // This is the primary freshness mechanism on platforms like iOS,
      // not just a backstop on top of marineConditionsProvider's own
      // Timer.periodic. This app has no background-execution entitlement
      // (no UIBackgroundModes, no background_fetch/workmanager), so iOS
      // suspends the whole isolate — timer included — within seconds of
      // backgrounding; nothing runs again until resume. Android is more
      // lenient and may keep the timer ticking for a while, but that's
      // not guaranteed either (Doze/App Standby/OEM battery optimizers
      // can throttle it). Invalidating here also tears down and recreates
      // the provider's Timer via its own ref.onDispose/build cycle, so the
      // 30-min cadence restarts fresh from this moment regardless of
      // platform.
      ref.invalidate(marineConditionsProvider);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'PELAV',
      debugShowCheckedModeBanner: false,
      // PELAV ships a single production visual system for the MVP: the
      // approved dark theme, always -- regardless of the device's system
      // appearance setting. AppTheme.light/AppColorsLight/PelavColors.light
      // are deliberately left in place (unused, not deleted) rather than
      // torn out, in case a light theme is revisited later; this is the
      // only place that decides which one actually renders. theme and
      // darkTheme are both pinned to the same dark ThemeData, and
      // themeMode is pinned to ThemeMode.dark, so a system light *or* dark
      // setting both resolve to the identical approved PELAV dark UI.
      theme: AppTheme.neptune,
      darkTheme: AppTheme.neptune,
      themeMode: ThemeMode.dark,
      routerConfig: AppRouter.router,
    );
  }
}
