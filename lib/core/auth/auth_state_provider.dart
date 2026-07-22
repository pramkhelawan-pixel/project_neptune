import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../services/supabase_service.dart';

final authStateChangesProvider = StreamProvider<AuthState>((ref) {
  return SupabaseService.client.auth.onAuthStateChange;
});

final currentSessionProvider = Provider<Session?>((ref) {
  return SupabaseService.client.auth.currentSession;
});

final currentUserProvider = Provider<User?>((ref) {
  return SupabaseService.client.auth.currentUser;
});