import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> eagleRayPresentationKnowledge = [
  KnowledgeRecord(
    id: 'NKB-EGR-PRESENTATION-0001',
    species: 'Eagle Ray',
    targetSpecies: const ['Eagle Ray'],
    category: KnowledgeCategory.presentation,
    title: 'Open Sand Bottom Fishing',
    description:
    'Cast to open sand patches between reef structures rather than directly on the reef; Eagle Rays forage over clean sand where prey is easier to root out.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-EGR-011',
        reliability: 0.84,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
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
    id: 'NKB-EGR-PRESENTATION-0002',
    species: 'Eagle Ray',
    targetSpecies: const ['Eagle Ray'],
    category: KnowledgeCategory.presentation,
    title: 'Prepare for a Fast Take',
    description:
    'Keep the reel in free spool or clicker mode, as the Eagle Ray\'s initial take is fast and can strip line quickly compared to slower-moving ray species.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-EGR-012',
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
      'presentation',
      'strike timing',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
