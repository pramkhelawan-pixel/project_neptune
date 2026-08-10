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
      title: 'Project Neptune',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.neptune,
      routerConfig: AppRouter.router,
    );
  }
}
