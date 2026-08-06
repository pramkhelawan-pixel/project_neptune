import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> stumpnoseHookKnowledge = [
  KnowledgeRecord(
    id: 'NKS-STN-HOOK-0001',
    species: 'Stumpnose',
    targetSpecies: const ['Stumpnose'],
    category: KnowledgeCategory.hook,
    title: 'Size 2 Long Shank Hook',
    description:
    'A size 2 long shank hook works well with live mud prawn, allowing a natural presentation while remaining easy to unhook for release.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-STN-HOOK-0001',
        reliability: 0.91,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Spring',
      'Summer',
    ],
    tags: const [
      'stumpnose',
      'long shank hook',
      'size 2',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-STN-HOOK-0002',
    species: 'Stumpnose',
    targetSpecies: const ['Stumpnose'],
    category: KnowledgeCategory.hook,
    title: '1/0 Circle Hook',
    description:
    'A small 1/0 circle hook is suitable for larger Stumpnose taken on crab or mussel, promoting safe hook-ups suitable for catch and release.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-STN-HOOK-0002',
        reliability: 0.85,
      ),
    ],
    regions: const [
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
    ],
    tags: const [
      'stumpnose',
      'circle hook',
      '1/0',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
