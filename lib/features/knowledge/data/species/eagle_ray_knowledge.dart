import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> eagleRayKnowledge = [
  KnowledgeRecord(
    id: 'NKB-EGR-IDENTITY-0001',
    species: 'Eagle Ray',
    targetSpecies: const ['Eagle Ray'],
    category: KnowledgeCategory.identity,
    title: 'Species Overview',
    description:
    'Eagle Ray (Myliobatis aquila) is a diamond-bodied ray with a distinctive pointed snout, known for fast surface runs and occasional leaps when hooked in the surf zone.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-EGR-001',
        reliability: 0.87,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
    ],
    seasons: const [
      'Spring',
      'Summer',
    ],
    tags: const [
      'identity',
      'eagle ray',
      'ray',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-EGR-HABITAT-0001',
    species: 'Eagle Ray',
    targetSpecies: const ['Eagle Ray'],
    category: KnowledgeCategory.habitat,
    title: 'Preferred Habitat',
    description:
    'Patrols sandy bays, surf gutters and shallow reef margins in search of buried molluscs and crustaceans close to shore.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-EGR-002',
        reliability: 0.86,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
      'Spring',
      'Summer',
    ],
    tags: const [
      'habitat',
      'sandy bay',
      'reef',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-EGR-BEHAVIOUR-0001',
    species: 'Eagle Ray',
    targetSpecies: const ['Eagle Ray'],
    category: KnowledgeCategory.behaviour,
    title: 'Fighting Behaviour',
    description:
    'Unlike many bottom-hugging rays, the Eagle Ray gives fast, powerful surface runs and will occasionally leap clear of the water when hooked, making for a lively fight.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-EGR-003',
        reliability: 0.87,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
    ],
    seasons: const [
      'Spring',
      'Summer',
    ],
    tags: const [
      'behaviour',
      'fight',
      'runs',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-EGR-FEEDING-0001',
    species: 'Eagle Ray',
    targetSpecies: const ['Eagle Ray'],
    category: KnowledgeCategory.feeding,
    title: 'Feeding Behaviour',
    description:
    'Crushes buried molluscs and crustaceans with flattened plate-like teeth, foraging over open sand within easy casting range of the beach.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-EGR-004',
        reliability: 0.83,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
      'Spring',
    ],
    tags: const [
      'feeding',
      'mollusc',
      'crustacean',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-EGR-SEASON-0001',
    species: 'Eagle Ray',
    targetSpecies: const ['Eagle Ray'],
    category: KnowledgeCategory.seasonality,
    title: 'Seasonal Activity',
    description:
    'Most frequently encountered in the surf zone during spring and summer as inshore water warms and forage species become more active on the sand.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-EGR-005',
        reliability: 0.79,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
    ],
    seasons: const [
      'Spring',
      'Summer',
    ],
    tags: const [
      'season',
      'spring',
      'summer',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
