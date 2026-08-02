import '../../domain/evidence_level.dart';
import '../../domain/knowledge_category.dart';
import '../../domain/knowledge_record.dart';
import '../../domain/knowledge_source.dart';

final garrickKnowledge = <KnowledgeRecord>[
  KnowledgeRecord(
    id: 'NKB-GRK-IDENTITY-0001',
    species: 'Garrick',
    category: KnowledgeCategory.identity,
    title: 'Species Overview',
    description:
    'Garrick, also known as Leervis, is a powerful predatory game fish commonly encountered along the South African coastline. It actively hunts schools of baitfish in the surf zone, estuary mouths and along beaches.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.94,
    sources: [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GRK-001',
        reliability: 0.91,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
      'Eastern Cape',
      'Western Cape',
    ],
    seasons: [
      'Spring',
      'Summer',
      'Autumn',
    ],
    tags: [
      'identity',
      'garrick',
      'leervis',
      'predator',
    ],
    lastUpdated: DateTime(
      2026,
      8,
      2,
    ),
  ),

  KnowledgeRecord(
    id: 'NKB-GRK-HABITAT-0001',
    species: 'Garrick',
    category: KnowledgeCategory.habitat,
    title: 'Preferred Habitat',
    description:
    'Garrick commonly patrol surf zones, estuary mouths and areas where baitfish congregate. They are frequently found in clean, moving water close to the shoreline.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.91,
    sources: [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GRK-002',
        reliability: 0.90,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
    ],
    seasons: [
      'Spring',
      'Summer',
      'Autumn',
    ],
    tags: [
      'habitat',
      'surf',
      'estuary',
      'baitfish',
    ],
    lastUpdated: DateTime(
      2026,
      8,
      2,
    ),
  ),

  KnowledgeRecord(
    id: 'NKB-GRK-BEHAVIOUR-0001',
    species: 'Garrick',
    category: KnowledgeCategory.behaviour,
    title: 'Predatory Behaviour',
    description:
    'Garrick are visual predators that actively hunt baitfish in the surf zone, around estuary mouths and along current lines. They often attack fast-moving prey close to the surface.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.93,
    sources: [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GRK-003',
        reliability: 0.92,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
      'Eastern Cape',
      'Western Cape',
    ],
    seasons: [
      'Spring',
      'Summer',
      'Autumn',
    ],
    tags: [
      'behaviour',
      'predator',
      'baitfish',
      'surface feeding',
    ],
    lastUpdated: DateTime(
      2026,
      8,
      2,
    ),
  ),

  KnowledgeRecord(
    id: 'NKB-GRK-FEEDING-0001',
    species: 'Garrick',
    category: KnowledgeCategory.behaviour,
    title: 'Feeding Behaviour',
    description:
    'Garrick primarily feed on small baitfish including mullet and other estuarine species. Feeding activity often increases where baitfish are concentrated.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.92,
    sources: [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GRK-004',
        reliability: 0.91,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
    ],
    seasons: [
      'Spring',
      'Summer',
      'Autumn',
    ],
    tags: [
      'feeding',
      'baitfish',
      'mullet',
    ],
    lastUpdated: DateTime(
      2026,
      8,
      2,
    ),
  ),

  KnowledgeRecord(
    id: 'NKB-GRK-SEASON-0001',
    species: 'Garrick',
    category: KnowledgeCategory.season,
    title: 'Seasonal Activity',
    description:
    'Garrick are commonly targeted during the warmer months when water temperatures and baitfish activity are favourable.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.90,
    sources: [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GRK-005',
        reliability: 0.90,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
    ],
    seasons: [
      'Spring',
      'Summer',
      'Autumn',
    ],
    tags: [
      'season',
      'summer',
      'spring',
    ],
    lastUpdated: DateTime(
      2026,
      8,
      2,
    ),
  ),
];