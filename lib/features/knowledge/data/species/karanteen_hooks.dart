import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> karanteenHookKnowledge = [
  KnowledgeRecord(
    id: 'NKS-KRN-HOOK-0001',
    species: 'Karanteen',
    targetSpecies: const ['Karanteen'],
    category: KnowledgeCategory.hook,
    title: 'Size 4 Fine Wire Hook',
    description:
    'A small size 4 fine wire hook suits bread and small natural bait presentations for Karanteen, and is easy on fish destined to be used as live bait.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KRN-HOOK-0001',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
    ],
    tags: const [
      'karanteen',
      'fine wire hook',
      'size 4',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-KRN-HOOK-0002',
    species: 'Karanteen',
    targetSpecies: const ['Karanteen'],
    category: KnowledgeCategory.hook,
    title: 'Size 2 Fine Wire Hook',
    description:
    'A size 2 fine wire hook is suitable for larger Karanteen while still allowing a subtle, natural presentation.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KRN-HOOK-0002',
        reliability: 0.83,
      ),
    ],
    regions: const [
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
    ],
    tags: const [
      'karanteen',
      'fine wire hook',
      'size 2',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
