import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> spottedGullySharkPresentationKnowledge = [
  KnowledgeRecord(
    id: 'NKB-SGS-PRESENTATION-0001',
    species: 'Spotted Gully Shark',
    targetSpecies: const ['Spotted Gully Shark'],
    category: KnowledgeCategory.presentation,
    title: 'Static Bottom Bait',
    description:
    'A large bait fished hard on the bottom in a known gully, with slack line to a sensitive bite indicator, is the standard presentation for feeding Spotted Gully Sharks.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SGS-011',
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
      'presentation',
      'bottom fishing',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-SGS-PRESENTATION-0002',
    species: 'Spotted Gully Shark',
    targetSpecies: const ['Spotted Gully Shark'],
    category: KnowledgeCategory.presentation,
    title: 'Delayed Strike',
    description:
    'Allow a confirmed take to develop into a steady pull before striking; Spotted Gully Sharks often mouth bait before committing, and an early strike pulls the hook.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SGS-012',
        reliability: 0.81,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
    ],
    tags: const [
      'presentation',
      'strike timing',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
