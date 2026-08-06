import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> duckbillRayExpertTipKnowledge = [
  KnowledgeRecord(
    id: 'NKB-DBR-TIP-0001',
    species: 'Duckbill Ray',
    targetSpecies: const ['Duckbill Ray'],
    category: KnowledgeCategory.technique,
    title: 'Prepare for a Long Fight',
    description:
    'Set the drag firm but not locked and be prepared for a fight that can last twenty minutes or more; pumping steadily rather than pulling hard prevents pulled hooks.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DBR-013',
        reliability: 0.86,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
    ],
    tags: const [
      'technique',
      'fight',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-DBR-TIP-0002',
    species: 'Duckbill Ray',
    targetSpecies: const ['Duckbill Ray'],
    category: KnowledgeCategory.technique,
    title: 'Mind the Venomous Tail Spine',
    description:
    'Approach from the front and never handle the tail; the Duckbill Ray carries a venomous spine capable of causing a serious puncture wound if mishandled.',
    evidenceLevel: EvidenceLevel.regulatory,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DBR-014',
        reliability: 0.92,
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
      'technique',
      'safety',
      'venomous spine',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-DBR-TIP-0003',
    species: 'Duckbill Ray',
    targetSpecies: const ['Duckbill Ray'],
    category: KnowledgeCategory.technique,
    title: 'Release Without Lifting Clear of the Water',
    description:
    'Given its size and weight, a Duckbill Ray should be unhooked and released in the shallows without being lifted clear of the water wherever possible.',
    evidenceLevel: EvidenceLevel.regulatory,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DBR-015',
        reliability: 0.88,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
    ],
    tags: const [
      'technique',
      'fish care',
      'release',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
