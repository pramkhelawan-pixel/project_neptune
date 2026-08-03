import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/knowledge_repository_impl.dart';
import '../../domain/repositories/knowledge_repository.dart';
import '../../services/knowledge_service.dart';

final knowledgeRepositoryProvider =
Provider<KnowledgeRepository>(
      (ref) => const KnowledgeRepositoryImpl(),
);

final knowledgeServiceProvider =
Provider<KnowledgeService>(
      (ref) => KnowledgeService(
    repository: ref.watch(
      knowledgeRepositoryProvider,
    ),
  ),
);