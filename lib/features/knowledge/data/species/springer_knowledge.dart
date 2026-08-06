import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> springerKnowledge = [
  KnowledgeRecord(
    id: 'NKB-SPR-IDENTITY-0001',
    species: 'Springer',
    targetSpecies: const ['Springer'],
    category: KnowledgeCategory.identity,
    title: 'Species Overview',
    description:
    'Springer (Elops machnata) is a fast, silvery predator found in estuaries and adjacent surf along the KwaZulu-Natal and Eastern Cape coastline, well known for spectacular jumping runs when hooked.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SPR-001',
        reliability: 0.90,
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
      'springer',
      'estuary',
      'predator',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-SPR-HABITAT-0001',
    species: 'Springer',
    targetSpecies: const ['Springer'],
    category: KnowledgeCategory.habitat,
    title: 'Preferred Habitat',
    description:
    'Springer are commonly found in estuaries and around estuary mouths, moving into adjacent surf when baitfish and prawns are abundant.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SPR-002',
        reliability: 0.89,
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
      'estuary mouth',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-SPR-BEHAVIOUR-0001',
    species: 'Springer',
    targetSpecies: const ['Springer'],
    category: KnowledgeCategory.behaviour,
    title: 'Aerial Fighting Behaviour',
    description:
    'Springer are renowned for spectacular, acrobatic jumps when hooked, frequently throwing the hook mid-air, and require constant rod pressure to land successfully.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SPR-003',
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
      'behaviour',
      'jumping',
      'fight',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-SPR-FEEDING-0001',
    species: 'Springer',
    targetSpecies: const ['Springer'],
    category: KnowledgeCategory.feeding,
    title: 'Feeding Behaviour',
    description:
    'Springer hunt small baitfish and prawns near the surface, often giving away their presence with visible surface activity around estuary mouths.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SPR-004',
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
      'feeding',
      'baitfish',
      'prawn',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-SPR-SEASON-0001',
    species: 'Springer',
    targetSpecies: const ['Springer'],
    category: KnowledgeCategory.seasonality,
    title: 'Seasonal Activity',
    description:
    'Springer are most active during the warmer summer and autumn months, when water temperatures rise and estuary baitfish activity increases.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SPR-005',
        reliability: 0.83,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
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
