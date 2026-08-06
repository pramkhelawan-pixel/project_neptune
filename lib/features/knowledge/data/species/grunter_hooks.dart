import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> grunterHookKnowledge = [
  KnowledgeRecord(
    id: 'NKS-GRN-HOOK-0001',
    species: 'Grunter',
    targetSpecies: const ['Grunter'],
    category: KnowledgeCategory.hook,
    title: 'Size 1 Long Shank Hook',
    description:
    'A size 1 long shank hook presents live mud prawn naturally while remaining easy to remove for safe release.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRN-HOOK-0001',
        reliability: 0.92,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
    ],
    tags: const [
      'grunter',
      'long shank hook',
      'size 1',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-GRN-HOOK-0002',
    species: 'Grunter',
    targetSpecies: const ['Grunter'],
    category: KnowledgeCategory.hook,
    title: '1/0 Circle Hook',
    description:
    'A 1/0 circle hook is effective for larger Grunter, promoting a secure hook-set while fishing live prawn or bloodworm in estuary channels.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRN-HOOK-0002',
        reliability: 0.87,
      ),
    ],
    regions: const [
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
    ],
    tags: const [
      'grunter',
      'circle hook',
      '1/0',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
