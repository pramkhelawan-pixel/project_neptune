import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> spottedGullySharkKnowledge = [
  KnowledgeRecord(
    id: 'NKB-SGS-IDENTITY-0001',
    species: 'Spotted Gully Shark',
    targetSpecies: const ['Spotted Gully Shark'],
    category: KnowledgeCategory.identity,
    title: 'Species Overview',
    description:
    'Spotted Gully Shark (Triakis megalopterus) is a slender, docile shark identified by dark spots scattered along its back. It is a popular catch-and-release sport species along the southern and eastern Cape coastline.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SGS-001',
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
      'Spring',
    ],
    tags: const [
      'identity',
      'spotted gully shark',
      'shark',
      'catch and release',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-SGS-HABITAT-0001',
    species: 'Spotted Gully Shark',
    targetSpecies: const ['Spotted Gully Shark'],
    category: KnowledgeCategory.habitat,
    title: 'Preferred Habitat',
    description:
    'Spotted Gully Sharks favour rocky gullies, kelp beds and surf zones close to reef, where they patrol for prey along the bottom in shallow, sheltered water.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SGS-002',
        reliability: 0.89,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: const [
      'habitat',
      'gully',
      'kelp',
      'reef',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-SGS-BEHAVIOUR-0001',
    species: 'Spotted Gully Shark',
    targetSpecies: const ['Spotted Gully Shark'],
    category: KnowledgeCategory.behaviour,
    title: 'Feeding and Fighting Behaviour',
    description:
    'A docile, bottom-hugging shark that gives a strong, steady fight rather than explosive runs. Most active after dark when it moves into shallow gullies to hunt.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SGS-003',
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
      'Spring',
    ],
    tags: const [
      'behaviour',
      'fight',
      'nocturnal',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-SGS-FEEDING-0001',
    species: 'Spotted Gully Shark',
    targetSpecies: const ['Spotted Gully Shark'],
    category: KnowledgeCategory.feeding,
    title: 'Feeding Behaviour',
    description:
    'Hunts crabs, octopus and small reef fish over rocky and kelp-lined bottom, relying on scent to locate bait in low light or discoloured water.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SGS-004',
        reliability: 0.88,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: const [
      'feeding',
      'octopus',
      'crab',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-SGS-SEASON-0001',
    species: 'Spotted Gully Shark',
    targetSpecies: const ['Spotted Gully Shark'],
    category: KnowledgeCategory.seasonality,
    title: 'Seasonal Activity',
    description:
    'Most consistently caught from autumn through spring, when cooler inshore water temperatures push Spotted Gully Sharks into shallow gullies within casting range.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SGS-005',
        reliability: 0.83,
      ),
    ],
    regions: const [
      'Western Cape',
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
      'autumn',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
