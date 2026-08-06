import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> duckbillRayHookKnowledge = [
  KnowledgeRecord(
    id: 'NKB-DBR-HOOK-0001',
    species: 'Duckbill Ray',
    targetSpecies: const ['Duckbill Ray'],
    category: KnowledgeCategory.hook,
    title: 'Circle Hook 6/0-8/0',
    description:
    'A strong circle hook in 6/0-8/0 handles the Duckbill Ray\'s crushing bite and long fights while minimising deep hooking for an easier release.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DBR-009',
        reliability: 0.87,
      ),
    ],
    regions: const [
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
    id: 'NKB-DBR-HOOK-0002',
    species: 'Duckbill Ray',
    targetSpecies: const ['Duckbill Ray'],
    category: KnowledgeCategory.hook,
    title: '80lb Monofilament Leader',
    description:
    'A heavy monofilament leader of around 80lb resists abrasion from the ray\'s crushing plates and holds up during extended, grinding fights.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DBR-010',
        reliability: 0.82,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: const [
      'Summer',
      'Autumn',
    ],
    tags: const [
      'hook',
      'leader',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
