import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/knowledge_repository_impl.dart';
import '../../repositories/knowledge_repository.dart';
import '../../services/knowledge_service.dart';

final knowledgeRepositoryProvider = Provider<KnowledgeRepository>(
      (ref) => KnowledgeRepositoryImpl(),
);

final knowledgeServiceProvider = Provider<KnowledgeService>(
      (ref) => KnowledgeService(
    repository: ref.watch(knowledgeRepositoryProvider),
  ),
);