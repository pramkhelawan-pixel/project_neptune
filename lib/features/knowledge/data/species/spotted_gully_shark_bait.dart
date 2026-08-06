import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> spottedGullySharkBaitKnowledge = [
  KnowledgeRecord(
    id: 'NKB-SGS-BAIT-0001',
    species: 'Spotted Gully Shark',
    targetSpecies: const ['Spotted Gully Shark'],
    category: KnowledgeCategory.bait,
    title: 'Fresh Chokka (Squid)',
    description:
    'Fresh chokka is the standard bait for Spotted Gully Shark, holding well on the hook and releasing a strong scent trail that draws sharks in from a distance at night.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SGS-006',
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
      'bait',
      'chokka',
      'squid',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-SGS-BAIT-0002',
    species: 'Spotted Gully Shark',
    targetSpecies: const ['Spotted Gully Shark'],
    category: KnowledgeCategory.bait,
    title: 'Mackerel Head or Cutlet',
    description:
    'An oily mackerel head or cutlet is a proven alternative bait, particularly effective when fished hard on the bottom in a gully during a low-light bite window.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SGS-007',
        reliability: 0.84,
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
      'bait',
      'mackerel',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-SGS-BAIT-0003',
    species: 'Spotted Gully Shark',
    targetSpecies: const ['Spotted Gully Shark'],
    category: KnowledgeCategory.bait,
    title: 'Whole Small Octopus',
    description:
    'A whole small octopus mimics a natural prey item and is a high-confidence bait choice in known gully-shark marks, particularly over rocky and kelp-lined bottom.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SGS-008',
        reliability: 0.80,
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
      'bait',
      'octopus',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
