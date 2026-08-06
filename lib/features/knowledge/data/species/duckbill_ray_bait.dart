import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> duckbillRayBaitKnowledge = [
  KnowledgeRecord(
    id: 'NKB-DBR-BAIT-0001',
    species: 'Duckbill Ray',
    targetSpecies: const ['Duckbill Ray'],
    category: KnowledgeCategory.bait,
    title: 'Sand Prawn',
    description:
    'Fresh sand prawn matches the Duckbill Ray\'s natural crustacean diet and is the most consistent bait choice in estuary and surf gutter marks.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DBR-006',
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
      'bait',
      'sand prawn',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-DBR-BAIT-0002',
    species: 'Duckbill Ray',
    targetSpecies: const ['Duckbill Ray'],
    category: KnowledgeCategory.bait,
    title: 'Black Mussel',
    description:
    'Shelled black mussel presented on a strong hook is a proven bait, matching the shellfish that make up much of the Duckbill Ray\'s natural diet.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DBR-007',
        reliability: 0.83,
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
      'bait',
      'mussel',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-DBR-BAIT-0003',
    species: 'Duckbill Ray',
    targetSpecies: const ['Duckbill Ray'],
    category: KnowledgeCategory.bait,
    title: 'Whole Crab',
    description:
    'A whole crab fished hard on the bottom is a natural, high-scent bait that works well in known Duckbill Ray marks after dark.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DBR-008',
        reliability: 0.78,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
    ],
    tags: const [
      'bait',
      'crab',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
