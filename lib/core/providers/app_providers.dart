import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/supabase_service.dart';

final supabaseProvider = Provider(
      (ref) => SupabaseService.client,
);