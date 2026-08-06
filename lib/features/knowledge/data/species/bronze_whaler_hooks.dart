import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> bronzeWhalerHookKnowledge = [
  KnowledgeRecord(
    id: 'NKB-BWS-HOOK-0001',
    species: 'Bronze Whaler',
    targetSpecies: const ['Bronze Whaler'],
    category: KnowledgeCategory.hook,
    title: 'Circle Hook 8/0-10/0',
    description:
    'A strong circle hook in 8/0-10/0 gives reliable jaw hook-ups and simplifies release, reducing gut-hooking risk on a hard-pulling species.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-BWS-009',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'Eastern Cape',
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
    ],
    tags: const [
      'hook',
      'circle hook',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-BWS-HOOK-0002',
    species: 'Bronze Whaler',
    targetSpecies: const ['Bronze Whaler'],
    category: KnowledgeCategory.hook,
    title: '150lb Wire Trace',
    description:
    'A wire trace of at least 150lb is essential; the Bronze Whaler\'s sharp teeth will cut through mono or fluorocarbon leader during the fight.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-BWS-010',
        reliability: 0.91,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
    ],
    seasons: const [
      'Summer',
      'Autumn',
    ],
    tags: const [
      'hook',
      'wire trace',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
