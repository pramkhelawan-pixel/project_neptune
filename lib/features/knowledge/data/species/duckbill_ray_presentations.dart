import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> duckbillRayPresentationKnowledge = [
  KnowledgeRecord(
    id: 'NKB-DBR-PRESENTATION-0001',
    species: 'Duckbill Ray',
    targetSpecies: const ['Duckbill Ray'],
    category: KnowledgeCategory.presentation,
    title: 'Static Bottom Bait at Night',
    description:
    'A static bait fished hard on the bottom in an estuary channel or surf gutter after dark is the standard, most productive presentation for Duckbill Ray.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DBR-011',
        reliability: 0.85,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
    ],
    tags: const [
      'presentation',
      'bottom fishing',
      'night fishing',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-DBR-PRESENTATION-0002',
    species: 'Duckbill Ray',
    targetSpecies: const ['Duckbill Ray'],
    category: KnowledgeCategory.presentation,
    title: 'Heavy Sinker to Hold Bottom',
    description:
    'Use a heavy grip or star sinker to keep bait anchored in estuary current, ensuring scent stays concentrated in one spot for cruising rays to find.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DBR-012',
        reliability: 0.77,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
    ],
    tags: const [
      'presentation',
      'sinker',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
