import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/share/share_service.dart';
import '../services/supabase_service.dart';

final supabaseProvider = Provider(
      (ref) => SupabaseService.client,
);

final shareServiceProvider = Provider<ShareService>(
      (ref) => ShareService(),
);