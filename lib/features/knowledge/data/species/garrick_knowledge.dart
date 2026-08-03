import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> garrickKnowledge = [
  KnowledgeRecord(
    id: 'NKB-GRK-IDENTITY-0001',
    species: 'Garrick',
    targetSpecies: const ['Garrick'],
    category: KnowledgeCategory.identity,
    title: 'Species Overview',
    description:
    'Garrick, also known as Leervis, is a powerful predatory game fish commonly encountered along the South African coastline. It actively hunts schools of baitfish in the surf zone, estuary mouths and along beaches.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GRK-001',
        reliability: 0.91,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
      'Western Cape',
    ],
    seasons: const [
      'Spring',
      'Summer',
      'Autumn',
    ],
    tags: const [
      'identity',
      'garrick',
      'leervis',
      'predator',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 2),
    updatedAt: DateTime(2026, 8, 2),
  ),
  KnowledgeRecord(
    id: 'NKB-GRK-HABITAT-0001',
    species: 'Garrick',
    targetSpecies: const ['Garrick'],
    category: KnowledgeCategory.habitat,
    title: 'Preferred Habitat',
    description:
    'Garrick commonly patrol surf zones, estuary mouths and areas where baitfish congregate. They are frequently found in clean, moving water close to the shoreline.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GRK-002',
        reliability: 0.90,
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
      'habitat',
      'surf',
      'estuary',
      'baitfish',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 2),
    updatedAt: DateTime(2026, 8, 2),
  ),
  KnowledgeRecord(
    id: 'NKB-GRK-BEHAVIOUR-0001',
    species: 'Garrick',
    targetSpecies: const ['Garrick'],
    category: KnowledgeCategory.behaviour,
    title: 'Predatory Behaviour',
    description:
    'Garrick are visual predators that actively hunt baitfish in the surf zone, around estuary mouths and along current lines. They often attack fast-moving prey close to the surface.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GRK-003',
        reliability: 0.92,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
      'Western Cape',
    ],
    seasons: const [
      'Spring',
      'Summer',
      'Autumn',
    ],
    tags: const [
      'behaviour',
      'predator',
      'baitfish',
      'surface feeding',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 2),
    updatedAt: DateTime(2026, 8, 2),
  ),
  KnowledgeRecord(
    id: 'NKB-GRK-FEEDING-0001',
    species: 'Garrick',
    targetSpecies: const ['Garrick'],
    category: KnowledgeCategory.feeding,
    title: 'Feeding Behaviour',
    description:
    'Garrick primarily feed on small baitfish including mullet and other estuarine species. Feeding activity often increases where baitfish are concentrated.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GRK-004',
        reliability: 0.91,
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
      'feeding',
      'baitfish',
      'mullet',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 2),
    updatedAt: DateTime(2026, 8, 2),
  ),
  KnowledgeRecord(
    id: 'NKB-GRK-SEASON-0001',
    species: 'Garrick',
    targetSpecies: const ['Garrick'],
    category: KnowledgeCategory.seasonality,
    title: 'Seasonal Activity',
    description:
    'Garrick are commonly targeted during the warmer months when water temperatures and baitfish activity are favourable.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GRK-005',
        reliability: 0.90,
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
      'spring',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 2),
    updatedAt: DateTime(2026, 8, 2),
  ),
];