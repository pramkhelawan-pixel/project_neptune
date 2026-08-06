import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> galjoenKnowledge = [
  KnowledgeRecord(
    id: 'NKB-GLJ-IDENTITY-0001',
    species: 'Galjoen',
    targetSpecies: const ['Galjoen'],
    category: KnowledgeCategory.identity,
    title: 'Species Overview',
    description:
    'Galjoen (Dichistius capensis) is South Africa\'s national fish, endemic to the region\'s coastline. It is closely associated with rough, turbulent surf and rocky shorelines.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GLJ-001',
        reliability: 0.95,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: const [
      'identity',
      'galjoen',
      'national fish',
      'endemic',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-GLJ-HABITAT-0001',
    species: 'Galjoen',
    targetSpecies: const ['Galjoen'],
    category: KnowledgeCategory.habitat,
    title: 'Preferred Habitat',
    description:
    'Galjoen are found in rough, wave-washed surf zones and rocky gullies, typically holding in turbulent white water rather than calm, clean conditions.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GLJ-002',
        reliability: 0.92,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
    ],
    seasons: const [
      'Winter',
      'Spring',
    ],
    tags: const [
      'habitat',
      'white water',
      'rocky surf',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-GLJ-BEHAVIOUR-0001',
    species: 'Galjoen',
    targetSpecies: const ['Galjoen'],
    category: KnowledgeCategory.behaviour,
    title: 'Rough Water Feeding Behaviour',
    description:
    'Unlike most surf species, Galjoen feed most actively in rough, turbulent conditions, often biting best directly after a cold front has generated fresh groundswell.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GLJ-003',
        reliability: 0.91,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'behaviour',
      'rough water',
      'cold front',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-GLJ-FEEDING-0001',
    species: 'Galjoen',
    targetSpecies: const ['Galjoen'],
    category: KnowledgeCategory.feeding,
    title: 'Feeding Behaviour',
    description:
    'Galjoen feed on red bait, black mussel and sea lice dislodged from rocks by wave action, foraging actively within the turbulence of the surf zone.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GLJ-004',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
    ],
    tags: const [
      'feeding',
      'red bait',
      'mussel',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-GLJ-SEASON-0001',
    species: 'Galjoen',
    targetSpecies: const ['Galjoen'],
    category: KnowledgeCategory.seasonality,
    title: 'Seasonal Activity',
    description:
    'Galjoen are most commonly targeted during the cooler autumn to spring months, when cold fronts regularly generate the rough surf conditions they favour.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GLJ-005',
        reliability: 0.85,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: const [
      'season',
      'winter',
      'cold front',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
