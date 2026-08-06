import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> springerHookKnowledge = [
  KnowledgeRecord(
    id: 'NKS-SPR-HOOK-0001',
    species: 'Springer',
    targetSpecies: const ['Springer'],
    category: KnowledgeCategory.hook,
    title: '1/0 Fine Wire Hook',
    description:
    'A 1/0 fine wire hook allows live prawn to swim naturally and improves hook penetration against the Springer\'s notoriously bony mouth.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SPR-HOOK-0001',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
    ],
    tags: const [
      'springer',
      'fine wire hook',
      '1/0',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-SPR-HOOK-0002',
    species: 'Springer',
    targetSpecies: const ['Springer'],
    category: KnowledgeCategory.hook,
    title: '2/0 Fine Wire Hook',
    description:
    'A 2/0 fine wire hook is suitable when presenting a small live mullet for larger Springer near estuary channels.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SPR-HOOK-0002',
        reliability: 0.84,
      ),
    ],
    regions: const [
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
    ],
    tags: const [
      'springer',
      'fine wire hook',
      '2/0',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
