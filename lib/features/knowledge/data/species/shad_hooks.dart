import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> shadHookKnowledge = [
  KnowledgeRecord(
    id: 'NKS-SHD-HOOK-0001',
    species: 'Shad',
    targetSpecies: const ['Shad'],
    category: KnowledgeCategory.hook,
    title: '2/0 Kendal Round Hook',
    description:
    'The most widely used hook for targeting Shad with sardine fillets and butterfly baits. It provides reliable hook penetration while preserving a natural bait presentation.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SHD-HOOK-0001',
        reliability: 0.98,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
      'Western Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: const [
      'hook',
      'kendal',
      '2/0',
      'shad',
      'sardine',
    ],
    verified: true,
    createdAt: DateTime(2026, 7, 29),
    updatedAt: DateTime(2026, 7, 29),
  ),
  KnowledgeRecord(
    id: 'NKS-SHD-HOOK-0002',
    species: 'Shad',
    targetSpecies: const ['Shad'],
    category: KnowledgeCategory.hook,
    title: '3/0 Kendal Round Hook',
    description:
    'Preferred when using larger whole sardines or when specifically targeting bigger Shad. Offers greater holding power while maintaining good bait presentation.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SHD-HOOK-0002',
        reliability: 0.95,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: const [
      'Winter',
      'Spring',
    ],
    tags: const [
      'hook',
      'kendal',
      '3/0',
      'large bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 7, 29),
    updatedAt: DateTime(2026, 7, 29),
  ),
];