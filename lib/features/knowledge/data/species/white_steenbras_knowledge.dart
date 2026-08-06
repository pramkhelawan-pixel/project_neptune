import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> whiteSteenbrasKnowledge = [
  KnowledgeRecord(
    id: 'NKB-WST-IDENTITY-0001',
    species: 'White Steenbras',
    targetSpecies: const ['White Steenbras'],
    category: KnowledgeCategory.identity,
    title: 'Species Overview',
    description:
    'White Steenbras (Lithognathus lithognathus) is a large surf-zone sparid prized by South African surf anglers, recognisable by its elongated snout adapted for probing sand.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-WST-001',
        reliability: 0.91,
      ),
    ],
    regions: const [
      'Eastern Cape',
      'Western Cape',
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: const [
      'identity',
      'white steenbras',
      'sparid',
      'surf',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-WST-HABITAT-0001',
    species: 'White Steenbras',
    targetSpecies: const ['White Steenbras'],
    category: KnowledgeCategory.habitat,
    title: 'Preferred Habitat',
    description:
    'White Steenbras favour sandy surf gutters and beaches, often patrolling channels between sandbanks in search of buried prey.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-WST-002',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'Eastern Cape',
      'Western Cape',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'habitat',
      'surf gutter',
      'sandy beach',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-WST-BEHAVIOUR-0001',
    species: 'White Steenbras',
    targetSpecies: const ['White Steenbras'],
    category: KnowledgeCategory.behaviour,
    title: 'Nocturnal Feeding Behaviour',
    description:
    'Larger White Steenbras are typically most active after dark, moving into surf gutters to feed once light levels drop.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-WST-003',
        reliability: 0.89,
      ),
    ],
    regions: const [
      'Eastern Cape',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'behaviour',
      'night',
      'surf gutter',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-WST-FEEDING-0001',
    species: 'White Steenbras',
    targetSpecies: const ['White Steenbras'],
    category: KnowledgeCategory.feeding,
    title: 'Feeding Behaviour',
    description:
    'White Steenbras probe sandy surf gutters with an elongated snout, feeding primarily on sand prawns and marine worms buried beneath the sand.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-WST-004',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'Eastern Cape',
      'Western Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
    ],
    tags: const [
      'feeding',
      'sand prawn',
      'worm',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-WST-CONSERVATION-0001',
    species: 'White Steenbras',
    targetSpecies: const ['White Steenbras'],
    category: KnowledgeCategory.conservation,
    title: 'Conservation Status',
    description:
    'White Steenbras is a slow-growing, historically overfished species and has been subject to conservation regulation in South Africa. Anglers should always confirm current size and bag limits before targeting this species.',
    evidenceLevel: EvidenceLevel.regulatory,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Regulatory Guidance',
        reference: 'NKB-WST-006',
        reliability: 0.88,
      ),
    ],
    regions: const [
      'South Africa',
    ],
    seasons: const [],
    tags: const [
      'conservation',
      'regulations',
      'white steenbras',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-WST-SEASON-0001',
    species: 'White Steenbras',
    targetSpecies: const ['White Steenbras'],
    category: KnowledgeCategory.seasonality,
    title: 'Seasonal Activity',
    description:
    'White Steenbras fishing is traditionally most productive during the cooler autumn, winter and spring months in the surf zone.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-WST-005',
        reliability: 0.83,
      ),
    ],
    regions: const [
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: const [
      'season',
      'winter',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
