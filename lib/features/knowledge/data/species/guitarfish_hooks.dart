import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> guitarfishHookKnowledge = [
  KnowledgeRecord(
    id: 'NKB-GTF-HOOK-0001',
    species: 'Guitarfish',
    targetSpecies: const ['Guitarfish'],
    category: KnowledgeCategory.hook,
    title: 'Hook Size 1/0-2/0',
    description:
    'A light hook in 1/0-2/0 suits the Guitarfish\'s small mouth and light-tackle presentation, giving clean, easy-to-remove hook-ups.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GTF-009',
        reliability: 0.87,
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
      'hook',
      'light tackle',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-GTF-HOOK-0002',
    species: 'Guitarfish',
    targetSpecies: const ['Guitarfish'],
    category: KnowledgeCategory.hook,
    title: 'No Wire Required',
    description:
    'Being toothless, the Guitarfish needs no wire trace; a light fluorocarbon leader is sufficient and improves presentation and bite detection.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GTF-010',
        reliability: 0.81,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Autumn',
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
