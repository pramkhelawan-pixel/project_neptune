import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> whiteSteenbrasHookKnowledge = [
  KnowledgeRecord(
    id: 'NKS-WST-HOOK-0001',
    species: 'White Steenbras',
    targetSpecies: const ['White Steenbras'],
    category: KnowledgeCategory.hook,
    title: '4/0 Circle Hook',
    description:
    'A 4/0 circle hook is well suited to sand prawn and bloodworm presentations for White Steenbras, promoting secure hook-ups suitable for release.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-WST-HOOK-0001',
        reliability: 0.92,
      ),
    ],
    regions: const [
      'Eastern Cape',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'white steenbras',
      'circle hook',
      '4/0',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-WST-HOOK-0002',
    species: 'White Steenbras',
    targetSpecies: const ['White Steenbras'],
    category: KnowledgeCategory.hook,
    title: '6/0 Circle Hook',
    description:
    'A 6/0 circle hook is suitable for larger White Steenbras taken on bigger sand prawn or worm cocktail baits in surf gutters.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-WST-HOOK-0002',
        reliability: 0.86,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
      'Spring',
    ],
    tags: const [
      'white steenbras',
      'circle hook',
      '6/0',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
