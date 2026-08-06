import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> smoothhoundSharkHookKnowledge = [
  KnowledgeRecord(
    id: 'NKB-SHS-HOOK-0001',
    species: 'Smoothhound Shark',
    targetSpecies: const ['Smoothhound Shark'],
    category: KnowledgeCategory.hook,
    title: 'Circle Hook 2/0-4/0',
    description:
    'A light circle hook in 2/0-4/0 is well matched to the Smoothhound\'s small mouth and sets cleanly for an easy, fast release.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SHS-009',
        reliability: 0.88,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
      'Winter',
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
    id: 'NKB-SHS-HOOK-0002',
    species: 'Smoothhound Shark',
    targetSpecies: const ['Smoothhound Shark'],
    category: KnowledgeCategory.hook,
    title: 'No Wire Required',
    description:
    'Blunt, crushing teeth mean a wire trace is unnecessary; a light fluorocarbon leader is sufficient and improves bite detection on light tackle.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SHS-010',
        reliability: 0.81,
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
      'hook',
      'leader',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
