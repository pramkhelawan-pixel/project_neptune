import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> blacktailHookKnowledge = [
  KnowledgeRecord(
    id: 'NKS-BLK-HOOK-0001',
    species: 'Blacktail',
    targetSpecies: const ['Blacktail'],
    category: KnowledgeCategory.hook,
    title: 'Size 4 Fine Wire Hook',
    description:
    'A small, fine wire size 4 hook allows bait to move naturally and improves hook-up rates on notoriously bait-shy Blacktail.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-BLK-HOOK-0001',
        reliability: 0.92,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'blacktail',
      'fine wire hook',
      'size 4',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-BLK-HOOK-0002',
    species: 'Blacktail',
    targetSpecies: const ['Blacktail'],
    category: KnowledgeCategory.hook,
    title: 'Size 2 Fine Wire Hook',
    description:
    'A size 2 fine wire hook is suitable for larger Blacktail while still allowing a natural, subtle bait presentation.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-BLK-HOOK-0002',
        reliability: 0.86,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Spring',
    ],
    tags: const [
      'blacktail',
      'fine wire hook',
      'size 2',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
