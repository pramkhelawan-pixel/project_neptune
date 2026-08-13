import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';
import 'core/config/app_config.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables.
  await dotenv.load(fileName: '.env');

  // Validate required configuration.
  AppConfig.validate();

  // Initialise Supabase.
  //
  // authFlowType is set to implicit rather than the package default (pkce)
  // because password recovery is completed on a different device/browser
  // than the one that requested it (app -> email -> GitHub Pages page).
  // PKCE's code exchange requires a verifier stored on the requesting
  // client, which the recovery browser never has access to; implicit
  // embeds the session directly in the redirect URL instead, so it works
  // across devices. This app has no OAuth/magic-link flows, so the only
  // thing this affects is password recovery.
  await Supabase.initialize(
    url: AppConfig.supabaseUrl,
    publishableKey: AppConfig.supabaseAnonKey,
    authOptions: const FlutterAuthClientOptions(
      authFlowType: AuthFlowType.implicit,
    ),
  );

  // Initialise Firebase + Crashlytics. Web is not configured (see
  // firebase_options.dart), so this app only runs on Android/iOS.
  if (!kIsWeb) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Only report crashes from release builds; debug builds stay local.
    await FirebaseCrashlytics.instance
        .setCrashlyticsCollectionEnabled(!kDebugMode);

    FlutterError.onError =
        FirebaseCrashlytics.instance.recordFlutterFatalError;
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  runApp(
    const ProviderScope(
      child: NeptuneApp(),
    ),
  );
}