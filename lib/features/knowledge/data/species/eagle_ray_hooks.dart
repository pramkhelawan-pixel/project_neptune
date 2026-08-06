import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> eagleRayHookKnowledge = [
  KnowledgeRecord(
    id: 'NKB-EGR-HOOK-0001',
    species: 'Eagle Ray',
    targetSpecies: const ['Eagle Ray'],
    category: KnowledgeCategory.hook,
    title: 'Circle Hook 4/0-6/0',
    description:
    'A circle hook in 4/0-6/0 suits the Eagle Ray\'s feeding style and reduces the risk of deep hooking during its fast initial take.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-EGR-009',
        reliability: 0.85,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
      'Spring',
    ],
    tags: const [
      'hook',
      'circle hook',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-EGR-HOOK-0002',
    species: 'Eagle Ray',
    targetSpecies: const ['Eagle Ray'],
    category: KnowledgeCategory.hook,
    title: '60lb Monofilament Leader',
    description:
    'A 60lb monofilament leader provides enough abrasion resistance for sand and shell without adding unnecessary bulk to the terminal rig.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-EGR-010',
        reliability: 0.80,
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
      'hook',
      'leader',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
