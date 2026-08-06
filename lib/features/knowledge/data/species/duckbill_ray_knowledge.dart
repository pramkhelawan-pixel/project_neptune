import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> duckbillRayKnowledge = [
  KnowledgeRecord(
    id: 'NKB-DBR-IDENTITY-0001',
    species: 'Duckbill Ray',
    targetSpecies: const ['Duckbill Ray'],
    category: KnowledgeCategory.identity,
    title: 'Species Overview',
    description:
    'Duckbill Ray (Aetomylaeus bovinus) is a large, heavy-bodied ray named for its duck-bill-shaped snout, popular as an endurance catch-and-release target in KwaZulu-Natal and Eastern Cape estuaries.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DBR-001',
        reliability: 0.88,
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
      'identity',
      'duckbill ray',
      'ray',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-DBR-HABITAT-0001',
    species: 'Duckbill Ray',
    targetSpecies: const ['Duckbill Ray'],
    category: KnowledgeCategory.habitat,
    title: 'Preferred Habitat',
    description:
    'Found in estuaries, sandy surf gutters and sheltered bays, Duckbill Rays root through soft bottom in search of buried shellfish.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DBR-002',
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
      'habitat',
      'estuary',
      'sand',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-DBR-BEHAVIOUR-0001',
    species: 'Duckbill Ray',
    targetSpecies: const ['Duckbill Ray'],
    category: KnowledgeCategory.behaviour,
    title: 'Fighting Behaviour',
    description:
    'Produces long, dogged runs and uses its broad body to generate significant drag, resulting in extended fights that test tackle and stamina alike.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DBR-003',
        reliability: 0.86,
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
      'behaviour',
      'fight',
      'endurance',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-DBR-FEEDING-0001',
    species: 'Duckbill Ray',
    targetSpecies: const ['Duckbill Ray'],
    category: KnowledgeCategory.feeding,
    title: 'Feeding Behaviour',
    description:
    'Uses flattened crushing plates to feed on mussels, crabs and other shelled invertebrates dug out of sand and mud, foraging most actively at night.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DBR-004',
        reliability: 0.83,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
    ],
    tags: const [
      'feeding',
      'mussel',
      'crab',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-DBR-SEASON-0001',
    species: 'Duckbill Ray',
    targetSpecies: const ['Duckbill Ray'],
    category: KnowledgeCategory.seasonality,
    title: 'Seasonal Activity',
    description:
    'Most commonly encountered in estuaries and warm surf during summer and autumn when water temperatures rise and shellfish beds are most productive.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DBR-005',
        reliability: 0.79,
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
      'season',
      'summer',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
