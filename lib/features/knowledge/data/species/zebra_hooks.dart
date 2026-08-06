import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> zebraHookKnowledge = [
  KnowledgeRecord(
    id: 'NKS-ZBR-HOOK-0001',
    species: 'Zebra',
    targetSpecies: const ['Zebra'],
    category: KnowledgeCategory.hook,
    title: '2/0 Forged Hook',
    description:
    'A 2/0 forged hook provides the strength needed to control Zebra away from reef ledges while remaining a practical size for red bait presentations.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-ZBR-HOOK-0001',
        reliability: 0.91,
      ),
    ],
    regions: const [
      'Eastern Cape',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'zebra',
      'forged hook',
      '2/0',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-ZBR-HOOK-0002',
    species: 'Zebra',
    targetSpecies: const ['Zebra'],
    category: KnowledgeCategory.hook,
    title: '4/0 Forged Hook',
    description:
    'A 4/0 forged hook is suitable for larger Zebra taken from deeper gullies with bigger mussel or crab baits.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-ZBR-HOOK-0002',
        reliability: 0.85,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
      'Spring',
    ],
    tags: const [
      'zebra',
      'forged hook',
      '4/0',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
