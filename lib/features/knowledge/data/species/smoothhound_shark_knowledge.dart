import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> smoothhoundSharkKnowledge = [
  KnowledgeRecord(
    id: 'NKB-SHS-IDENTITY-0001',
    species: 'Smoothhound Shark',
    targetSpecies: const ['Smoothhound Shark'],
    category: KnowledgeCategory.identity,
    title: 'Species Overview',
    description:
    'Smoothhound Shark (Mustelus mustelus) is a small, slender shark with blunt, crushing teeth, popular as a light-tackle catch-and-release species on Western and Eastern Cape beaches.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SHS-001',
        reliability: 0.89,
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
      'identity',
      'smoothhound',
      'shark',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-SHS-HABITAT-0001',
    species: 'Smoothhound Shark',
    targetSpecies: const ['Smoothhound Shark'],
    category: KnowledgeCategory.habitat,
    title: 'Preferred Habitat',
    description:
    'Found over sandy bays, estuaries and shallow surf flats, Smoothhounds move into shallow water to forage as the tide pushes in.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SHS-002',
        reliability: 0.87,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'habitat',
      'sandy bay',
      'estuary',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-SHS-BEHAVIOUR-0001',
    species: 'Smoothhound Shark',
    targetSpecies: const ['Smoothhound Shark'],
    category: KnowledgeCategory.behaviour,
    title: 'Feeding and Fighting Behaviour',
    description:
    'A confident biter that gives quick, energetic runs on light tackle, making it a favourite for anglers wanting a reliable fight without heavy gear.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SHS-003',
        reliability: 0.88,
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
      'behaviour',
      'fight',
      'light tackle',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-SHS-FEEDING-0001',
    species: 'Smoothhound Shark',
    targetSpecies: const ['Smoothhound Shark'],
    category: KnowledgeCategory.feeding,
    title: 'Feeding Behaviour',
    description:
    'Forages over sand and mud for crabs, shrimp and small invertebrates, using blunt crushing teeth rather than hunting fish by pursuit.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SHS-004',
        reliability: 0.85,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'feeding',
      'crab',
      'shrimp',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-SHS-SEASON-0001',
    species: 'Smoothhound Shark',
    targetSpecies: const ['Smoothhound Shark'],
    category: KnowledgeCategory.seasonality,
    title: 'Seasonal Activity',
    description:
    'Most active and consistently caught during the cooler winter and spring months when they move into shallow bays and estuaries in greater numbers.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SHS-005',
        reliability: 0.82,
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
      'season',
      'winter',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-SHS-CONSERVATION-0001',
    species: 'Smoothhound Shark',
    targetSpecies: const ['Smoothhound Shark'],
    category: KnowledgeCategory.conservation,
    title: 'Bag Limit: Recreational Catch Restrictions',
    description:
    'South African regulations limit recreational anglers to 1 shark/ray per person per day (Class Chondrichthyes). Practice catch-and-release.',
    evidenceLevel: EvidenceLevel.regulatory,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Regulatory Guidance',
        reference: 'NKB-SHS-016',
        reliability: 0.89,
      ),
    ],
    regions: const ['South Africa'],
    seasons: const [],
    tags: const ['conservation', 'regulations', 'bag limit', 'smoothhound shark'],
    verified: true,
    createdAt: DateTime(2026, 8, 8),
    updatedAt: DateTime(2026, 8, 8),
  ),
];
