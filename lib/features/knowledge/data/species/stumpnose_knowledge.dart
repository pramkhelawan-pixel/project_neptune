import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> stumpnoseKnowledge = [
  KnowledgeRecord(
    id: 'NKB-STN-IDENTITY-0001',
    species: 'Stumpnose',
    targetSpecies: const ['Stumpnose'],
    category: KnowledgeCategory.identity,
    title: 'Species Overview',
    description:
    'Cape Stumpnose (Rhabdosargus holubi) is a small to medium sparid closely associated with South African estuaries and adjacent surf. It is a popular light-tackle target, particularly for anglers fishing river mouths.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-STN-001',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: const [
      'Spring',
      'Summer',
      'Autumn',
    ],
    tags: const [
      'identity',
      'stumpnose',
      'sparid',
      'estuary',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-STN-HABITAT-0001',
    species: 'Stumpnose',
    targetSpecies: const ['Stumpnose'],
    category: KnowledgeCategory.habitat,
    title: 'Preferred Habitat',
    description:
    'Stumpnose favour estuary mouths and eelgrass beds, moving into adjacent surf when water conditions and tide are favourable.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-STN-002',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: const [
      'Spring',
      'Summer',
    ],
    tags: const [
      'habitat',
      'estuary',
      'eelgrass',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-STN-BEHAVIOUR-0001',
    species: 'Stumpnose',
    targetSpecies: const ['Stumpnose'],
    category: KnowledgeCategory.behaviour,
    title: 'Feeding Behaviour',
    description:
    'Stumpnose are active, opportunistic feeders that move with the tide between estuary channels, eelgrass beds and adjacent surf in search of food.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-STN-003',
        reliability: 0.89,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Spring',
      'Summer',
      'Autumn',
    ],
    tags: const [
      'behaviour',
      'tide',
      'feeding',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-STN-FEEDING-0001',
    species: 'Stumpnose',
    targetSpecies: const ['Stumpnose'],
    category: KnowledgeCategory.feeding,
    title: 'Omnivorous Diet',
    description:
    'Stumpnose feed on prawns, small crabs and mussel, and are also known to graze directly on eelgrass beds within estuaries, making them one of the few genuinely omnivorous surf and estuary targets.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-STN-004',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: const [
      'Spring',
      'Summer',
    ],
    tags: const [
      'feeding',
      'prawn',
      'eelgrass',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-STN-SEASON-0001',
    species: 'Stumpnose',
    targetSpecies: const ['Stumpnose'],
    category: KnowledgeCategory.seasonality,
    title: 'Seasonal Activity',
    description:
    'Stumpnose are most active during the warmer months from spring through to autumn, when estuary water temperatures and prawn activity increase.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-STN-005',
        reliability: 0.84,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Spring',
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
